from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *

def relOperator(self, left, lSemantic, right, rSemantic, operator: str):
    if lSemantic != rSemantic:
        raise TypeError(f"Cannot apply operator {operator.getText()} to different types {left.type} as {lSemantic} and {right.type} as {rSemantic}")

    if lSemantic != PascalTypes.numericSemanticLabel:
        raise TypeError(f"Cannot apply operator {operator} to not numeric type {left, lSemantic}")

    if lSemantic == PascalTypes.numericSemanticLabel:
        if left.type != right.type:
            left, right = castValues(self.builder, left, right)

    if isinstance(left.type, ir.FloatType):
            return self.builder.fcmp_ordered(operator, left, right), PascalTypes.boolSemanticLabel
    elif isinstance(left.type, ir.IntType):
        if left.type.width == 8:
            return self.builder.icmp_unsigned(operator, left, right), PascalTypes.boolSemanticLabel
        else:
            return self.builder.icmp_signed(operator, left, right), PascalTypes.boolSemanticLabel