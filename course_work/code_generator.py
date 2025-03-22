from llvmlite import ir, binding
from antlr4 import *
from antlr.PascalLexer import PascalLexer
from antlr.PascalParser import PascalParser
from core.LLVMPascalVisitor import LLVMPascalVisitor

def GenerateIR(input_filename, output_filename):
    lexer = PascalLexer(FileStream(input_filename))
    stream = CommonTokenStream(lexer)
    parser = PascalParser(stream)

    # error_listener = TinyCErrorListener()
    # parser.removeErrorListeners()
    # parser.addErrorListener(error_listener)

    tree = parser.program()
    print(tree.toStringTree(recog=parser))

    # generator = LLVMPascalVisitor(error_listener)
    generator = LLVMPascalVisitor()
    generator.visit(tree)
    generator.save(output_filename)

    # return True, generator.module

    # if len(error_listener.errors) == 0:
    #     return True
    # else:
    #     error_listener.print_errors()
    #     return False

inputFile = "tests/types/types.pas"
outputFile = inputFile[:-4] + ".ll"
GenerateIR(inputFile, outputFile)