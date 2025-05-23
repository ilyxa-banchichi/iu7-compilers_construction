from llvmlite import ir, binding
from antlr4 import *
from antlr.PascalLexer import PascalLexer
from antlr.PascalParser import PascalParser
from core.LLVMPascalVisitor import LLVMPascalVisitor
from core.Errors import SyntaxErrorListener
from core.Errors import SemanticErrorListener
import traceback

def generateIR(input_filename, output_filename):
    print("For " + input_filename)
    lexer = PascalLexer(FileStream(input_filename))
    stream = CommonTokenStream(lexer)
    parser = PascalParser(stream)

    error_listener = SyntaxErrorListener()
    parser.removeErrorListeners()
    parser.addErrorListener(error_listener)
    tree = parser.program()
    if len(error_listener.errors) != 0:
        error_listener.print_errors()
        return False

    # print(tree.toStringTree(recog=parser))

    error_listener = SemanticErrorListener()
    generator = LLVMPascalVisitor(error_listener)
    try:
        generator.visit(tree)
    except Exception as e:
        if len(error_listener.errors) != 0:
            error_listener.print_errors()
        else:
            print("Unhandeled error", e)
            traceback.print_exc()
        return False

    print("Created " + output_filename)
    generator.save(output_filename)
    return True

def generateForFile(inputFile) -> str:
    outputFile = inputFile[:-4] + ".ll"
    status = generateIR(inputFile, outputFile)

    if status:
        return outputFile
    else:
        return None