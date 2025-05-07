from collections import deque
from antlr4.tree.Tree import TerminalNode
from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *
from core.TypeCast import *
from core.functions.Literals import *
from core.functions.Operators import *
from core.functions.StdLibrary import *
from core.functions.MulOperators import *
from core.functions.AddOperator import *
from core.functions.RelOperators import *
from core.functions.IfStatement import *
from core.functions.ForStatement import *
from core.functions.WhileStatement import *
from core.functions.Records import *
from core.functions.Arrays import *
from core.functions.Functions import *
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
        self.arrays = {}

    def getBuilder(self):
        return self.builder[-1]

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def is_pointer(self, value):
        return isinstance(value.type, ir.PointerType)

    def load_if_pointer(self, value):
        if self.is_pointer(value):
            return self.getBuilder().load(value)
        else:
            return value

    def visitProgram(self, ctx):
        self.currentFunction = "main"
        self.builder.append(ir.IRBuilder(self.symbolTable[self.currentFunction][0].append_basic_block('entry')))
        self.symbolTable.enter_scope()

        self.visit(ctx.block())
        self.getBuilder().ret_void()
        self.symbolTable.print()
        self.symbolTable.exit_scope()
        self.builder.pop()

        return str(self.module)

    def visitTypeDefinition(self, ctx:PascalParser.TypeDefinitionContext):
        identifier = self.visit(ctx.identifier())
        if ctx.type_():
            if ctx.type_().structuredType():
                names, types, semantics = self.visit(ctx.type_().structuredType())
                struct = ir.context.global_context.get_identified_type(identifier)
                struct.set_body(*types)
                self.records[struct] = (names, semantics)
                PascalTypes.strToType[identifier] = (struct, PascalTypes.structSemanticLabel)
        elif ctx.functionType():
            raise TypeError(f"Unsupported")
        else:
            raise TypeError(f"Incorrect type definition")

    def visitFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        identifier = self.visit(ctx.identifier())
        resultType, resultSemantic = ir.VoidType(), None
        if ctx.resultType():
            resultType, resultSemantic = self.visit(ctx.resultType())

        names, types, semantics, modifiers = self.visit(ctx.formalParameterList())

        funcType = ir.FunctionType(resultType, types)
        function = ir.Function(self.module, funcType, name=identifier)

        self.currentFunction = identifier
        self.symbolTable[identifier] = (function, resultSemantic, semantics)

        self.builder.append(ir.IRBuilder(self.symbolTable[self.currentFunction][0].append_basic_block('entry')))
        self.symbolTable.enter_scope()

        if resultSemantic != None:
            resultVar = self.getBuilder().alloca(resultType, name="Result")
            self.symbolTable["Result"] = resultVar, resultSemantic

        i = 0
        args = function.args
        for arg in args:
            arg.name = names[i]
            if modifiers[i] == "NONE":
                argVar = self.getBuilder().alloca(arg.type, name=arg.name)
                self.getBuilder().store(arg, argVar)
            elif modifiers[i] == "VAR":
                argVar = arg
            elif modifiers[i] == "FUNCTION":
                argVar = arg

            self.symbolTable[arg.name] = argVar, semantics[i]
            i += 1

        self.visit(ctx.block())
        if resultSemantic != None:
            retVal = self.getBuilder().load(resultVar)
            self.getBuilder().ret(retVal)
        else:
            self.getBuilder().ret_void()

        self.symbolTable.exit_scope()
        self.builder.pop()

        return str(self.module)

    def visitFormalParameterList(self, ctx:PascalParser.FormalParameterListContext):
        names = []
        types = []
        semantics = []
        modifiers = []
        for g in ctx.formalParameterSection():
            n, t, s, m = self.visit(g)

            names.extend(n)
            types.extend(t)
            semantics.extend(s)
            modifiers.extend(m)

        return names, types, semantics, modifiers

    def visitFormalParameterSection(self, ctx:PascalParser.FormalParameterSectionContext):
        names, types, semantics = self.visit(ctx.parameterGroup())
        modifiers = []
        if ctx.VAR():
            modifiers = ["VAR" for _ in names]
            types = [t.as_pointer() for t in types]
        elif ctx.FUNCTION():
            modifiers = ["FUNCTION" for _ in names]
        else:
            modifiers = ["NONE" for _ in names]

        return names, types, semantics, modifiers

    def visitParameterGroup(self, ctx:PascalParser.ParameterGroupContext):
        names = self.visit(ctx.identifierList())
        t, s = self.visit(ctx.typeIdentifier())
        types = [t for n in names]
        semantics = [s for n in names]
        return names, types, semantics

    def visitFunctionDesignator(self, ctx:PascalParser.FunctionDesignatorContext):
        identifier = self.visit(ctx.identifier())
        if identifier == "writeln":
            return writeln(self, ctx)
        else:
            return callFunction(identifier, self, ctx)

    def visitRecordType(self, ctx:PascalParser.RecordTypeContext):
        return visitRecordType(self, ctx)

    def visitFixedPart(self, ctx:PascalParser.FixedPartContext):
        return visitFixedPart(self, ctx)

    def visitRecordSection(self, ctx:PascalParser.RecordSectionContext):
        return visitRecordSection(self, ctx)

    def visitArrayType(self, ctx:PascalParser.ArrayTypeContext):
        componentType, semantic = self.visit(ctx.componentType())
        typeList = self.visit(ctx.typeList())
        sizes = []
        description = []
        for t in typeList:
            min = int(t[0].constant)
            max = int(t[1].constant)
            description.append((min, max))
            val = max - min + 1
            sizes.append(val)
        return PascalTypes.getArrayType(componentType, sizes), semantic, description

    def visitTypeList(self, ctx:PascalParser.TypeListContext):
        tl = []
        for it in ctx.indexType():
            t = self.visit(it)
            tl.append(t)
        return tl

    def visitScalarType(self, ctx:PascalParser.ScalarTypeContext):
        raise TypeError("Not supported")

    def visitSubrangeType(self, ctx:PascalParser.SubrangeTypeContext):
        self.leftPartDefinition.Enter(PascalTypes.int, PascalTypes.numericSemanticLabel)
        first, _ = self.visit(ctx.constant(0))
        second, _ = self.visit(ctx.constant(1))
        self.leftPartDefinition.Exit()
        return [first, second]

    def visitStringtype(self, ctx:PascalParser.StringtypeContext):
        return self.visitChildren(ctx)

    def visitVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        if not ctx.type_():
            return

        t = self.visit(ctx.type_())
        varType = t[0]
        semanticLabel = t[1]
        varNames = self.visit(ctx.identifierList())
        for varName in varNames:
            allocaInstance =self.getBuilder().alloca(varType, name=varName)
            if isinstance(varType, ir.ArrayType):
                self.symbolTable[varName] = allocaInstance, semanticLabel, t[2]
                print(self.symbolTable[varName])
            else:
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

        value = self.load_if_pointer(value)
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
            left = self.load_if_pointer(left)
            if lSemantic != PascalTypes.numericSemanticLabel or not isinstance(left.type, ir.IntType):
                raise TypeError(f"Cannot apply shift operator {operator} to not integer type")

            operator = self.visit(ctx.shiftOperator())
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.shiftExpression())
            self.leftPartDefinition.Exit()

            right = self.load_if_pointer(right)

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
            print(f"right {right}")
            operator = self.visit(ctx.multiplicativeoperator())
            print(operator.getText())
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

        return factor, semantic

    def visitVariable(self, ctx:PascalParser.VariableContext):
        identifier = self.visit(ctx.identifier(0))
        modifiers = []
        ident_index = 1
        expr_index = 0
        for i in range(len(ctx.children)):
            child = ctx.children[i]
            if isinstance(child, TerminalNode):
                if child.symbol.type == PascalParser.DOT:
                    ind = self.visit(ctx.identifier(ident_index))
                    ident_index += 1
                    modifiers.append(("field", ind))
                elif child.symbol.type == PascalParser.LBRACK:
                    self.leftPartDefinition.Enter(ir.IntType(32), PascalTypes.numericSemanticLabel)
                    ind, _ = self.visit(ctx.expression(expr_index))
                    self.leftPartDefinition.Exit()
                    i_val = self.load_if_pointer(ind)
                    indices = [i_val]
                    expr_index += 1
                    while ctx.children[i + 2].symbol.type == PascalParser.COMMA:
                        i += 2
                        self.leftPartDefinition.Enter(ir.IntType(32), PascalTypes.numericSemanticLabel)
                        ind, _ = self.visit(ctx.expression(expr_index))
                        self.leftPartDefinition.Exit()
                        i_val = self.load_if_pointer(ind)
                        expr_index += 1
                        indices.append(i_val)

                    modifiers.append(("array_access", indices))

        v = self.symbolTable[identifier]
        currentNode, currentSemantic = v[0], v[1]
        array_desc = None
        if isinstance(currentNode.type.pointee, ir.ArrayType):
            array_desc = v[2]

        for modType, modValue in modifiers:
            if modType == "field":
                currentNode, currentSemantic = recordFieldAccess(self.getBuilder(), self.records, currentNode, modValue)
            elif modType == "array_access":
                currentNode = arrayElementAccess(self.getBuilder(), array_desc, currentNode, modValue)

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