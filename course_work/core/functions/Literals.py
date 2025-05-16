from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
    number = ctx.NUM_INT().getText()
    type = PascalTypes.getIntLiteralType(int(number))

    return ir.Constant(type, number), PascalTypes.numericSemanticLabel

def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
    number = ctx.NUM_REAL().getText()
    number = float(number)
    type = PascalTypes.getFloatLiteralType(number)

    return ir.Constant(type, number), PascalTypes.numericSemanticLabel

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
    lsemantic = self.leftPartDefinition.Semantic()
    if lsemantic != PascalTypes.charSemanticLabel:
        raise TypeError("Cannot create char or string in this context")

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
            raise TypeError("Cannot create char in this context")
    else:
        if ltype.element != ir.IntType(8):
            raise TypeError(f"Cannot create string in this context. LType {ltype}")

    valLenWithTerm = len(val) + 1
    if valLenWithTerm > ltype.count:
        raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {ltype.count}")
    elif valLenWithTerm < ltype.count:
        val = val.ljust(ltype.count - 1, b"\x00")

    return ir.Constant(ltype, bytearray(val + b"\x00")), PascalTypes.charSemanticLabel