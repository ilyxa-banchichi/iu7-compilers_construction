import llvmlite.ir as ir
from core.PascalTypes import PascalTypes

class BuiltinSymbols(object):
    mainFunctionType = ir.FunctionType(ir.VoidType(), [])
    writelnFunctionType =  ir.FunctionType(ir.IntType(32), [ir.PointerType(ir.IntType(8))], var_arg=True)
    malloc_ty = ir.FunctionType(ir.IntType(8).as_pointer(), [ir.IntType(64)])
    free_ty = ir.FunctionType(ir.VoidType(), [ir.IntType(8).as_pointer()])

    @classmethod
    def addBuiltinSymbols(cls, symbolTable, module):
        symbolTable["main"] = (ir.Function(module, BuiltinSymbols.mainFunctionType, name="main"), None, [])
        symbolTable["printf"] = (ir.Function(module, BuiltinSymbols.writelnFunctionType, name="printf"), None, [])
        symbolTable["malloc"] = (ir.Function(module, BuiltinSymbols.malloc_ty, name="malloc"), None, [])
        symbolTable["free"] = (ir.Function(module, BuiltinSymbols.free_ty, name="free"), None, [])

