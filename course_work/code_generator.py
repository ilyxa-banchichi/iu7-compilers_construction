from llvmlite import ir, binding
from antlr4 import *
from antlr.PascalLexer import PascalLexer
from antlr.PascalParser import PascalParser
from core.LLVMPascalVisitor import LLVMPascalVisitor

def generateIR(input_filename, output_filename):
    lexer = PascalLexer(FileStream(input_filename))
    stream = CommonTokenStream(lexer)
    parser = PascalParser(stream)

    # error_listener = TinyCErrorListener()
    # parser.removeErrorListeners()
    # parser.addErrorListener(error_listener)

    tree = parser.program()
    #print(tree.toStringTree(recog=parser))

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

def generateForFile(inputFile):
    outputFile = inputFile[:-4] + ".ll"

    print("For " + inputFile)
    generateIR(inputFile, outputFile)
    print("Created " + outputFile)

allTests = [
    "tests/types/types.pas",
    "tests/aritmhetic/aritmhetic.pas",
    "tests/bits/bits.pas",
    "tests/relational/relational.pas",
    "tests/logical/logical.pas",
    "tests/ifelse/ifelse.pas",
    "tests/cycles/cycles.pas",
    "tests/structure/structure.pas",
]

generateForFile("tests/structure/structure.pas")

# for test in allTests:
#     generateForFile(test)