import sys
from antlr4 import *
import llvmlite.binding as llvm
from LuaLLVMGenerator import LLVMGenerator
from AstVisitor import parse_expression
from ctypes import CFUNCTYPE, c_double

class JITCompiler:
    def __init__(self, llvm_gen):
        self.module = llvm_gen.module

    def execute(self):
        llvm.initialize()
        llvm.initialize_native_target()
        llvm.initialize_native_asmprinter()

        target_machine = llvm.Target.from_default_triple().create_target_machine()
        backing_mod = llvm.parse_assembly(str(self.module))
        engine = llvm.create_mcjit_compiler(backing_mod, target_machine)

        engine.finalize_object()
        entry = engine.get_function_address("main")

        # Преобразуем в C-функцию
        func_type = CFUNCTYPE(c_double)
        compiled_func = func_type(entry)
        return compiled_func()

if len(sys.argv) != 2:
    print("Usage: python generate_il.py <path_to_lua_file>")
    sys.exit(1)

filename = sys.argv[1]
with open(filename, 'r') as f:
    input_stream = InputStream(f.read())

# Создаем AST из Lua-выражения
ast = parse_expression(input_stream)

# Генерируем LLVM IR
llvm_gen = LLVMGenerator()
llvm_gen.generate_ir(ast)

filename = filename.replace(".lua", ".il")
llvm_gen.save_ir(filename)

# Компилируем и исполняем
jit = JITCompiler(llvm_gen)
result = jit.execute()

print(f"Результат: {result}")