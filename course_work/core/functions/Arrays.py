from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def arrayElementAccess(builder, array_info, array_ptr, indices):
    zero = ir.Constant(ir.IntType(32), 0)
    ind_list = [zero]
    for i in range(len(indices)):
        exp = builder.sub(indices[i], ir.Constant(indices[i].type, array_info[i][0]))
        ind_list.append(exp)

    elem_ptr = builder.gep(array_ptr, ind_list)
    return elem_ptr