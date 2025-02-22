from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.module = ir.Module('pascal_program')
        self.builder = None
        self.function = None
        self.variables = {}
        self.procedures = {}
        self.declareWriteln()

    def declareWriteln(self):
        writeln_ty = ir.FunctionType(ir.IntType(32), [ir.PointerType(ir.IntType(8))], var_arg=True)
        self.procedures["writeln"] = ir.Function(self.module, writeln_ty, name="printf")

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def is_pointer(self, value):
        return isinstance(value.type, ir.PointerType)

    def visitProgram(self, ctx):
        func_type = ir.FunctionType(ir.VoidType(), [])
        self.function = ir.Function(self.module, func_type, name="main")
        block = self.function.append_basic_block('entry')
        self.builder = ir.IRBuilder(block)

        self.visit(ctx.block())
        self.builder.ret_void()

        return str(self.module)

    def visitVariableDeclarationPart(self, ctx:PascalParser.VariableDeclarationPartContext):
        for decl in ctx.variableDeclaration():
            for var in decl.identifierList().identifier():
                var_name = self.visit(var)
                var_type = ir.IntType(32)  # Тип всегда Integer
                alloca_inst = self.builder.alloca(var_type, name=var_name)
                self.variables[var_name] = alloca_inst

    def visitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        variable = self.visit(ctx.variable())
        value = self.visit(ctx.expression())
        self.builder.store(value, variable)

    def visitProcedureStatement(self, ctx:PascalParser.ProcedureStatementContext):
        identifier = self.visit(ctx.identifier())
        procedure = self.procedures[identifier]

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
        return self.variables[identifier]

    def visitAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
        return ctx

    def visitMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
        return ctx

    def visitIdentifier(self, ctx:PascalParser.IdentifierContext):
        return ctx.IDENT().getText()

    def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
        return ir.Constant(ir.IntType(32), ctx.NUM_INT())