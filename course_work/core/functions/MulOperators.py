from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *

def mulOperatorForLogical(self, left, lSemantic, right, rSemantic, operator):
    if operator.STAR():
        self.add_error(ctx, f"Cannot apply operator {operator.DIV()} to bool types")
    elif operator.SLASH():
        self.add_error(ctx, f"Cannot apply operator {operator.DIV()} to bool types")
    elif operator.DIV():
        self.add_error(ctx, f"Cannot apply operator {operator.DIV()} to bool types")
    elif operator.MOD():
        self.add_error(ctx, f"Cannot apply operator {operator.DIV()} to bool types")
    elif operator.AND():
        return self.getBuilder().and_(left, right), lSemantic

def mulOperatorForNumeric(self, left, lSemantic, right, rSemantic, operator):
    if isinstance(left.type, ir.FloatType):
        if operator.STAR():
            return self.getBuilder().fmul(left, right), lSemantic
        elif operator.SLASH():
            return self.getBuilder().fdiv(left, right), lSemantic
        elif operator.DIV():
            self.add_error(ctx, f"Cannot apply operator {operator.DIV()} to float types")
        elif operator.MOD():
            self.add_error(ctx, f"Cannot apply operator {operator.MOD()} to float types")
        elif operator.AND():
            self.add_error(ctx, f"Cannot apply operator {operator.AND()} to float types")

    elif isinstance(left.type, ir.IntType):
        if operator.AND():
            return self.getBuilder().and_(left, right), lSemantic
        if operator.STAR():
                return self.getBuilder().mul(left, right), lSemantic

        if left.type.width == 8:
            if operator.SLASH():
                af = self.getBuilder().uitofp(left, ir.FloatType())
                bf = self.getBuilder().uitofp(right, ir.FloatType())
                return self.getBuilder().fdiv(af, bf), lSemantic
            elif operator.DIV():
                return self.getBuilder().udiv(left, right), lSemantic
            elif operator.MOD():
                return self.getBuilder().urem(left, right), lSemantic
        else:
            if operator.SLASH():
                af = self.getBuilder().sitofp(left, ir.FloatType())
                bf = self.getBuilder().sitofp(right, ir.FloatType())
                return self.getBuilder().fdiv(af, bf), lSemantic
            elif operator.DIV():
                return self.getBuilder().sdiv(left, right), lSemantic
            elif operator.MOD():
                return self.getBuilder().srem(left, right), lSemantic

def mulOperator(self, left, lSemantic, right, rSemantic, operator):
    left = self.load_if_pointer(left)
    right = self.load_if_pointer(right)

    if lSemantic != rSemantic:
        self.add_error(ctx, f"Cannot apply operator {operator.getText()} to different types {left.type} as {lSemantic} and {right.type} as {rSemantic}")

    if lSemantic == PascalTypes.boolSemanticLabel:
        return mulOperatorForLogical(self, left, lSemantic, right, rSemantic, operator)

    if lSemantic == PascalTypes.numericSemanticLabel:
        if left.type != right.type:
            left, right = castValues(self.getBuilder(), left, right)
        return mulOperatorForNumeric(self, left, lSemantic, right, rSemantic, operator)

    self.add_error(ctx, f"Cannot apply operator {operator.getText()} this context {left, lSemantic}")