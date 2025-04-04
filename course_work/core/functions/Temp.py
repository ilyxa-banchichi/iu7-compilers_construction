from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitProcedureStatement(self, ctx:PascalParser.ProcedureStatementContext):
    identifier = self.visit(ctx.identifier())
    procedure = self.symbolTable[identifier]

    formatStr = ""
    for param in ctx.parameterList().actualParameter():
        self.leftPartDefinition.Enter(PascalTypes.defaultString, PascalTypes.charSemanticLabel)
        value, valSemantic = self.visit(param)
        self.leftPartDefinition.Exit()

        print(value.type)
        if isinstance(value.type, ir.ArrayType):
            if value.type.element == ir.IntType(8):
                strVar = self.builder.alloca(value.type)
                self.builder.store(value, strVar)
                strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])
                self.builder.call(procedure, [strVarPtr])
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
            strVar = self.builder.alloca(ir.ArrayType(ir.IntType(8), strLen))
            self.builder.store(inputStr, strVar)
            strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])

            self.builder.call(procedure, [strVarPtr, value])