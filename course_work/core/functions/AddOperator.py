from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *

def addOperator(self, left, lSemantic, right, rSemantic, operator):
    if lSemantic != rSemantic:
        raise TypeError(f"Cannot apply operator {operator.getText()} to different types {left.type} as {lSemantic} and {right.type} as {rSemantic}")

    if lSemantic == PascalTypes.boolSemanticLabel:
        if operator.OR():
            return self.builder.or_(left, right), lSemantic
        else:
            raise TypeError(f"Cannot apply operator {operator.OR()} to float types")

    if lSemantic == PascalTypes.numericSemanticLabel:
        if left.type != right.type:
            left, right = castValues(self.builder, left, right)

        if isinstance(left.type, ir.FloatType):
            if operator.PLUS():
                return self.builder.fadd(left, right), lSemantic
            elif operator.MINUS():
                return self.builder.fsub(left, right), lSemantic
            elif operator.OR():
                raise TypeError(f"Cannot apply operator {operator.OR()} to float types")
        elif isinstance(left.type, ir.IntType):
            if operator.PLUS():
                return self.builder.add(left, right), lSemantic
            elif operator.MINUS():
                return self.builder.sub(left, right), lSemantic
            elif operator.OR():
                return self.builder.or_(left, right), lSemantic

    raise TypeError(f"Cannot apply operator {operator.getText()} this context {left, lSemantic}")

