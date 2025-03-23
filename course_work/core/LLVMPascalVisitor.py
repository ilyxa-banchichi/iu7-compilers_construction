from collections import deque
from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

class LeftPartDefinition:
    def __init__(self):
        self.type = []
        self.semantic = []

    def Enter(self, type, semantic):
        self.type.append(type)
        self.semantic.append(semantic)

    def Exit(self):
        self.type.pop()
        self.semantic.pop()

    def Type(self):
        return self.type

    def Semantic(self):
        return self.semantic

    def Top(self):
        return self.type, self.semantic

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.module = ir.Module('pascal_program')
        self.builder = ir.IRBuilder()
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

        self.leftPartDefinition = LeftPartDefinition()
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
        (varType, semanticLabel) = self.visit(ctx.type_())
        varNames = self.visit(ctx.identifierList())
        for varName in varNames:
            allocaInstance = self.builder.alloca(varType, name=varName)
            self.symbolTable[varName] = allocaInstance, semanticLabel

    def visitTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        text = ctx.getText()
        type = PascalTypes.strToType[text]
        return type

    def visitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        (variable, varSemantic) = self.visit(ctx.variable())
        self.leftPartDefinition.Enter(variable.type.pointee, varSemantic)
        (value, valSemantic) = self.visit(ctx.expression())
        self.leftPartDefinition.Exit()

        if variable.type.pointee == value.type:
            if varSemantic == valSemantic:
                self.builder.store(value, variable)
            else:
                raise TypeError(
                    f"Type mismatch in assignment: "
                    f"cannot convert {varSemantic} "
                    f"to {valSemantic}"
                )
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
            value, valSemantic = self.visit(param)
            if isinstance(value.type, ir.ArrayType):
                if value.type.element == ir.IntType(8):
                    strVar = self.builder.alloca(value.type)
                    self.builder.store(value, strVar)
                    strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])
                    self.builder.call(procedure, [strVarPtr])
            else:
                if isinstance(value.type, ir.IntType):
                    if value.type.width == 8 and valSemantic == PascalTypes.charSemanticLabel:
                        formatStr += "%c"
                    elif value.type.width == 16:
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
        term, lSemantic = self.visit(ctx.term())
        self.leftPartDefinition.Enter(term.type, lSemantic)

        if ctx.additiveoperator():
            right, rSemantic = self.visit(ctx.simpleExpression())
            operator = self.visit(ctx.additiveoperator())
            if operator.PLUS():
                return self.builder.add(term, right), lSemantic
            elif operator.MINUS():
                return self.builder.sub(term, right), lSemantic
            elif operator.OR():
                return self.builder.or_(term, right), lSemantic

        self.leftPartDefinition.Exit()

        return term, lSemantic

    def visitTerm(self, ctx:PascalParser.TermContext):
        signedFactor = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            right = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())
            if operator.STAR():
                return self.builder.mul(signedFactor, right)

        return signedFactor

    def visitSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        signedFactor, semantic = self.visitChildren(ctx)
        if ctx.MINUS():
            if isinstance(signedFactor.type, ir.IntType):
                signedFactor = self.builder.sub(ir.Constant(signedFactor.type, 0), signedFactor)
            elif isinstance(signedFactor.type, (ir.FloatType, ir.DoubleType)):
                signedFactor = self.builder.fsub(ir.Constant(signedFactor.type, 0), signedFactor)
            else:
                raise TypeError("Cannot negate non-numeric type")

        return signedFactor, semantic

    def visitFactor(self, ctx:PascalParser.FactorContext):
        (factor, semantic) = self.visitChildren(ctx)
        if self.is_pointer(factor):
            factor = self.builder.load(factor)

        return factor, semantic

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
                raise TypeError("Cannot create string in this context")

        valLenWithTerm = len(val) + 1 
        if valLenWithTerm > self.leftPartDefinition.Type().count:
            raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {self.leftPartDefinition.Type().count}")
        elif valLenWithTerm < self.leftPartDefinition.Type().count:
            val = val.ljust(self.leftPartDefinition.Type().count - 1, b"\x00")

        return ir.Constant(self.leftPartDefinition.Type(), bytearray(val + b"\x00")), PascalTypes.charSemanticLabel
