from llvmlite import ir

def declare_puts(module):
    puts_ty = ir.FunctionType(ir.IntType(32), [ir.PointerType(ir.IntType(8))], var_arg=False)
    return module.globals.get('puts') or ir.Function(module, puts_ty, name="puts")

def get_or_create_global_string(module, builder, string_val, name="str"):
    if name in module.globals:
        global_str = module.get_global(name)
    else:
        str_bytes = bytearray(string_val.encode("utf8")) + b"\00"
        str_type = ir.ArrayType(ir.IntType(8), len(str_bytes))
        global_str = ir.GlobalVariable(module, str_type, name=name)
        global_str.linkage = 'internal'
        global_str.global_constant = True
        global_str.initializer = ir.Constant(str_type, list(map(ir.IntType(8), str_bytes)))
    zero = ir.Constant(ir.IntType(32), 0)
    return builder.gep(global_str, [zero, zero], inbounds=True, name=f"{name}_ptr")

def declare_trap(module):
    trap_ty = ir.FunctionType(ir.VoidType(), [])
    return module.globals.get('llvm.trap') or ir.Function(module, trap_ty, name="llvm.trap")

def build_bounds_check_condition(builder, indices, array_info):
    all_dim_cond = None
    for i in range(len(indices)):
        val = indices[i]
        lower = ir.Constant(val.type, array_info[i][0])
        upper = ir.Constant(val.type, array_info[i][1])
        cond_lower = builder.icmp_unsigned('>=', val, lower)
        cond_upper = builder.icmp_unsigned('<=', val, upper)
        cond = builder.and_(cond_lower, cond_upper)
        all_dim_cond = cond if all_dim_cond is None else builder.and_(all_dim_cond, cond)
    return all_dim_cond

def build_element_gep(builder, array_ptr, indices, array_info):
    zero = ir.Constant(ir.IntType(32), 0)
    gep_indices = [zero]
    for i in range(len(indices)):
        offset = builder.sub(indices[i], ir.Constant(indices[i].type, array_info[i][0]))
        gep_indices.append(offset)
    return builder.gep(array_ptr, gep_indices, name="elem_ptr")

def handle_out_of_bounds(builder, module):
    puts = declare_puts(module)
    msg_ptr = get_or_create_global_string(module, builder, "Out of bounds error", "out_of_bounds_err_str")
    builder.call(puts, [msg_ptr])
    trap = declare_trap(module)
    builder.call(trap, [])

def arrayElementAccess(builder, array_info, array_ptr, indices, module):
    if len(indices) != len(array_info):
        raise TypeError(f"Размерность массива неверна. Необходимо указать {len(array_info)} индексов, а не {len(indices)}")

    cond = build_bounds_check_condition(builder, indices, array_info)

    then_block = builder.append_basic_block("access_ok")
    else_block = builder.append_basic_block("access_fail")
    cont_block = builder.append_basic_block("access_continue")

    builder.cbranch(cond, then_block, else_block)

    builder.position_at_start(then_block)
    elem_ptr = build_element_gep(builder, array_ptr, indices, array_info)
    builder.branch(cont_block)
    then_block_end = builder.block

    builder.position_at_start(else_block)
    handle_out_of_bounds(builder, module)
    null_ptr = ir.Constant(elem_ptr.type, None)
    builder.branch(cont_block)
    else_block_end = builder.block

    builder.position_at_start(cont_block)
    phi = builder.phi(elem_ptr.type, name="final_elem_ptr")
    phi.add_incoming(elem_ptr, then_block_end)
    phi.add_incoming(null_ptr, else_block_end)

    return phi