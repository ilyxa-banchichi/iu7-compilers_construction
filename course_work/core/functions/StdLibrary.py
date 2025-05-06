from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def writeln(self, ctx:PascalParser.FunctionDesignatorContext):
    procedure = self.symbolTable["writeln"][0]

    formatStr = ""
    for param in ctx.parameterList().actualParameter():
        self.leftPartDefinition.Enter(PascalTypes.defaultString, PascalTypes.charSemanticLabel)
        value, valSemantic = self.visit(param)
        self.leftPartDefinition.Exit()

        if isinstance(value.type, ir.ArrayType):
            if value.type.element == ir.IntType(8):
                strVar = self.getBuilder().alloca(value.type)
                self.getBuilder().store(value, strVar)
                strVarPtr = self.getBuilder().gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])
                self.getBuilder().call(procedure, [strVarPtr])
        else:
            if isinstance(value.type, ir.IntType):
                if value.type.width == 8:
                    if valSemantic == PascalTypes.charSemanticLabel:
                        formatStr += "%c"
                    else:
                        formatStr += "%hhu"
                elif value.type.width == 16:
                    formatStr += "%hd"
                else:
                    formatStr += "%d"
            elif isinstance(value.type, ir.FloatType):
                formatStr += "%f"
            elif isinstance(value.type, ir.DoubleType):
                formatStr += "%f"
            formatStr += "\n"
            formatStr = formatStr.encode("utf8")
            formatStr += b"\0"

            strLen = len(formatStr)
            inputStr = ir.Constant(ir.ArrayType(ir.IntType(8), strLen), bytearray(formatStr))
            strVar = self.getBuilder().alloca(ir.ArrayType(ir.IntType(8), strLen))
            self.getBuilder().store(inputStr, strVar)
            strVarPtr = self.getBuilder().gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])

            self.getBuilder().call(procedure, [strVarPtr, value])