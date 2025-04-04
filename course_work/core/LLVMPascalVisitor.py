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
        return self.type[-1]

    def Semantic(self):
        return self.semantic[-1]

    def Top(self):
        return self.type[-1], self.semantic[-1]

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

    def visitSimpleExpression(self, ctx:PascalParser.SimpleExpressionContext):
        term, lSemantic = self.visit(ctx.term())
        if ctx.additiveoperator():

            self.leftPartDefinition.Enter(term.type, lSemantic)
            right, rSemantic = self.visit(ctx.simpleExpression())
            operator = self.visit(ctx.additiveoperator())
            self.leftPartDefinition.Exit()

            if lSemantic != PascalTypes.numericSemanticLabel:
                raise TypeError(f"Cannot apply operator {operator.getText()} to not numeric type {term, lSemantic}")

            if rSemantic != lSemantic or term.type != right.type:
                raise TypeError(f"Cannot apply operator {operator.getText()} to different types {term.type} and {right.type}")

            if isinstance(term.type, ir.FloatType):
                if operator.PLUS():
                    return self.builder.fadd(term, right), lSemantic
                elif operator.MINUS():
                    return self.builder.fsub(term, right), lSemantic
                elif operator.OR():
                    raise TypeError(f"Cannot apply operator {operator.OR()} to float types")
            elif isinstance(term.type, ir.IntType):
                if operator.PLUS():
                    return self.builder.add(term, right), lSemantic
                elif operator.MINUS():
                    return self.builder.sub(term, right), lSemantic
                elif operator.OR():
                    return self.builder.or_(term, right), lSemantic
            else:
                raise TypeError(f"Cannot apply additive operator to type {term.type}")

        return term, lSemantic

    def visitShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        left, lSemantic = self.visit(ctx.simpleExpression())
        if ctx.shiftOperator():
            operator = self.visit(ctx.shiftOperator())
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.shiftExpression())
            self.leftPartDefinition.Exit()

            if operator.SHL():
                return self.builder.shl(left, right), lSemantic
            elif operator.SHR():
                return self.builder.lshr(left, right), lSemantic

        return left, lSemantic

    def visitExpression(self, ctx:PascalParser.ExpressionContext):
        left, lSemantic = self.visit(ctx.shiftExpression(0))
        if ctx.relationaloperator():
            operator = self.visit(ctx.relationaloperator())
            self.leftPartDefinition.Enter(left.type, lSemantic)
            right, rSemantic = self.visit(ctx.shiftExpression(1))
            self.leftPartDefinition.Exit()

            if lSemantic != PascalTypes.numericSemanticLabel:
                raise TypeError(f"Cannot apply operator {operator.getText()} to not numeric type {left, lSemantic}")

            if rSemantic != lSemantic or left.type != right.type:
                raise TypeError(f"Cannot apply operator {operator.getText()} to different types {left.type} and {right.type}")

            if isinstance(left.type, ir.FloatType):
                    return self.builder.fcmp_ordered(operator, left, right), PascalTypes.boolSemanticLabel
            elif isinstance(left.type, ir.IntType):
                if left.type.width == 8:
                    return self.builder.icmp_unsigned(operator, left, right), PascalTypes.boolSemanticLabel
                else:
                    return self.builder.icmp_signed(operator, left, right), PascalTypes.boolSemanticLabel


        return left, lSemantic

    def visitTerm(self, ctx:PascalParser.TermContext):
        signedFactor, lSemantic = self.visit(ctx.signedFactor())

        if ctx.multiplicativeoperator():
            self.leftPartDefinition.Enter(signedFactor.type, lSemantic)
            right, rSemantic = self.visit(ctx.term())
            operator = self.visit(ctx.multiplicativeoperator())
            self.leftPartDefinition.Exit()

            if lSemantic != PascalTypes.numericSemanticLabel:
                raise TypeError(f"Cannot apply operator {operator.getText()} to not numeric type {signedFactor, lSemantic}")

            if rSemantic != lSemantic or signedFactor.type != right.type:
                raise TypeError(f"Cannot apply operator {operator.getText()} to different types {signedFactor.type} and {right.type}")

            if isinstance(signedFactor.type, ir.FloatType):
                if operator.STAR():
                    return self.builder.fmul(signedFactor, right), lSemantic
                elif operator.SLASH():
                    return self.builder.fdiv(signedFactor, right), lSemantic
                elif operator.DIV():
                    raise TypeError(f"Cannot apply operator {operator.DIV()} to float types")
                elif operator.MOD():
                    raise TypeError(f"Cannot apply operator {operator.MOD()} to float types")
                elif operator.AND():
                    raise TypeError(f"Cannot apply operator {operator.AND()} to float types")

            elif isinstance(signedFactor.type, ir.IntType):
                if operator.STAR():
                    return self.builder.mul(signedFactor, right), lSemantic
                elif operator.AND():
                    return self.builder.and_(signedFactor, right), lSemantic

                if signedFactor.type.width == 8:
                    if operator.SLASH():
                        af = self.builder.uitofp(signedFactor, ir.FloatType())
                        bf = self.builder.uitofp(right, ir.FloatType())
                        return self.builder.fdiv(af, bf), lSemantic
                    elif operator.DIV():
                        return self.builder.udiv(signedFactor, right), lSemantic
                    elif operator.MOD():
                        return self.builder.urem(signedFactor, right), lSemantic
                else:
                    if operator.SLASH():
                        af = self.builder.sitofp(signedFactor, ir.FloatType())
                        bf = self.builder.sitofp(right, ir.FloatType())
                        return self.builder.fdiv(af, bf), lSemantic
                    elif operator.DIV():
                        return self.builder.sdiv(signedFactor, right), lSemantic
                    elif operator.MOD():
                        return self.builder.srem(signedFactor, right), lSemantic

        return signedFactor, lSemantic

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
        factor, semantic = self.visitChildren(ctx)
        if self.is_pointer(factor):
            factor = self.builder.load(factor)

        if ctx.NOT():
            if isinstance(factor.type, ir.IntType):
                factor = self.builder.xor(factor, ir.Constant(factor.type, -1))

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

    def visitShiftOperator(self, ctx:PascalParser.ShiftOperatorContext):
        return ctx

    def visitRelationaloperator(self, ctx:PascalParser.RelationaloperatorContext):
        if ctx.EQUAL():
            return '=='
        elif ctx.NOT_EQUAL():
            return '!='
        elif ctx.LT():
            return '<'
        elif ctx.LE():
            return '<='
        elif ctx.GE():
            return '>='
        elif ctx.GT():
            return '>'
        elif ctx.IN():
            raise TypeError("In operator not support")

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
        if isinstance(self.leftPartDefinition.Type(), ir.IntType):
            raise TypeError(f"Cannot create float in this context. lType: {self.leftPartDefinition.Type()}")

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
            if self.leftPartDefinition.Type().element == ir.IntType(8):
                if len(val) > 1:
                    raise TypeError("Cannot create char in this context")

                return ir.Constant(self.leftPartDefinition.Type(), ord(val)), PascalTypes.charSemanticLabel
            else:
                raise TypeError(f"Cannot create string in this context. LType {self.leftPartDefinition.Type()}")

        valLenWithTerm = len(val) + 1
        if valLenWithTerm > self.leftPartDefinition.Type().count:
            raise TypeError(f"Длина строки {valLenWithTerm} привышает размер переменной string {self.leftPartDefinition.Type().count}")
        elif valLenWithTerm < self.leftPartDefinition.Type().count:
            val = val.ljust(self.leftPartDefinition.Type().count - 1, b"\x00")

        return ir.Constant(self.leftPartDefinition.Type(), bytearray(val + b"\x00")), PascalTypes.charSemanticLabel
