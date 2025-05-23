import sys
import llvmlite.binding as llvm
from llvmlite import ir
import ctypes
from code_generator import generateForFile

def exec(filename):
    filename = generateForFile(filename)
    if filename == None:
        return

    with open(filename, "r") as f:
        ir_code = str(f.read())

    llvm.initialize()
    llvm.initialize_native_target()
    llvm.initialize_native_asmprinter()

    llvm_module = llvm.parse_assembly(ir_code)
    llvm_module.verify()

    target_machine = llvm.Target.from_default_triple().create_target_machine()

    with llvm.create_mcjit_compiler(llvm_module, target_machine) as execution_engine:
        execution_engine.finalize_object()
        execution_engine.run_static_constructors()

        main_func = execution_engine.get_function_address("main")

        ctypes.CFUNCTYPE(None)(main_func)()

if len(sys.argv) > 1:
    filename = sys.argv[1]
exec(filename)

# allTests = [
#     "tests/types/types.pas",
#     "tests/constants/constants.pas",
#     "tests/pointer/pointer.pas",
#     "tests/aritmhetic/aritmhetic.pas",
#     "tests/bits/bits.pas",
#     "tests/relational/relational.pas",
#     "tests/logical/logical.pas",
#     "tests/ifelse/ifelse.pas",
#     "tests/cycles/cycles.pas",
#     "tests/array/array.pas",
#     "tests/function/function.pas",
#     "tests/structure/structure.pas",
#     # "tests/programs/LinePlaneIntersection.pas",
#     "tests/programs/AABBCollision.pas",
#     "tests/examples/fact_recursive.pas",
#     "tests/examples/fact_cycle.pas",
#     "tests/examples/list.pas",
# ]

# for test in allTests:
#     exec(test)

