import sys
import llvmlite.binding as llvm
from llvmlite import ir
import ctypes
from code_generator import generateForFile

def exec(filename):
    filename = generateForFile(filename)
    with open(filename, "r") as f:
        ir_code = str(f.read())

    llvm.initialize()
    llvm.initialize_native_target()
    llvm.initialize_native_asmprinter()

    llvm_module = llvm.parse_assembly(ir_code)
    llvm_module.verify()

    # Создаем исполнительный контекст и компилятор
    target_machine = llvm.Target.from_default_triple().create_target_machine()

    # Преобразуем IR в машинный код
    with llvm.create_mcjit_compiler(llvm_module, target_machine) as execution_engine:
        execution_engine.finalize_object()
        execution_engine.run_static_constructors()

        # Получаем ссылку на функцию main
        main_func = execution_engine.get_function_address("main")

        # Выполняем функцию main
        ctypes.CFUNCTYPE(None)(main_func)()

if len(sys.argv) > 1:
    filename = sys.argv[1]
else:
    filename = "tests/programs/AABBCollision.pas"

# allTests = [
#     "tests/types/types.pas",
#     "tests/aritmhetic/aritmhetic.pas",
#     "tests/bits/bits.pas",
#     "tests/relational/relational.pas",
#     "tests/logical/logical.pas",
#     "tests/ifelse/ifelse.pas",
#     "tests/cycles/cycles.pas",
#     "tests/array/array.pas",
#     "tests/function/function.pas",
#     "tests/structure/structure.pas",
#     "tests/programs/LinePlaneIntersection.pas",
#     "tests/programs/AABBCollision.pas",
# ]

# for test in allTests:
#     exec(test)

exec(filename)
