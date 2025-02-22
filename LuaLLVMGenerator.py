from llvmlite import ir, binding
from antlr4 import *
from antlr.LuaLexer import LuaLexer
from antlr.LuaParser import LuaParser
from antlr.LuaParserVisitor import LuaParserVisitor

class LuaLLVMGenerator(LuaParserVisitor):
    def __init__(self):
        self.module = ir.Module()
        self.builder = ir.IRBuilder()
        self.global_context = ir.global_context
        self.variables = {}
        self.print_function = None

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def visitChunk(self, ctx: LuaParser.ChunkContext):
        # Генерируем код для блока (функция main)
        func_type = ir.FunctionType(ir.VoidType(), [])
        self.function = ir.Function(self.module, func_type, name="main")
        block = self.function.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)

        # Посещаем детей блока
        self.visitChildren(ctx)

        self.builder.ret_void()

        return self.module

    def visitBlock(self, ctx: LuaParser.BlockContext):
        return self.visitChildren(ctx)

    def visitStat(self, ctx:LuaParser.StatContext):
        return self.visitChildren(ctx)

    def visitExp(self, ctx):
        # Если это число, то создаем константу i32
        if ctx.number():
            num_value = int(ctx.number().getText())
            return ir.Constant(ir.IntType(32), num_value)
        return self.visitChildren(ctx)

    def visitFunctioncall(self, ctx: LuaParser.FunctioncallContext):
        function_name = ctx.getChild(0).getText()  # print
        if function_name == "print":
            return self.generatePrintFunctionCall(ctx)

        return self.visitChildren(ctx)

    def generatePrintFunctionCall(self, ctx: LuaParser.FunctioncallContext):
        if self.print_function is None:
            print_type = ir.FunctionType(ir.VoidType(), [ir.PointerType(ir.IntType(8))])
            self.print_function = ir.Function(self.module, print_type, "print")

        args = []
        if ctx.getChildCount() > 1:
            explistCtx = ctx.nameAndArgs().args().explist()
            for exp in explistCtx.exp():
                value = self.visit(exp)
                print(value)
                if isinstance(value, ir.Constant):  # Если это константа (например, число)
                    if value.type == ir.IntType(32):  # Если это i32 (например, 5)
                        # Преобразуем число в строку
                        str_value = str(value.constant)
                        global_var = ir.GlobalVariable(self.module, ir.ArrayType(ir.IntType(8), len(str_value) + 1), "str")
                        global_var.initializer = ir.Constant(ir.ArrayType(ir.IntType(8), len(str_value) + 1), [ord(c) for c in str_value] + [0])
                        args.append(self.builder.bitcast(global_var, ir.PointerType(ir.IntType(8))))  # Преобразуем в указатель на строку
                    else:
                        args.append(value)
                else:
                    # Для других типов значений, возможно, стоит тоже провести нужные преобразования
                    args.append(value)

        call = self.builder.call(self.print_function, args)
        return call

def GenerateIR(input_filename, output_filename):
    lexer = LuaLexer(FileStream(input_filename))
    stream = CommonTokenStream(lexer)
    parser = LuaParser(stream)

    # error_listener = TinyCErrorListener()
    # parser.removeErrorListeners()
    # parser.addErrorListener(error_listener)

    tree = parser.chunk()
    print(tree.toStringTree(recog=parser))

    # generator = LuaLLVMGenerator(error_listener)
    generator = LuaLLVMGenerator()
    generator.visit(tree)
    generator.save(output_filename)

    return True, generator.module

    # if len(error_listener.errors) == 0:
    #     return True
    # else:
    #     error_listener.print_errors()
    #     return False

inputFile = "test.lua"
outputFile = inputFile[:-4] + ".ll"
GenerateIR(inputFile, outputFile)