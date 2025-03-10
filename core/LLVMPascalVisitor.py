from collections import deque
from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.module = ir.Module('pascal_program')
        self.builder = ir.IRBuilder()
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

        self.leftPartType = None
        self.conversionRules = []

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def is_pointer(self, value):
        return isinstance(value.type, ir.PointerType)

    def visitProgram(self, ctx):
        self.builder = ir.IRBuilder(self.symbolTable["main"].append_basic_block('entry'))
        self.symbolTable.enter_scope()

        self.visit(ctx.block())
        self.builder.ret_void()

        return str(self.module)

    def visitVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        varType = self.visit(ctx.type_())
        varNames = self.visit(ctx.identifierList())
        for varName in varNames:
            allocaInstance = self.builder.alloca(varType, name=varName)
            self.symbolTable[varName] = allocaInstance

    def visitTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        text = ctx.getText()
        type = PascalTypes.strToType[text]
        return type

    def visitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        variable = self.visit(ctx.variable())
        self.leftPartType = variable.type.pointee
        value = self.visit(ctx.expression())

        if variable.type.pointee == value.type:
            self.builder.store(value, variable)
        else:
            raise TypeError(
                f"Type mismatch in assignment: "
                f"cannot convert {value.type} "
                f"to {variable.type.pointee}"
            )

    def visitProcedureStatement(self, ctx:PascalParser.ProcedureStatementContext):
        identifier = self.visit(ctx.identifier())
        procedure = self.symbolTable[identifier]

        formatStr = ""
        for param in ctx.parameterList().actualParameter():
            value = self.visit(param)
            if isinstance(value.type, ir.ArrayType):
                if value.type.element == ir.IntType(8):
                    strVar = self.builder.alloca(value.type)
                    self.builder.store(value, strVar)
                    strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])
                    self.builder.call(procedure, [strVarPtr])
            else:
                if isinstance(value.type, ir.IntType):
                    if value.type.width == 16:
                        formatStr += "%hd "
                    else:
                        formatStr += "%d "
                elif isinstance(value.type, ir.FloatType):
                    formatStr += "%f "
                elif isinstance(value.type, ir.DoubleType):
                    formatStr += "%f "
                formatStr += "\n"
                formatStr = formatStr.encode("utf8")
                formatStr += b"\0"

                strLen = len(formatStr)
                inputStr = ir.Constant(ir.ArrayType(ir.IntType(8), strLen), bytearray(formatStr))
                strVar = self.builder.alloca(ir.ArrayType(ir.IntType(8), strLen))
                self.builder.store(inputStr, strVar)
                strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])

                self.builder.call(procedure, [strVarPtr, value])

    def visitSimpleExpression(self, ctx:PascalParser.SimpleExpressionContext):
        term = self.visit(ctx.term())

        if ctx.additiveoperator():
            right = self.visit(ctx.simpleExpression())
            operator = self.visit(ctx.additiveoperator())
            if operator.PLUS():
                return self.builder.add(term, right)
            elif operator.MINUS():
                return self.builder.sub(term, right)
            elif operator.OR():
                return self.builder.or_(term, right)

        return term

    def visitTerm(self, ctx:PascalParser.TermContext):
        signedFactor = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            right = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())
            if operator.STAR():
                return self.builder.mul(signedFactor, right)

        return signedFactor

    def visitSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        signedFactor = self.visitChildren(ctx)
        if ctx.MINUS():
            if isinstance(signedFactor.type, ir.IntType):
                signedFactor = self.builder.sub(ir.Constant(signedFactor.type, 0), signedFactor)
            elif isinstance(signedFactor.type, (ir.FloatType, ir.DoubleType)):
                signedFactor = self.builder.fsub(ir.Constant(signedFactor.type, 0), signedFactor)
            else:
                raise TypeError("Cannot negate non-numeric type")

        return signedFactor

    def visitFactor(self, ctx:PascalParser.FactorContext):
        factor = self.visitChildren(ctx)
        if self.is_pointer(factor):
            factor = self.builder.load(factor)

        return factor

    # Нужно для описания всех возможных способов обращения к переменным и их элементам,
    # включая доступ к полям записей, элементам массивов, указателям и другим составным структурам.
    def visitVariable(self, ctx:PascalParser.VariableContext):
        identifier = self.visit(ctx.identifier(0))
        return self.symbolTable[identifier]

    def visitAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
        return ctx

    def visitMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
        return ctx

    def visitIdentifierList(self, ctx:PascalParser.IdentifierListContext):
        lst = []
        for identifier in ctx.identifier():
            lst.append(self.visit(identifier))

        return lst

    def visitIdentifier(self, ctx:PascalParser.IdentifierContext):
        return ctx.IDENT().getText()

    def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
        number = ctx.NUM_INT().getText()
        type = PascalTypes.getIntLiteralType(int(number))
        if isinstance(self.leftPartType, ir.IntType):
            if type.width > self.leftPartType.width:
                raise TypeError(
                    f"Type mismatch in assignment: "
                    f"cannot convert {number} ({type}) "
                    f"to {self.leftPartType}"
                )

        if isinstance(self.leftPartType, ir.FloatType) or isinstance(self.leftPartType, ir.DoubleType):
            number = float(number)

        return ir.Constant(self.leftPartType, number)

    def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
        number = ctx.NUM_REAL().getText()
        number = float(number)
        type = PascalTypes.getFloatLiteralType(number)
        # Сделать понимание типа литерала
        # if self.leftPartType != type:
        #     raise TypeError(
        #         f"Type mismatch in assignment: "
        #         f"cannot convert {type} "
        #         f"to {self.leftPartType}"
        #     )

        return ir.Constant(self.leftPartType, number)

    def visitBool_(self, ctx:PascalParser.Bool_Context):
        val = None
        if ctx.TRUE():
            val = 1
        elif ctx.FALSE():
            val = 0

        if (isinstance(self.leftPartType, ir.IntType)):
            if self.leftPartType.width == 1:
                return ir.Constant(self.leftPartType, val)

    def visitString(self, ctx:PascalParser.StringContext):
        if not isinstance(self.leftPartType, ir.ArrayType):
            if self.leftPartType.element != ir.IntType(8):
                raise TypeError("Cannot create string in this context")

        val = ctx.STRING_LITERAL().getText()[1:-1]
        val = val.replace("''", "'")
        val = bytes(val, "utf-8").decode("unicode_escape").encode("utf-8")

        valLenWithTerm = len(val) + 1 

        if valLenWithTerm > self.leftPartType.count:
            raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {self.leftPartType.count}")
        elif valLenWithTerm < self.leftPartType.count:
            val = val.ljust(self.leftPartType.count - 1, b"\x00")

        return ir.Constant(self.leftPartType, bytearray(val + b"\x00"))
