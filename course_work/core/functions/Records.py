from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def recordFieldAccess(builder, records, variable, field):
    if isinstance(variable.type, ir.PointerType):
        names, semantics, array_descriptions = records[variable.type.pointee]
    else:
        names, semantics, array_descriptions = records[variable.type]

    idx = names.index(field)
    if isinstance(variable.type, ir.PointerType):
        ptr = builder.gep(variable, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), idx)])
    else:
        ptr = builder.extract_value(variable, idx)
    return ptr, semantics[idx], array_descriptions[idx] if 0 <= idx < len(array_descriptions) else None

def visitRecordType(self, ctx:PascalParser.RecordTypeContext):
    names, types, semantics, array_descriptions = self.visit(ctx.fieldList())
    return names, types, semantics, array_descriptions

def visitFixedPart(self, ctx:PascalParser.FixedPartContext):
    names = []
    types = []
    semantics = []
    array_descriptions = []
    for s in ctx.recordSection():
        n, t, s, array_description = self.visit(s)
        names.extend(n)
        types.extend(t)
        semantics.extend(s)
        array_descriptions.extend(array_description)

    return names, types, semantics, array_descriptions

def visitRecordSection(self, ctx:PascalParser.RecordSectionContext):
    names = self.visit(ctx.identifierList())
    t = self.visit(ctx.type_())
    var_type, sem, array_description = t[0], t[1], None
    if isinstance(var_type, ir.ArrayType):
        array_description = t[2]

    types = [var_type for n in names]
    semantics = [sem for n in names]
    array_descriptions = [array_description for n in names]
    return names, types, semantics, array_descriptions