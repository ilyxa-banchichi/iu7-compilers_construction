from collections import deque
from antlr4.tree.Tree import TerminalNode
from antlr.PascalVisitor import PascalVisitor
from antlr.PascalParser import PascalParser
from llvmlite import ir, binding
from core.Errors import SemanticErrorListener
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
    def __init__(self, error_listener: SemanticErrorListener):
        self.context = ir.Context()
        self.module = ir.Module('pascal_program', context=self.context)
        self.builder = []
        self.symbolTable = SymbolTable()
        BuiltinSymbols.addBuiltinSymbols(self.symbolTable, self.module)

        self.currentFunction = []
        self.records = {}
        self.arrays = {}
        self.error_listener = error_listener

    def sizeof(self, typ: ir.Type, builder: ir.IRBuilder) -> ir.Value:
        null_ptr = ir.Constant(typ, None)
        gep = builder.gep(null_ptr, [ir.Constant(ir.IntType(32), 1)], inbounds=True)
        return builder.ptrtoint(gep, ir.IntType(64))

    def null_ptr(self, typ: ir.Type) -> ir.Constant:
        return ir.Constant(typ.as_pointer(), None)

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

    def add_error(self, ctx, msg):
        self.error_listener.semanticError(ctx.start.line, ctx.start.column, msg)
        raise Exception()

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
        if identifier in PascalTypes.strToType:
            self.add_error(ctx, f"Попытка переопределить тип {identifier}")

        if ctx.type_():
            if ctx.type_().structuredType().recordType():
                struct = self.context.get_identified_type(identifier)
                PascalTypes.strToType[identifier] = (struct, PascalTypes.structSemanticLabel)
                names, types, semantics, array_descriptions = self.visit(ctx.type_().structuredType())
                struct.set_body(*types)
                self.records[struct] = (names, semantics, array_descriptions)
                PascalTypes.strToType[identifier] = (struct, PascalTypes.structSemanticLabel)

            if ctx.type_().structuredType().arrayType():
                type, semantic, array_description = self.visit(ctx.type_().structuredType())
                PascalTypes.strToType[identifier] = (type, semantic, array_description)

        elif ctx.functionType():
            self.add_error(ctx, f"Unsupported")
        else:
            self.add_error(ctx, f"Incorrect type definition")

    def visitFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        identifier = self.visit(ctx.identifier())
        resultType, resultSemantic = ir.VoidType(), None
        if ctx.resultType():
            resultType, resultSemantic = self.visit(ctx.resultType())

        names, types, semantics, modifiers, arr_descs = self.visit(ctx.formalParameterList())

        funcType = ir.FunctionType(resultType, types)
        function = ir.Function(self.module, funcType, name=identifier)

        self.currentFunction.append(identifier)
        try:
            self.symbolTable[identifier] = (function, resultSemantic, semantics, arr_descs)
        except Exception as e:
            self.add_error(ctx, str(e))

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
        elif identifier == "new":
            return new(self, ctx)
        elif identifier == "dispose":
            return new(self, ctx)
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
            if not isinstance(t[0], ir.Constant) or not isinstance(t[1], ir.Constant):
                self.add_error(ctx, "Размерность массива должна задаваться константой")

            min = int(t[0].constant)
            max = int(t[1].constant)

            if min < 0 or max < 0:
                self.add_error(ctx, "Нельзя создать массив отрицательной размерности")

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
        self.add_error(ctx, "Not supported")

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

    def visitPointerType(self, ctx:PascalParser.PointerTypeContext):
        ty = self.visit(ctx.typeIdentifier())
        return ir.PointerType.as_pointer(ty[0]), ty[1]

    def visitVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        if not ctx.type_():
            return

        t = self.visit(ctx.type_())
        varType = t[0]
        semanticLabel = t[1]
        varNames = self.visit(ctx.identifierList())
        for varName in varNames:
            allocaInstance = self.getBuilder().alloca(varType, name=varName)
            try:
                if isinstance(varType, ir.ArrayType):
                    self.symbolTable[varName] = allocaInstance, semanticLabel, t[2]
                else:
                    self.symbolTable[varName] = allocaInstance, semanticLabel
            except Exception as e:
                self.add_error(ctx, str(e))

    def visitConstantDefinition(self, ctx:PascalParser.ConstantDefinitionContext):
        ident = self.visit(ctx.identifier())
        val = self.visit(ctx.constant())
        try:
            self.symbolTable[ident] = val
        except Exception as e:
            self.add_error(ctx, str(e))

    def visitConstant(self, ctx:PascalParser.ConstantContext):
        if ctx.string():
            return self.visit(ctx.string())
        if ctx.constantChr():
            return self.visit(ctx.constantChr())
        if ctx.identifier():
            ident = self.visit(ctx.identifier())
            try:
                num, semantic = self.symbolTable[ident]
            except Exception as e:
                self.add_error(ctx, str(e))
        if ctx.unsignedNumber():
            num, semantic = self.visit(ctx.unsignedNumber())
        if ctx.sign() and ctx.sign().MINUS():
            if isinstance(num.type, ir.IntType):
                ty = num.type
                if ty.width == 8:
                    ty = PascalTypes.int

                num = ir.Constant(ty, -int(num.constant))
            elif isinstance(num.type, (ir.FloatType, ir.DoubleType)):
                num = ir.Constant(num.type, -float(num.constant))
            else:
                self.add_error(ctx, "Cannot negate non-numeric type")
        return num, semantic

    def visitTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        text = ctx.getText()
        try:
            type = PascalTypes.strToType[text]
        except Exception as e:
            self.add_error(ctx, f"Несуществующий тип {text}")
        return type

    def visitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        (variable, varSemantic) = self.visit(ctx.variable())
        (value, valSemantic) = self.visit(ctx.expression())
        if not isinstance(variable.type, ir.PointerType):
            self.add_error(ctx, "Нельзя присвоить значение константе")

        if valSemantic == "nullptr":
            value = self.null_ptr(variable.type.pointee.pointee)
        else:
            value = self.load_if_pointer(value)

        if not isinstance(self.pointee_type(variable), ir.ArrayType) and not isinstance(self.pointee_type(variable), ir.PointerType):
            value = castStoredValue(ctx, self, variable, value)
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
                        self.add_error(ctx, "Нельзя присвоить строку большего размера в переменную меньшего размера")

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

            return addOperator(ctx, self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        left, lSemantic = self.visit(ctx.simpleExpression())
        if ctx.shiftOperator():
            left = self.load_if_pointer(left)
            if lSemantic != PascalTypes.numericSemanticLabel or not isinstance(left.type, ir.IntType):
                self.add_error(ctx, f"Cannot apply shift operator {operator} to not integer type")

            operator = self.visit(ctx.shiftOperator())
            right, rSemantic = self.visit(ctx.shiftExpression())

            right = self.load_if_pointer(right)
            left, right = castValues(ctx, self, left, right)

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

            return relOperator(ctx, self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitTerm(self, ctx:PascalParser.TermContext):
        left, lSemantic = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            right, rSemantic = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())

            return mulOperator(ctx, self, left, lSemantic, right, rSemantic, operator)

        return left, lSemantic

    def visitSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        signedFactor, semantic = self.visitChildren(ctx)
        if ctx.MINUS():
            if isinstance(signedFactor, ir.Constant):
                if not self.is_pointer(signedFactor):
                    if isinstance(signedFactor.type, ir.IntType):
                        ty = signedFactor.type
                        if ty.width == 8:
                            ty = PascalTypes.int

                        signedFactor = ir.Constant(ty, -int(signedFactor.constant))
                    elif isinstance(signedFactor.type, (ir.FloatType, ir.DoubleType)):
                        signedFactor = ir.Constant(signedFactor.type, -float(signedFactor.constant))
                    else:
                        self.add_error(ctx, "Cannot negate non-numeric type")
            elif isinstance(signedFactor.type, ir.IntType):
                signedFactor = self.getBuilder().sub(ir.Constant(signedFactor.type, 0), signedFactor)
            elif isinstance(signedFactor.type, (ir.FloatType, ir.DoubleType)):
                signedFactor = self.getBuilder().fsub(ir.Constant(signedFactor.type, 0), signedFactor)
            else:
                self.add_error(ctx, "Cannot negate non-numeric type")

        return signedFactor, semantic
    
    def visitUnsignedConstant(self, ctx:PascalParser.UnsignedConstantContext):
        if ctx.NIL():
            return "nullptr", "nullptr"
        else:
            return self.visitChildren(ctx)

    def visitFactor(self, ctx:PascalParser.FactorContext):
        if ctx.variable():
            factor, semantic = self.visit(ctx.variable())
        elif ctx.LPAREN():
            factor, semantic = self.visit(ctx.expression())
        elif ctx.unsignedConstant():
            factor, semantic = self.visit(ctx.unsignedConstant())
        elif ctx.NOT():
            factor, semantic = self.visit(ctx.factor())
            if isinstance(factor.type, ir.IntType):
                factor = self.getBuilder().xor(factor, ir.Constant(factor.type, -1))
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

                elif child.symbol.type == PascalParser.POINTER:
                    modifiers.append(("pointer", None))

        try:
            v = self.symbolTable[identifier]
        except Exception as e:
            self.add_error(ctx, str(e))
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
                currentNode, array_desc = arrayElementAccess(ctx, self, array_desc, currentNode, modValue, self.module)
            elif modType == "pointer":
                if self.is_pointer(currentNode):
                    currentNode = self.getBuilder().load(currentNode)
                else:
                    self.add_error(ctx, "Невозможно разыменовать не указатель")
            elif modType == "at":
                currentNode = ir.PointerType.as_pointer(currentNode)
        if ctx.AT():
            tptr = ir.PointerType.as_pointer(self.pointee_type(currentNode))
            ptr = self.getBuilder().alloca(tptr)
            currentNode = self.getBuilder().store(currentNode, ptr)
            currentNode = ptr

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