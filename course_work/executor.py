import sys
import llvmlite.binding as llvm
from llvmlite import ir
import ctypes
from code_generator import generateIR

def exec(filename, output_dir):
    output_name = generateIR(filename, output_dir)
    if not output_name:
        return None

    with open(output_name, "r") as f:
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

if __name__ == "__main__":
    if len(sys.argv) > 2:
        filename = sys.argv[1]
        output_dir = sys.argv[2]
    else:
        print("Неверное количество аргументов")

    exec(filename, output_dir)

