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

class LLVMPascalVisitor(PascalVisitor):
    def __init__(self):
        self.context = ir.Context()
        self.module = ir.Module('pascal_program', context=self.context)
        self.builder = []
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

        self.currentFunction = []
        self.records = {}
        self.arrays = {}

    def getBuilder(self):
        return self.builder[-1]
    
    def getCurrentFunction(self):
        return self.currentFunction[-1]

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

    def pointee_type(self, value):
        if self.is_pointer(value):
            return value.type.pointee
        else:
            return value.type

    def visitProgram(self, ctx):
        self.currentFunction.append("main")
        self.builder.append(ir.IRBuilder(self.symbolTable[self.getCurrentFunction()][0].append_basic_block('entry')))
        self.symbolTable.enter_scope()

        self.visit(ctx.block())
        self.getBuilder().ret_void()
        self.symbolTable.exit_scope()
        self.builder.pop()

        return str(self.module)

    def visitTypeDefinition(self, ctx:PascalParser.TypeDefinitionContext):
        identifier = self.visit(ctx.identifier())
        if ctx.type_():
            if ctx.type_().structuredType().unpackedStructuredType().recordType():
                names, types, semantics, array_descriptions = self.visit(ctx.type_().structuredType())
                struct = self.context.get_identified_type(identifier)
                struct.set_body(*types)
                self.records[struct] = (names, semantics, array_descriptions)
                PascalTypes.strToType[identifier] = (struct, PascalTypes.structSemanticLabel)
            if ctx.type_().structuredType().unpackedStructuredType().arrayType():
                type, semantic, array_description = self.visit(ctx.type_().structuredType())
                PascalTypes.strToType[identifier] = (type, semantic, array_description)
        elif ctx.functionType():
            raise TypeError(f"Unsupported")
        else:
            raise TypeError(f"Incorrect type definition")

    def visitFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        identifier = self.visit(ctx.identifier())
        resultType, resultSemantic = ir.VoidType(), None
        if ctx.resultType():
            resultType, resultSemantic = self.visit(ctx.resultType())

        names, types, semantics, modifiers, arr_descs = self.visit(ctx.formalParameterList())

        funcType = ir.FunctionType(resultType, types)
        function = ir.Function(self.module, funcType, name=identifier)

        self.currentFunction.append(identifier)
        self.symbolTable[identifier] = (function, resultSemantic, semantics, arr_descs)

        newBuilder = ir.IRBuilder(self.symbolTable[self.getCurrentFunction()][0].append_basic_block('entry'))
        self.builder.append(newBuilder)
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

            self.symbolTable[arg.name] = argVar, semantics[i], arr_descs[i]
            i += 1

        self.visit(ctx.block())
        if resultSemantic != None:
            retVal = self.getBuilder().load(resultVar)
            self.getBuilder().ret(retVal)
        else:
            self.getBuilder().ret_void()

        self.symbolTable.exit_scope()
        self.builder.pop()
        self.currentFunction.pop()

        return str(self.module)

    def visitFormalParameterList(self, ctx:PascalParser.FormalParameterListContext):
        names = []
        types = []
        semantics = []
        modifiers = []
        arr_descs = []
        for g in ctx.formalParameterSection():
            n, t, s, m, d = self.visit(g)

            names.extend(n)
            types.extend(t)
            semantics.extend(s)
            modifiers.extend(m)
            arr_descs.extend(d)

        return names, types, semantics, modifiers, arr_descs

    def visitFormalParameterSection(self, ctx:PascalParser.FormalParameterSectionContext):
        names, types, semantics, arr_descs = self.visit(ctx.parameterGroup())
        modifiers = []
        if ctx.VAR():
            modifiers = ["VAR" for _ in names]
            types = [t.as_pointer() for t in types]
        elif ctx.FUNCTION():
            modifiers = ["FUNCTION" for _ in names]
        else:
            modifiers = ["NONE" for _ in names]

        return names, types, semantics, modifiers, arr_descs

    def visitParameterGroup(self, ctx:PascalParser.ParameterGroupContext):
        names = self.visit(ctx.identifierList())
        t = self.visit(ctx.typeIdentifier())
        var_type, sem, arr_desc = t[0], t[1], None
        if isinstance(var_type, ir.ArrayType):
            arr_desc = t[2]

        types = [var_type for n in names]
        semantics = [sem for n in names]
        arr_descs = [arr_desc for n in names]
        return names, types, semantics, arr_descs

    def visitFunctionDesignator(self, ctx:PascalParser.FunctionDesignatorContext):
        identifier = self.visit(ctx.identifier())
        if identifier == "writeln":
            return writeln(self, ctx)
        elif identifier == "write":
            return write(self, ctx)
        else:
            return callFunction(identifier, self, ctx)

    def visitRecordType(self, ctx:PascalParser.RecordTypeContext):
        return visitRecordType(self, ctx)

    def visitFixedPart(self, ctx:PascalParser.FixedPartContext):
        return visitFixedPart(self, ctx)

    def visitRecordSection(self, ctx:PascalParser.RecordSectionContext):
        return visitRecordSection(self, ctx)

    def visitArrayType(self, ctx:PascalParser.ArrayTypeContext):
        c = self.visit(ctx.componentType())
        componentType, semantic = c[0], c[1]

        sizes = []
        description = []
        typeList = self.visit(ctx.typeList())
        for t in typeList:
            min = int(t[0].constant)
            max = int(t[1].constant)

            if min < 0 or max < 0:
                raise TypeError("Нельзя создать массив отрицательной размерности")

            description.append((min, max))
            val = max - min + 1
            sizes.append(val)

        if isinstance(componentType, ir.ArrayType):
            description.extend(c[2])

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
        first, _ = self.visit(ctx.constant(0))
        second, _ = self.visit(ctx.constant(1))
        return [first, second]

    def visitStringtype(self, ctx:PascalParser.StringtypeContext):
        if ctx.unsignedNumber():
            second, _ = self.visit(ctx.unsignedNumber())

        t = [ir.Constant(PascalTypes.int, 1), second]
        componentType, semantic = PascalTypes.char, PascalTypes.charSemanticLabel
        min = int(t[0].constant)
        max = int(t[1].constant)
        description = [(min, max)]
        val = max - min + 1
        sizes = [val]
        return PascalTypes.getArrayType(componentType, sizes), semantic, description

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
            else:
                self.symbolTable[varName] = allocaInstance, semanticLabel

    def visitConstantDefinition(self, ctx:PascalParser.ConstantDefinitionContext):
        ident = self.visit(ctx.identifier())
        val = self.visit(ctx.constant())
        self.symbolTable[ident] = val

    def visitConstant(self, ctx:PascalParser.ConstantContext):
        if ctx.string():
            return self.visit(ctx.string())
        if ctx.constantChr():
            return self.visit(ctx.constantChr())
        if ctx.identifier():
            ident = self.visit(ctx.identifier())
            num, semantic = self.symbolTable[ident]
        if ctx.unsignedNumber():
            num, semantic = self.visit(ctx.unsignedNumber())
        if ctx.sign() and ctx.sign().MINUS():
            if isinstance(num.type, ir.IntType):
                ty = num.type.width
                if num.type.width == 8:
                    ty = PascalTypes.int

                num = ir.Constant(ty, -int(num.constant))
            elif isinstance(num.type, (ir.FloatType, ir.DoubleType)):
                num = ir.Constant(num.type, -float(num.constant))
            else:
                raise TypeError("Cannot negate non-numeric type")
        return num, semantic

    def visitTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        text = ctx.getText()
        type = PascalTypes.strToType[text]
        return type

    def visitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        (variable, varSemantic) = self.visit(ctx.variable())
        (value, valSemantic) = self.visit(ctx.expression())
        if not isinstance(variable.type, ir.PointerType):
            raise TypeError("Нельзя присвоить значение константе")
        value = self.load_if_pointer(value)

        if not isinstance(self.pointee_type(variable), ir.ArrayType):
            value = castStoredValue(self.getBuilder(), variable, value)
        else:
            if varSemantic == PascalTypes.charSemanticLabel:
                arr_ty = self.pointee_type(variable)
                if isinstance(value.type, ir.IntType) and value.type.width == 8:
                    val = bytes(f'{chr(value.constant)}', "utf-8").decode("unicode_escape").encode("utf-8")
                    val = val.ljust(arr_ty.count, b"\x00")
                    value = ir.Constant(arr_ty, bytearray(val))
                elif isinstance(self.pointee_type(value), ir.ArrayType):
                    if value.type.count < arr_ty.count:
                        data = value.constant
                        target_size = arr_ty.count
                        pad_size = target_size - len(data)
                        if pad_size > 0:
                            data += b'\x00' * pad_size
                        value = ir.Constant(arr_ty, data)
                    elif value.type.count > arr_ty.count:
                        raise TypeError("Нельзя присвоить строку большего размера в переменную меньшего размера")

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

            right, rSemantic = self.visit(ctx.simpleExpression())
            operator = self.visit(ctx.additiveoperator())

            return addOperator(self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        left, lSemantic = self.visit(ctx.simpleExpression())
        if ctx.shiftOperator():
            left = self.load_if_pointer(left)
            if lSemantic != PascalTypes.numericSemanticLabel or not isinstance(left.type, ir.IntType):
                raise TypeError(f"Cannot apply shift operator {operator} to not integer type")

            operator = self.visit(ctx.shiftOperator())
            right, rSemantic = self.visit(ctx.shiftExpression())

            right = self.load_if_pointer(right)
            left, right = castValues(self.getBuilder(), left, right)

            if operator.SHL():
                return self.getBuilder().shl(left, right), lSemantic
            elif operator.SHR():
                return self.getBuilder().lshr(left, right), lSemantic

        return left, lSemantic

    def visitExpression(self, ctx:PascalParser.ExpressionContext):
        left, lSemantic = self.visit(ctx.shiftExpression(0))
        if ctx.relationaloperator():
            operator = self.visit(ctx.relationaloperator())
            right, rSemantic = self.visit(ctx.shiftExpression(1))

            return relOperator(self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitTerm(self, ctx:PascalParser.TermContext):
        left, lSemantic = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            right, rSemantic = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())

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
                    ind, _ = self.visit(ctx.expression(expr_index))
                    i_val = self.load_if_pointer(ind)
                    indices = [i_val]
                    expr_index += 1
                    while ctx.children[i + 2].symbol.type == PascalParser.COMMA:
                        i += 2
                        ind, _ = self.visit(ctx.expression(expr_index))
                        i_val = self.load_if_pointer(ind)
                        expr_index += 1
                        indices.append(i_val)

                    modifiers.append(("array_access", indices))

        v = self.symbolTable[identifier]
        currentNode, currentSemantic = v[0], v[1]
        array_desc = None
        if isinstance(self.pointee_type(currentNode), ir.ArrayType):
            if currentSemantic != PascalTypes.charSemanticLabel:
                array_desc = v[2]
            else:
                if len(v) < 3:
                    array_desc = [(1, self.pointee_type(currentNode).count)]
                else:
                    array_desc = v[2]

        for modType, modValue in modifiers:
            if modType == "field":
                currentNode, currentSemantic, array_desc = recordFieldAccess(self.getBuilder(), self.records, currentNode, modValue)
            elif modType == "array_access":
                currentNode, array_desc = arrayElementAccess(self.getBuilder(), array_desc, currentNode, modValue, self.module)

        # if self.leftPartDefinition.ArrayDescription() != None:
        #     if self.leftPartDefinition.ArrayDescription() != array_desc:
        #         raise TypeError(f"Ожидался массив размерности {self.leftPartDefinition.ArrayDescription()}, получен {array_desc}")

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