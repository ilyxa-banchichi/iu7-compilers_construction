from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *
from core.functions.Utils import *

def write_value(self, value, valSemantic):
    procedure = self.symbolTable["printf"][0]
    value = self.load_if_pointer(value)
    if isinstance(value.type, ir.ArrayType):
        if value.type.element == ir.IntType(8) and valSemantic == PascalTypes.charSemanticLabel:
            strVar = self.getBuilder().alloca(value.type)
            self.getBuilder().store(value, strVar)
            strVarPtr = self.getBuilder().gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])
            self.getBuilder().call(procedure, [strVarPtr])
    elif isinstance(value.type, ir.IntType) and value.type.width == 1 and valSemantic == PascalTypes.boolSemanticLabel:
        true_str = get_or_create_global_string(self.module, self.getBuilder(), "true", "true_value_str")
        false_str = get_or_create_global_string(self.module, self.getBuilder(), "false", "false_value_str")
        str_ptr = self.getBuilder().select(value, true_str, false_str)
        self.getBuilder().call(procedure, [str_ptr])
    else:
        formatStr = ""
        if isinstance(value.type, ir.IntType):
            if value.type.width == 8:
                if valSemantic == PascalTypes.charSemanticLabel:
                    formatStr += "%c"
                else:
                    formatStr += "%hhu"
            elif value.type.width == 16:
                formatStr += "%hd"
            else:
                formatStr += "%d"
        elif isinstance(value.type, ir.FloatType):
            formatStr += "%f"
        elif isinstance(value.type, ir.DoubleType):
            formatStr += "%f"
        formatStr = formatStr.encode("utf8")
        formatStr += b"\0"

        strLen = len(formatStr)
        inputStr = ir.Constant(ir.ArrayType(ir.IntType(8), strLen), bytearray(formatStr))
        strVar = self.getBuilder().alloca(ir.ArrayType(ir.IntType(8), strLen))
        self.getBuilder().store(inputStr, strVar)
        strVarPtr = self.getBuilder().gep(strVar, [ir.Constant(ir.IntType(8), 0), ir.Constant(ir.IntType(8), 0)])

        self.getBuilder().call(procedure, [strVarPtr, value])

def write(self, ctx:PascalParser.FunctionDesignatorContext):
    for param in ctx.parameterList().actualParameter():
        value, valSemantic = self.visit(param)
        write_value(self, value, valSemantic)

def writeln(self, ctx:PascalParser.FunctionDesignatorContext):
    procedure = self.symbolTable["printf"][0]
    write(self, ctx)
    end_line_str_ptr = get_or_create_global_string(self.module, self.getBuilder(), "\n", "end_line_str")
    self.getBuilder().call(procedure, [end_line_str_ptr])

def read(self, ctx:PascalParser.FunctionDesignatorContext):
    procedure = self.symbolTable["scanf"][0]
    write(self, ctx)
    end_line_str_ptr = get_or_create_global_string(self.module, self.getBuilder(), "\n", "end_line_str")
    self.getBuilder().call(procedure, [end_line_str_ptr])

def new(self, ctx:PascalParser.FunctionDesignatorContext):
    malloc = self.symbolTable["malloc"][0]
    for param in ctx.parameterList().actualParameter():
        value, valSemantic = self.visit(param)
        if not self.is_pointer(value):
            self.add_error(ctx, "Аргумент New должен быть указателем")

        size = self.sizeof(value.type.pointee, self.getBuilder())
        malloc_ptr = self.getBuilder().call(malloc, [size])
        typed_ptr = self.getBuilder().bitcast(malloc_ptr, value.type.pointee)

        self.getBuilder().store(typed_ptr, value)

def dispose(self, ctx:PascalParser.FunctionDesignatorContext):
    free = self.symbolTable["free"][0]
    for param in ctx.parameterList().actualParameter():
        value, valSemantic = self.visit(param)
        allocated_ptr = self.getBuilder().load(value)
        raw_ptr = self.getBuilder().bitcast(allocated_ptr, ir.IntType(8).as_pointer())
        self.getBuilder().call(free, [raw_ptr])