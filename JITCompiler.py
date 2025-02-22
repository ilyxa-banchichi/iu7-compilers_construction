from antlr4 import *
import llvmlite.binding as llvm
from LuaLLVMGenerator import GenerateIR
from ctypes import CFUNCTYPE, c_double

class JITCompiler:
    def __init__(self, llvm_module):
        self.module = llvm_module

    def execute(self):
        llvm.initialize()
        llvm.initialize_native_target()
        llvm.initialize_native_asmprinter()

        target_machine = llvm.Target.from_default_triple().create_target_machine()
        try:
            backing_mod = llvm.parse_assembly(str(self.module))
        except RuntimeError as e:
            print(f"Error during parsing: {e}")
            exit(1)
        engine = llvm.create_mcjit_compiler(backing_mod, target_machine)

        engine.finalize_object()
        entry = engine.get_function_address("main")

        # Преобразуем в C-функцию
        func_type = CFUNCTYPE(c_double)
        compiled_func = func_type(entry)
        return compiled_func()

inputFile = "test.lua"
outputFile = inputFile[:-4] + ".ll"
status, module = GenerateIR(inputFile, outputFile)

jit = JITCompiler(module)
result = jit.execute()

# print(f"Результат: {result}")