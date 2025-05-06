from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def callFunction(identifier, self, ctx:PascalParser.ProcedureStatementContext):
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
        self.leftPartDefinition.Exit()

        if semantics[i] != valSemantic:
            raise TypeError(f"Неверный тип параметра {value.type} ({valSemantic}). Ожидалось {function.args[i].type}, ({semantics[i]})")

        if valSemantic == PascalTypes.numericSemanticLabel:
            value = castValue(self.getBuilder(), value, function.args[i].type)

        if function.args[i].type != value.type:
            raise TypeError(f"Неверный тип параметра {value.type} ({valSemantic}). Ожидалось {function.args[i].type}, ({semantics[i]})")

        args.append(value)

        i += 1

    if len(args) != params_count:
        raise TypeError(f"Ожидалось {params_count} параметров, обнаружено {len(args)}")

    call = self.getBuilder().call(function, args)
    return call, resultSemantic