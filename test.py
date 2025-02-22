from llvmlite import ir
from antlr4 import *
from antlr.SmalltalkLexer import SmalltalkLexer
from antlr.SmalltalkParser import SmalltalkParser
from antlr.SmalltalkVisitor import SmalltalkVisitor

class LLVMCodeGenerator(SmalltalkVisitor):
    def __init__(self):
        self.module = ir.Module(name="smalltalk_module")
        self.builder = None
        self.functions = {}
        self.current_function = None

    def visitScript(self, ctx: SmalltalkParser.ScriptContext):
        # Генерация кода для всего скрипта
        self.visit(ctx.sequence())
        return self.module

    def visitSequence(self, ctx: SmalltalkParser.SequenceContext):
        # Генерация кода для последовательности выражений
        for child in ctx.children:
            self.visit(child)

    def visitStatementAnswer(self, ctx: SmalltalkParser.StatementAnswerContext):
        # Генерация кода для ответа
        return self.visit(ctx.answer())

    def visitStatementExpressionsAnswer(self, ctx: SmalltalkParser.StatementExpressionsAnswerContext):
        # Генерация кода для выражений с ответом
        self.visit(ctx.expressions())
        return self.visit(ctx.answer())

    def visitStatementExpressions(self, ctx: SmalltalkParser.StatementExpressionsContext):
        # Генерация кода для выражений
        self.visit(ctx.expressions())

    def visitAnswer(self, ctx: SmalltalkParser.AnswerContext):
        # Генерация кода для ответа
        return self.visit(ctx.expression())

    def visitExpression(self, ctx: SmalltalkParser.ExpressionContext):
        # Генерация кода для выражения
        return self.visitChildren(ctx)

    def visitExpressions(self, ctx: SmalltalkParser.ExpressionsContext):
        # Генерация кода для списка выражений
        for expr in ctx.expression():
            self.visit(expr)

    def visitExpressionList(self, ctx: SmalltalkParser.ExpressionListContext):
        # Генерация кода для списка выражений
        self.visit(ctx.expression())

    def visitCascade(self, ctx: SmalltalkParser.CascadeContext):
        # Генерация кода для каскадного сообщения
        self.visit(ctx.keywordSend() or ctx.binarySend())
        for message in ctx.message():
            self.visit(message)

    def visitMessage(self, ctx: SmalltalkParser.MessageContext):
        # Генерация кода для сообщения
        return self.visitChildren(ctx)

    def visitAssignment(self, ctx: SmalltalkParser.AssignmentContext):
        # Генерация кода для присваивания
        var_name = ctx.variable().getText()
        value = self.visit(ctx.expression())
        # Создаем глобальную переменную
        var = ir.GlobalVariable(self.module, value.type, var_name)
        var.initializer = value
        return var

    def visitVariable(self, ctx: SmalltalkParser.VariableContext):
        # Генерация кода для переменной
        var_name = ctx.getText()
        if var_name in self.functions:
            return self.functions[var_name]
        return None

    def visitBinarySend(self, ctx: SmalltalkParser.BinarySendContext):
        # Генерация кода для бинарного сообщения
        left = self.visit(ctx.unarySend())
        if ctx.binaryTail():
            right = self.visit(ctx.binaryTail())
            # Пример: сложение
            if ctx.binaryTail().binaryMessage().BINARY_SELECTOR().getText() == '+':
                return self.builder.add(left, right)
        return left

    def visitUnarySend(self, ctx: SmalltalkParser.UnarySendContext):
        # Генерация кода для унарного сообщения
        operand = self.visit(ctx.operand())
        if ctx.unaryTail():
            # Пример: вызов метода
            method_name = ctx.unaryTail().unaryMessage().unarySelector().getText()
            if method_name in self.functions:
                return self.builder.call(self.functions[method_name], [operand])
        return operand

    def visitKeywordSend(self, ctx: SmalltalkParser.KeywordSendContext):
        # Генерация кода для ключевого сообщения
        self.visit(ctx.binarySend())
        self.visit(ctx.keywordMessage())

    def visitKeywordMessage(self, ctx: SmalltalkParser.KeywordMessageContext):
        # Генерация кода для ключевого сообщения
        for pair in ctx.keywordPair():
            self.visit(pair)

    def visitKeywordPair(self, ctx: SmalltalkParser.KeywordPairContext):
        # Генерация кода для пары ключ-значение
        self.visit(ctx.binarySend())

    def visitOperand(self, ctx: SmalltalkParser.OperandContext):
        # Генерация кода для операнда
        return self.visitChildren(ctx)

    def visitSubexpression(self, ctx: SmalltalkParser.SubexpressionContext):
        # Генерация кода для подвыражения
        return self.visit(ctx.expression())

    def visitLiteral(self, ctx: SmalltalkParser.LiteralContext):
        # Генерация кода для литерала
        return self.visitChildren(ctx)

    def visitRuntimeLiteral(self, ctx: SmalltalkParser.RuntimeLiteralContext):
        # Генерация кода для runtime литерала
        return self.visitChildren(ctx)

    def visitBlock(self, ctx: SmalltalkParser.BlockContext):
        # Генерация кода для блока
        if ctx.blockParamList():
            self.visit(ctx.blockParamList())
        if ctx.sequence():
            self.visit(ctx.sequence())

    def visitBlockParamList(self, ctx: SmalltalkParser.BlockParamListContext):
        # Генерация кода для списка параметров блока
        for param in ctx.BLOCK_PARAM():
            param_name = param.getText()
            # Создаем переменную для параметра
            var = ir.GlobalVariable(self.module, ir.IntType(32), param_name)
            self.functions[param_name] = var

    def visitDynamicDictionary(self, ctx: SmalltalkParser.DynamicDictionaryContext):
        # Генерация кода для динамического словаря
        if ctx.expressions():
            self.visit(ctx.expressions())

    def visitDynamicArray(self, ctx: SmalltalkParser.DynamicArrayContext):
        # Генерация кода для динамического массива
        if ctx.expressions():
            self.visit(ctx.expressions())

    def visitParsetimeLiteral(self, ctx: SmalltalkParser.ParsetimeLiteralContext):
        # Генерация кода для литерала времени компиляции
        return self.visitChildren(ctx)

    def visitNumber(self, ctx: SmalltalkParser.NumberContext):
        # Генерация кода для числа
        return self.visitChildren(ctx)

    def visitNumberExp(self, ctx: SmalltalkParser.NumberExpContext):
        # Генерация кода для числа с экспонентой
        base = self.visit(ctx.stFloat() or ctx.stInteger())
        exponent = self.visit(ctx.stInteger())
        return self.builder.fmul(base, self.builder.fpow(ir.Constant(ir.FloatType(), 10.0), exponent))

    def visitCharConstant(self, ctx: SmalltalkParser.CharConstantContext):
        # Генерация кода для символьной константы
        char = ctx.getText()[1]  # Убираем кавычки
        return ir.Constant(ir.IntType(8), ord(char))

    def visitHex(self, ctx: SmalltalkParser.Hex_Context):
        # Генерация кода для шестнадцатеричного числа
        hex_value = ctx.getText()
        return ir.Constant(ir.IntType(32), int(hex_value, 16))

    def visitStInteger(self, ctx: SmalltalkParser.StIntegerContext):
        # Генерация кода для целого числа
        int_value = int(ctx.getText())
        return ir.Constant(ir.IntType(32), int_value)

    def visitStFloat(self, ctx: SmalltalkParser.StFloatContext):
        # Генерация кода для числа с плавающей точкой
        float_value = float(ctx.getText())
        return ir.Constant(ir.FloatType(), float_value)

    def visitPseudoVariable(self, ctx: SmalltalkParser.PseudoVariableContext):
        # Генерация кода для псевдопеременной
        return ir.Constant(ir.IntType(32), 0)  # Пример: nil

    def visitString(self, ctx: SmalltalkParser.StringContext):
        # Генерация кода для строки
        string_value = ctx.getText()[1:-1]  # Убираем кавычки
        return ir.GlobalVariable(self.module, ir.ArrayType(ir.IntType(8), len(string_value)), string_value)

    def visitSymbol(self, ctx: SmalltalkParser.SymbolContext):
        # Генерация кода для символа
        symbol_value = ctx.getText()[1:]  # Убираем решетку
        return ir.GlobalVariable(self.module, ir.ArrayType(ir.IntType(8), len(symbol_value)), symbol_value)

    def visitPrimitive(self, ctx: SmalltalkParser.PrimitiveContext):
        # Генерация кода для примитива
        return ir.Constant(ir.IntType(32), 0)  # Пример: примитив

    def visitBareSymbol(self, ctx: SmalltalkParser.BareSymbolContext):
        # Генерация кода для символа без решетки
        symbol_value = ctx.getText()
        return ir.GlobalVariable(self.module, ir.ArrayType(ir.IntType(8), len(symbol_value)), symbol_value)

    def visitLiteralArray(self, ctx: SmalltalkParser.LiteralArrayContext):
        # Генерация кода для литерального массива
        self.visit(ctx.literalArrayRest())

    def visitLiteralArrayRest(self, ctx: SmalltalkParser.LiteralArrayRestContext):
        # Генерация кода для элементов литерального массива
        for child in ctx.children:
            self.visit(child)

    def visitBareLiteralArray(self, ctx: SmalltalkParser.BareLiteralArrayContext):
        # Генерация кода для литерального массива без скобок
        self.visit(ctx.literalArrayRest())

    def visitUnaryTail(self, ctx: SmalltalkParser.UnaryTailContext):
        # Генерация кода для унарного хвоста
        self.visit(ctx.unaryMessage())
        if ctx.unaryTail():
            self.visit(ctx.unaryTail())

    def visitUnaryMessage(self, ctx: SmalltalkParser.UnaryMessageContext):
        # Генерация кода для унарного сообщения
        self.visit(ctx.unarySelector())

    def visitUnarySelector(self, ctx: SmalltalkParser.UnarySelectorContext):
        # Генерация кода для унарного селектора
        selector = ctx.getText()
        if selector in self.functions:
            return self.functions[selector]
        return None

    def visitKeywords(self, ctx: SmalltalkParser.KeywordsContext):
        # Генерация кода для ключевых слов
        for keyword in ctx.KEYWORD():
            self.visit(keyword)

    def visitReference(self, ctx: SmalltalkParser.ReferenceContext):
        # Генерация кода для ссылки на переменную
        return self.visit(ctx.variable())

    def visitBinaryTail(self, ctx: SmalltalkParser.BinaryTailContext):
        # Генерация кода для бинарного хвоста
        self.visit(ctx.binaryMessage())
        if ctx.binaryTail():
            self.visit(ctx.binaryTail())

    def visitBinaryMessage(self, ctx: SmalltalkParser.BinaryMessageContext):
        # Генерация кода для бинарного сообщения
        selector = ctx.BINARY_SELECTOR().getText()
        if selector == '+':
            left = self.visit(ctx.unarySend() or ctx.operand())
            right = self.visit(ctx.unarySend() or ctx.operand())
            return self.builder.add(left, right)
        return None

# Входной код на Smalltalk
input_code = """
| x y |
x := 5.
y := x + 10.
^ y
"""

# Лексический и синтаксический анализ
lexer = SmalltalkLexer(InputStream(input_code))
stream = CommonTokenStream(lexer)
parser = SmalltalkParser(stream)
tree = parser.script()

# Генерация LLVM IR
generator = LLVMCodeGenerator()
llvm_ir = generator.visit(tree)

# Вывод LLVM IR
print(tree.toStringTree(recog=parser))
print(llvm_ir)