from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import PascalTypes
from core.SymbolTable import SymbolTable
from core.BuiltinSymbols import BuiltinSymbols

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.module = ir.Module('pascal_program')
        self.builder = ir.IRBuilder()
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

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
        value = self.visit(ctx.expression())
        self.builder.store(value, variable)

    def visitProcedureStatement(self, ctx:PascalParser.ProcedureStatementContext):
        identifier = self.visit(ctx.identifier())
        procedure = self.symbolTable[identifier]

        inputStr = ir.Constant(ir.ArrayType(ir.IntType(8), 4), bytearray("%d\n".encode("utf8") + b"\0"))
        strVar = self.builder.alloca(ir.ArrayType(ir.IntType(8), 4))
        self.builder.store(inputStr, strVar)
        strVarPtr = self.builder.gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])

        for param in ctx.parameterList().actualParameter():
            value = self.visit(param)
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
            signedFactor = self.builder.sub(ir.Constant(ir.IntType(32), 0), signedFactor)

        return signedFactor

    def visitFactor(self, ctx:PascalParser.FactorContext):
        factor = self.visitChildren(ctx)
        if self.is_pointer(factor):
            factor = self.builder.load(factor)

        return factor

    # Возвращает указатель на переменную
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
        return ir.Constant(ir.IntType(32), ctx.NUM_INT())