from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
    number = ctx.NUM_INT().getText()
    try:
        type = PascalTypes.getIntLiteralType(int(number))
    except Exception as e:
        self.add_error(ctx, str(e))

    return ir.Constant(type, number), PascalTypes.numericSemanticLabel

def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
    number = ctx.NUM_REAL().getText()
    number = float(number)
    type = PascalTypes.getFloatLiteralType(number)

    return ir.Constant(type, number), PascalTypes.numericSemanticLabel

def visitBool_(self, ctx:PascalParser.Bool_Context):
    val = None
    if ctx.TRUE():
        val = 1
    elif ctx.FALSE():
        val = 0

    return ir.Constant(PascalTypes.boolean, val), PascalTypes.boolSemanticLabel

def visitString(self, ctx:PascalParser.StringContext):
    val = ctx.STRING_LITERAL().getText()[1:-1]
    val = val.replace("''", "'")
    val = bytes(val, "utf-8").decode("unicode_escape").encode("utf-8")
    if len(val) == 1:
        return ir.Constant(PascalTypes.char, ord(val)), PascalTypes.charSemanticLabel

    valLenWithTerm = len(val) + 1
    return ir.Constant(PascalTypes.getArrayType(PascalTypes.char, [valLenWithTerm]), bytearray(val + b"\x00")), PascalTypes.charSemanticLabel

