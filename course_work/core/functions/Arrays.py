from llvmlite import ir
from core.functions.Utils import *
from core.PascalTypes import *

def declare_puts(module):
    puts_ty = ir.FunctionType(ir.IntType(32), [ir.PointerType(ir.IntType(8))], var_arg=False)
    return module.globals.get('puts') or ir.Function(module, puts_ty, name="puts")

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

def arrayElementAccess(ctx, self, array_info, array_ptr, indices, module):
    new_array_info = None
    if len(indices) > len(array_info):
        self.add_error(ctx, f"Размерность массива неверна. Необходимо указать {len(array_info)} индексов, а не {len(indices)}")
    elif len(indices) < len(array_info):
        new_array_info = array_info[len(indices):]
        array_info = array_info[:len(indices)]

    cond = build_bounds_check_condition(self.getBuilder(), indices, array_info)

    then_block = self.getBuilder().append_basic_block("access_ok")
    else_block = self.getBuilder().append_basic_block("access_fail")
    cont_block = self.getBuilder().append_basic_block("access_continue")

    self.getBuilder().cbranch(cond, then_block, else_block)

    self.getBuilder().position_at_start(then_block)
    elem_ptr = build_element_gep(self.getBuilder(), array_ptr, indices, array_info)
    self.getBuilder().branch(cont_block)
    then_block_end = self.getBuilder().block

    self.getBuilder().position_at_start(else_block)
    handle_out_of_bounds(self.getBuilder(), module)
    null_ptr = ir.Constant(elem_ptr.type, None)
    self.getBuilder().branch(cont_block)
    else_block_end = self.getBuilder().block

    self.getBuilder().position_at_start(cont_block)
    phi = self.getBuilder().phi(elem_ptr.type, name="final_elem_ptr")
    phi.add_incoming(elem_ptr, then_block_end)
    phi.add_incoming(null_ptr, else_block_end)

    return phi, new_array_info