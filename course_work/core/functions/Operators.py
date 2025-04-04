from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.SymbolTable import *
from core.BuiltinSymbols import *

def visitAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
    return ctx

def visitMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
    return ctx

def visitShiftOperator(self, ctx:PascalParser.ShiftOperatorContext):
    return ctx

def visitRelationaloperator(self, ctx:PascalParser.RelationaloperatorContext):
    if ctx.EQUAL():
        return '=='
    elif ctx.NOT_EQUAL():
        return '!='
    elif ctx.LT():
        return '<'
    elif ctx.LE():
        return '<='
    elif ctx.GE():
        return '>='
    elif ctx.GT():
        return '>'
    elif ctx.IN():
        raise TypeError("In operator not support")