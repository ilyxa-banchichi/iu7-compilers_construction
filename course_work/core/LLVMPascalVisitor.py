from collections import deque
from antlr4.tree.Tree import TerminalNode
from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *
from core.functions.Literals import *
from core.functions.Operators import *
from core.functions.Temp import *
from core.functions.MulOperators import *
from core.functions.AddOperator import *
from core.functions.RelOperators import *
from core.functions.IfStatement import *
from core.functions.ForStatement import *
from core.functions.WhileStatement import *
from core.functions.Records import *
from core.TypeCast import *

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
        return self.type[-1]

    def Semantic(self):
        return self.semantic[-1]

    def Top(self):
        return self.type[-1], self.semantic[-1]

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.module = ir.Module('pascal_program')
        self.builder = []
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

        self.leftPartDefinition = LeftPartDefinition()
        self.currentFunction = ""
        self.records = {}

    def getBuilder(self):
        return self.builder[-1]

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def is_pointer(self, value):
        return isinstance(value.type, ir.PointerType)

    def visitProgram(self, ctx):
        self.currentFunction = "main"
        self.builder.append(ir.IRBuilder(self.symbolTable[self.currentFunction].append_basic_block('entry')))
        self.symbolTable.enter_scope()

        self.visit(ctx.block())
        self.getBuilder().ret_void()
        self.symbolTable.exit_scope()
        self.builder.pop()

        return str(self.module)

    def visitTypeDefinition(self, ctx:PascalParser.TypeDefinitionContext):
        identifier = self.visit(ctx.identifier())
        names, types, semantics = self.visit(ctx.type_())
        struct = ir.context.global_context.get_identified_type(identifier)
        struct.set_body(*types)
        self.records[struct] = (names, semantics)
        PascalTypes.strToType[identifier] = (struct, PascalTypes.structSemanticLabel)

    def visitFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        identifier = self.visit(ctx.identifier())
        resultType, resultSemantic = self.visit(ctx.resultType())
        names, types, semantics = self.visit(ctx.formalParameterList())

        funcType = ir.FunctionType(resultType, types)
        function = ir.Function(self.module, funcType, name=identifier)

        self.currentFunction = identifier
        self.symbolTable[identifier] = function

        self.builder.append(ir.IRBuilder(self.symbolTable[self.currentFunction].append_basic_block('entry')))
        self.symbolTable.enter_scope()

        resultVar = self.getBuilder().alloca(resultType, name="Result")
        self.symbolTable["Result"] = resultVar, resultSemantic

        i = 0
        args = function.args
        for arg in args:
            arg.name = names[i]
            self.symbolTable[arg.name] = arg, semantics[i]
            i += 1

        self.visit(ctx.block())
        retVal = self.getBuilder().load(resultVar)
        self.getBuilder().ret(retVal)
        self.symbolTable.exit_scope()
        self.builder.pop()

        return str(self.module)

    def visitFormalParameterList(self, ctx:PascalParser.FormalParameterListContext):
        names = []
        types = []
        semantics = []
        for g in ctx.formalParameterSection():
            n, t, s = self.visit(g)
            names.extend(n)
            types.extend(t)
            semantics.extend(s)

        return names, types, semantics

    def visitParameterGroup(self, ctx:PascalParser.ParameterGroupContext):
        names = self.visit(ctx.identifierList())
        t, s = self.visit(ctx.typeIdentifier())
        types = [t for n in names]
        semantics = [s for n in names]
        return names, types, semantics

    def visitRecordType(self, ctx:PascalParser.RecordTypeContext):
        return visitRecordType(self, ctx)

    def visitFixedPart(self, ctx:PascalParser.FixedPartContext):
        return visitFixedPart(self, ctx)

    def visitRecordSection(self, ctx:PascalParser.RecordSectionContext):
        return visitRecordSection(self, ctx)

    def visitVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        if not ctx.type_():
            return

        (varType, semanticLabel) = self.visit(ctx.type_())
        varNames = self.visit(ctx.identifierList())
        for varName in varNames:
            allocaInstance =self.getBuilder().alloca(varType, name=varName)
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

        value = castStoredValue(self.getBuilder(), variable, value)
        self.getBuilder().store(value, variable)

    def visitWhileStatement(self, ctx:PascalParser.WhileStatementContext):
        return visitWhileStatement(self, ctx)

    def visitForStatement(self, ctx:PascalParser.ForStatementContext):
        return visitForStatement(self, ctx)

    def visitForList(self, ctx:PascalParser.ForListContext):
        return visitForList(self, ctx)

    def visitIfStatement(self, ctx:PascalParser.IfStatementContext):
        return visitIfStatement(self, ctx)

    def visitProcedureStatement(self, ctx:PascalParser.ProcedureStatementContext):
        return visitProcedureStatement(self, ctx)

    def visitSimpleExpression(self, ctx:PascalParser.SimpleExpressionContext):
        left, lSemantic = self.visit(ctx.term())
        if ctx.additiveoperator():

            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.simpleExpression())
            operator = self.visit(ctx.additiveoperator())
            self.leftPartDefinition.Exit()

            return addOperator(self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        left, lSemantic = self.visit(ctx.simpleExpression())
        if ctx.shiftOperator():
            if lSemantic != PascalTypes.numericSemanticLabel or not isinstance(left.type, ir.IntType):
                raise TypeError(f"Cannot apply shift operator {operator} to not integer type")

            operator = self.visit(ctx.shiftOperator())
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.shiftExpression())
            self.leftPartDefinition.Exit()

            if operator.SHL():
                return self.getBuilder().shl(left, right), lSemantic
            elif operator.SHR():
                return self.getBuilder().lshr(left, right), lSemantic

        return left, lSemantic

    def visitExpression(self, ctx:PascalParser.ExpressionContext):
        left, lSemantic = self.visit(ctx.shiftExpression(0))
        if ctx.relationaloperator():
            operator = self.visit(ctx.relationaloperator())
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.shiftExpression(1))
            self.leftPartDefinition.Exit()

            return relOperator(self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitTerm(self, ctx:PascalParser.TermContext):
        left, lSemantic = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())
            self.leftPartDefinition.Exit()

            return mulOperator(self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        signedFactor, semantic = self.visitChildren(ctx)
        if ctx.MINUS():
            if isinstance(signedFactor.type, ir.IntType):
                signedFactor =self.getBuilder().sub(ir.Constant(signedFactor.type, 0), signedFactor)
            elif isinstance(signedFactor.type, (ir.FloatType, ir.DoubleType)):
                signedFactor =self.getBuilder().fsub(ir.Constant(signedFactor.type, 0), signedFactor)
            else:
                raise TypeError("Cannot negate non-numeric type")

        return signedFactor, semantic

    def visitFactor(self, ctx:PascalParser.FactorContext):
        print(ctx.getText())
        if ctx.variable():
            factor, semantic = self.visit(ctx.variable())
        elif ctx.LPAREN():
            factor, semantic = self.visit(ctx.expression())
        elif ctx.unsignedConstant():
            factor, semantic = self.visit(ctx.unsignedConstant())
        elif ctx.set_():
            raise Exception("Set in not support")
        elif ctx.NOT():
            factor, semantic = self.visit(ctx.factor())
            if isinstance(factor.type, ir.IntType):
                factor =self.getBuilder().xor(factor, ir.Constant(factor.type, -1))
        elif ctx.bool_():
            factor, semantic = self.visit(ctx.bool_())
        elif ctx.functionDesignator():
            factor, semantic = self.visit(ctx.functionDesignator())

        if self.is_pointer(factor):
            factor =self.getBuilder().load(factor)

        return factor, semantic

    def visitVariable(self, ctx:PascalParser.VariableContext):
        identifier = self.visit(ctx.identifier(0))
        modifiers = []
        index = 1
        for i in range(len(ctx.children)):
            child = ctx.children[i]
            if isinstance(child, TerminalNode):
                if child.symbol.type == PascalParser.DOT:
                    ind = self.visit(ctx.identifier(index))
                    modifiers.append(("field", ind))
                index += 1

        currentNode, currentSemantic = self.symbolTable[identifier]
        for modType, modValue in modifiers:
            if modType == "field":
                currentNode, currentSemantic = recordFieldAccess(self.getBuilder(), self.records, currentNode, modValue)

        return currentNode, currentSemantic

    def visitIdentifierList(self, ctx:PascalParser.IdentifierListContext):
        lst = []
        for identifier in ctx.identifier():
            lst.append(self.visit(identifier))

        return lst

    def visitAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
        return visitAdditiveoperator(self, ctx)

    def visitMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
        return visitMultiplicativeoperator(self, ctx)

    def visitShiftOperator(self, ctx:PascalParser.ShiftOperatorContext):
        return visitShiftOperator(self, ctx)

    def visitRelationaloperator(self, ctx:PascalParser.RelationaloperatorContext):
        return visitRelationaloperator(self, ctx)

    def visitIdentifier(self, ctx:PascalParser.IdentifierContext):
        return ctx.IDENT().getText()

    def visitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
        return visitUnsignedInteger(self, ctx)

    def visitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
        return visitUnsignedReal(self, ctx)

    def visitBool_(self, ctx:PascalParser.Bool_Context):
        return visitBool_(self, ctx)

    def visitString(self, ctx:PascalParser.StringContext):
        return visitString(self, ctx)