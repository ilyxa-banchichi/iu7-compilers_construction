from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
    ltype = self.leftPartDefinition.Type()
    if isinstance(ltype, ir.PointerType):
        ltype = ltype.pointee

    number = ctx.NUM_INT().getText()
    type = PascalTypes.getIntLiteralType(int(number))
    if isinstance(ltype, ir.IntType):
        if type.width > ltype.width:
            raise TypeError(
                f"Type mismatch in assignment: "
                f"cannot convert {number} ({type}) "
                f"to {ltype}"
            )

    if isinstance(ltype, ir.FloatType) or isinstance(ltype, ir.DoubleType):
        number = float(number)

    return ir.Constant(ltype, number), PascalTypes.numericSemanticLabel

def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
    ltype = self.leftPartDefinition.Type()
    if isinstance(ltype, ir.PointerType):
        ltype = ltype.pointee

    if isinstance(ltype, ir.IntType):
        raise TypeError(f"Cannot create float in this context. lType: {ltype}")

    number = ctx.NUM_REAL().getText()
    number = float(number)
    type = PascalTypes.getFloatLiteralType(number)
    # Сделать понимание типа литерала
    # if ltype != type:
    #     raise TypeError(
    #         f"Type mismatch in assignment: "
    #         f"cannot convert {type} "
    #         f"to {ltype}"
    #     )

    print(ltype)
    print(number)
    return ir.Constant(ltype, number), PascalTypes.numericSemanticLabel

def visitBool_(self, ctx:PascalParser.Bool_Context):
    ltype = self.leftPartDefinition.Type()
    if isinstance(ltype, ir.PointerType):
        ltype = ltype.pointee

    val = None
    if ctx.TRUE():
        val = 1
    elif ctx.FALSE():
        val = 0

    if (isinstance(ltype, ir.IntType)):
        if ltype.width == 1:
            return ir.Constant(ltype, val), PascalTypes.boolSemanticLabel

def visitString(self, ctx:PascalParser.StringContext):
    ltype = self.leftPartDefinition.Type()
    if isinstance(ltype, ir.PointerType):
        ltype = ltype.pointee

    val = ctx.STRING_LITERAL().getText()[1:-1]
    val = val.replace("''", "'")
    val = bytes(val, "utf-8").decode("unicode_escape").encode("utf-8")

    if not isinstance(ltype, ir.ArrayType):
        if ltype == ir.IntType(8):
            if len(val) > 1:
                raise TypeError("Cannot create char in this context")

            return ir.Constant(ltype, ord(val)), PascalTypes.charSemanticLabel
    else:
        if ltype.element != ir.IntType(8):
            raise TypeError(f"Cannot create string in this context. LType {ltype}")

    valLenWithTerm = len(val) + 1
    if valLenWithTerm > ltype.count:
        raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {ltype.count}")
    elif valLenWithTerm < ltype.count:
        val = val.ljust(ltype.count - 1, b"\x00")

    return ir.Constant(ltype, bytearray(val + b"\x00")), PascalTypes.charSemanticLabel