import llvmlite.ir as ir
from core.PascalTypes import PascalTypes

class BuiltinSymbols(object):
    mainFunctionType = ir.FunctionType(ir.VoidType(), [])
    writelnFunctionType =  ir.FunctionType(ir.IntType(32), [ir.PointerType(ir.IntType(8))], var_arg=True)

    @classmethod
    def addBuiltinSymbols(cls, symbolTable, module):
        symbolTable["main"] = ir.Function(module, BuiltinSymbols.mainFunctionType, name="main")
        symbolTable["writeln"] = ir.Function(module, BuiltinSymbols.writelnFunctionType, name="printf")

