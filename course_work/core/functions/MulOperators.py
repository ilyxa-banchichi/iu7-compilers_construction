from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def MulOperator(self, left, lSemantic, right, rSemantic, operator):
    if lSemantic != PascalTypes.numericSemanticLabel:
        raise TypeError(f"Cannot apply operator {operator.getText()} to not numeric type {left, lSemantic}")

    if rSemantic != lSemantic or left.type != right.type:
        raise TypeError(f"Cannot apply operator {operator.getText()} to different types {left.type} and {right.type}")

    if isinstance(left.type, ir.FloatType):
        if operator.STAR():
            return self.builder.fmul(left, right), lSemantic
        elif operator.SLASH():
            return self.builder.fdiv(left, right), lSemantic
        elif operator.DIV():
            raise TypeError(f"Cannot apply operator {operator.DIV()} to float types")
        elif operator.MOD():
            raise TypeError(f"Cannot apply operator {operator.MOD()} to float types")
        elif operator.AND():
            raise TypeError(f"Cannot apply operator {operator.AND()} to float types")

    elif isinstance(left.type, ir.IntType):
        if operator.STAR():
            return self.builder.mul(left, right), lSemantic
        elif operator.AND():
            return self.builder.and_(left, right), lSemantic

        if left.type.width == 8:
            if operator.SLASH():
                af = self.builder.uitofp(left, ir.FloatType())
                bf = self.builder.uitofp(right, ir.FloatType())
                return self.builder.fdiv(af, bf), lSemantic
            elif operator.DIV():
                return self.builder.udiv(left, right), lSemantic
            elif operator.MOD():
                return self.builder.urem(left, right), lSemantic
        else:
            if operator.SLASH():
                af = self.builder.sitofp(left, ir.FloatType())
                bf = self.builder.sitofp(right, ir.FloatType())
                return self.builder.fdiv(af, bf), lSemantic
            elif operator.DIV():
                return self.builder.sdiv(left, right), lSemantic
            elif operator.MOD():
                return self.builder.srem(left, right), lSemantic