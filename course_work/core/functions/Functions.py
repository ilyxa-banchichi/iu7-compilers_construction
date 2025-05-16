from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def callFunction(identifier, self, ctx:PascalParser.FunctionDesignatorContext):
    try:
        function, resultSemantic, semantics, arr_descs = self.symbolTable[identifier]
    except Exception as e:
        self.add_error(ctx, str(e))

    params_count = len(function.args)

    args = []
    i = 0
    for param in ctx.parameterList().actualParameter():
        if i >= params_count:
            self.add_error(ctx, f"Ожидаемое количество параметров - {params_count}, обнаружено - {i + 1}")

        arg_type = function.args[i].type
        is_pointer = False
        if self.is_pointer(function.args[i]):
            arg_type = arg_type.pointee
            is_pointer = True

        value, valSemantic = self.visit(param)

        if not is_pointer:
            value = self.load_if_pointer(value)

        value_type = value.type
        if self.is_pointer(value):
            value_type = value_type.pointee

        if semantics[i] != valSemantic:
            self.add_error(ctx, f"Неверный тип параметра {value_type} ({valSemantic}). Ожидалось {arg_type}, ({semantics[i]})")

        if not is_pointer and not isinstance(value.type, ir.ArrayType) and valSemantic == PascalTypes.numericSemanticLabel:
            value = castValue(ctx, self, value, arg_type)
            value_type = value.type

        if arg_type != value_type:
            self.add_error(ctx, f"Неверный тип параметра {value_type} ({valSemantic}). Ожидалось {arg_type}, ({semantics[i]})")

        args.append(value)

        i += 1

    if len(args) != params_count:
        self.add_error(ctx, f"Ожидаемое количество параметров - {params_count}, обнаружено - {len(args)}")

    call = self.getBuilder().call(function, args)
    return call, resultSemantic