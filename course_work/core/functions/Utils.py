from llvmlite import ir

def get_or_create_global_string(module, builder, string_val, name="str"):
    if name in module.globals:
        global_str = module.get_global(name)
    else:
        str_bytes = bytearray(string_val.encode("utf8")) + b"\00"
        str_type = ir.ArrayType(ir.IntType(8), len(str_bytes))
        global_str = ir.GlobalVariable(module, str_type, name=name)
        global_str.linkage = 'internal'
        global_str.global_constant = True
        global_str.initializer = ir.Constant(str_type, list(map(ir.IntType(8), str_bytes)))
    zero = ir.Constant(ir.IntType(32), 0)
    return builder.gep(global_str, [zero, zero], inbounds=True, name=f"{name}_ptr")