from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
    number = ctx.NUM_INT().getText()
    type = PascalTypes.getIntLiteralType(int(number))
    if isinstance(self.leftPartDefinition.Type(), ir.IntType):
        if type.width > self.leftPartDefinition.Type().width:
            raise TypeError(
                f"Type mismatch in assignment: "
                f"cannot convert {number} ({type}) "
                f"to {self.leftPartDefinition.Type()}"
            )

    if isinstance(self.leftPartDefinition.Type(), ir.FloatType) or isinstance(self.leftPartDefinition.Type(), ir.DoubleType):
        number = float(number)

    return ir.Constant(self.leftPartDefinition.Type(), number), PascalTypes.numericSemanticLabel

def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
    if isinstance(self.leftPartDefinition.Type(), ir.IntType):
        raise TypeError(f"Cannot create float in this context. lType: {self.leftPartDefinition.Type()}")

    number = ctx.NUM_REAL().getText()
    number = float(number)
    type = PascalTypes.getFloatLiteralType(number)
    # Сделать понимание типа литерала
    # if self.leftPartDefinition.Type() != type:
    #     raise TypeError(
    #         f"Type mismatch in assignment: "
    #         f"cannot convert {type} "
    #         f"to {self.leftPartDefinition.Type()}"
    #     )

    return ir.Constant(self.leftPartDefinition.Type(), number), PascalTypes.numericSemanticLabel

def visitBool_(self, ctx:PascalParser.Bool_Context):
    val = None
    if ctx.TRUE():
        val = 1
    elif ctx.FALSE():
        val = 0

    if (isinstance(self.leftPartDefinition.Type(), ir.IntType)):
        if self.leftPartDefinition.Type().width == 1:
            return ir.Constant(self.leftPartDefinition.Type(), val), PascalTypes.boolSemanticLabel

def visitString(self, ctx:PascalParser.StringContext):
    val = ctx.STRING_LITERAL().getText()[1:-1]
    val = val.replace("''", "'")
    val = bytes(val, "utf-8").decode("unicode_escape").encode("utf-8")

    if not isinstance(self.leftPartDefinition.Type(), ir.ArrayType):
        if self.leftPartDefinition.Type() == ir.IntType(8):
            if len(val) > 1:
                raise TypeError("Cannot create char in this context")

            return ir.Constant(self.leftPartDefinition.Type(), ord(val)), PascalTypes.charSemanticLabel
    else:
        if self.leftPartDefinition.Type().element != ir.IntType(8):
            raise TypeError(f"Cannot create string in this context. LType {self.leftPartDefinition.Type()}")

    valLenWithTerm = len(val) + 1
    if valLenWithTerm > self.leftPartDefinition.Type().count:
        raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {self.leftPartDefinition.Type().count}")
    elif valLenWithTerm < self.leftPartDefinition.Type().count:
        val = val.ljust(self.leftPartDefinition.Type().count - 1, b"\x00")

    return ir.Constant(self.leftPartDefinition.Type(), bytearray(val + b"\x00")), PascalTypes.charSemanticLabel