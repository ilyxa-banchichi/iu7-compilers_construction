from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def recordFieldAccess(builder, records, variable, field):
    names, semantics = records[variable.type.pointee]
    idx = names.index(field)
    ptr = builder.gep(variable, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), idx)])
    return ptr, semantics[idx]

def visitRecordType(self, ctx:PascalParser.RecordTypeContext):
    names, types, semantics = self.visit(ctx.fieldList())
    return names, types, semantics

def visitFixedPart(self, ctx:PascalParser.FixedPartContext):
    names = []
    types = []
    semantics = []
    for s in ctx.recordSection():
        n, t, s = self.visit(s)
        names.extend(n)
        types.extend(t)
        semantics.extend(s)

    return names, types, semantics

def visitRecordSection(self, ctx:PascalParser.RecordSectionContext):
    names = self.visit(ctx.identifierList())
    t, s = self.visit(ctx.type_())
    types = [t for n in names]
    semantics = [s for n in names]
    return names, types, semantics