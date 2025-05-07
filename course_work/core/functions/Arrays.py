from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def get_or_declare_error_function(module):
    if "handle_array_error" in module.globals:
        return module.globals["handle_array_error"]

    void_type = ir.VoidType()
    char_ptr_type = ir.PointerType(ir.IntType(8))
    func_type = ir.FunctionType(void_type, [char_ptr_type])

    func = ir.Function(module, func_type, name="handle_array_error")
    block = func.append_basic_block("entry")
    builder = ir.IRBuilder(block)

    abort_type = ir.FunctionType(void_type, [])
    abort = ir.Function(module, abort_type, name="abort")
    builder.call(abort, [])
    builder.unreachable()

    return func

def generate_bounds_check(builder, array_info, indices, error_block):
    for idx, (index_val, (lower, upper)) in enumerate(zip(indices, array_info)):
        lower_check = builder.icmp_signed('<', index_val,
                                         ir.Constant(index_val.type, lower))
        upper_check = builder.icmp_signed('>', index_val,
                                        ir.Constant(index_val.type, upper))
        out_of_bounds = builder.or_(lower_check, upper_check)

        with builder.if_then(out_of_bounds):
            builder.branch(error_block)

def arrayElementAccess(builder, array_info, array_ptr, indices):
    # normal_block = builder.append_basic_block("array_access_normal")
    # error_block = builder.append_basic_block("array_access_error")

    # generate_bounds_check(builder, array_info, indices, error_block)

    # builder.branch(normal_block)

    # builder.position_at_end(error_block)
    # error_func = get_or_declare_error_function(builder.module)
    # builder.call(error_func, [builder.global_string("Array bounds error")])
    # builder.unreachable()

    # builder.position_at_end(normal_block)
    # gep_indices = [ir.Constant(ir.IntType(32), 0)] + list(indices)
    # print(gep_indices)
    # elem_ptr = builder.gep(array_ptr, gep_indices)
    zero = ir.Constant(ir.IntType(32), 0)
    ind_list = [zero]
    print(indices)
    exp = builder.sub(indices[0], ir.Constant(indices[0].type, array_info[0][0]))
    for i in range(1, len(indices)):
        mul = builder.sub(ir.Constant(exp.type, array_info[i][1]), ir.Constant(exp.type, array_info[i][0]))
        mul = builder.add(mul, ir.Constant(exp.type, 1))
        exp = builder.mul(exp, mul)
        exp_next = builder.sub(indices[i], ir.Constant(indices[i].type, array_info[i][0]))
        exp = builder.add(exp, exp_next)

    print(f"EXPR {exp}")

    ind_list.append(exp)

    elem_ptr = builder.gep(array_ptr, ind_list)
    return elem_ptr