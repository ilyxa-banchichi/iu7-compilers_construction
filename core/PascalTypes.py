import llvmlite.ir as ir

class PascalTypes(object):
    int = ir.IntType(16)
    longint = ir.IntType(32)
    byte = ir.IntType(8)
    boolean = ir.IntType(1)
    char = ir.IntType(8)
    real = ir.FloatType()
    double = ir.DoubleType()

    strToType = {
        "integer": int,
        "longint": longint,
        "byte": byte,
        "boolean": boolean,
        "char": char,
        "real": real,
        "double": double,
    }