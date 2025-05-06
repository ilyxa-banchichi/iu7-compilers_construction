from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def callFunction(identifier, self, ctx:PascalParser.FunctionDesignatorContext):
    function, resultSemantic, semantics = self.symbolTable[identifier]
    params_count = len(function.args)
    print(function.name)

    args = []
    i = 0
    for param in ctx.parameterList().actualParameter():
        if i >= params_count:
            raise TypeError(f"Ожидалось {params_count} параметров, обнаружен параметр N {i + 1}")

        self.leftPartDefinition.Enter(PascalTypes.defaultString, PascalTypes.charSemanticLabel)
        value, valSemantic = self.visit(param)
        print(value)
        self.leftPartDefinition.Exit()

        arg_type = function.args[i].type
        is_pointer = False
        if self.is_pointer(function.args[i]):
            arg_type = arg_type.pointee
            is_pointer = True

        if semantics[i] != valSemantic:
            raise TypeError(f"Неверный тип параметра {value.type} ({valSemantic}). Ожидалось {arg_type}, ({semantics[i]})")

        if valSemantic == PascalTypes.numericSemanticLabel:
            value = castValue(self.getBuilder(), value, arg_type)

        if arg_type != value.type:
            raise TypeError(f"Неверный тип параметра {value.type} ({valSemantic}). Ожидалось {arg_type}, ({semantics[i]})")

        # if is_pointer:

        args.append(value)

        i += 1

    if len(args) != params_count:
        raise TypeError(f"Ожидалось {params_count} параметров, обнаружено {len(args)}")

    call = self.getBuilder().call(function, args)
    return call, resultSemantic