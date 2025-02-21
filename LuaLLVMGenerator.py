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

    def save(self, filename):
        with open(filename, "w") as f:
            f.write(repr(self.module))

    def visitChunk(self, ctx:LuaParser.ChunkContext):
        return self.visitChildren(ctx)

    def visitBlock(self, ctx:LuaParser.BlockContext):
        return self.visitChildren(ctx)

    # Присваивание
    def visitVariablestat(self, ctx:LuaParser.VariablestatContext):
        return self.visitChildren(ctx)

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

    return True

    # if len(error_listener.errors) == 0:
    #     return True
    # else:
    #     error_listener.print_errors()
    #     return False

inputFile = "test.lua"
outputFile = inputFile[:-4] + ".ll"
GenerateIR(inputFile, outputFile)