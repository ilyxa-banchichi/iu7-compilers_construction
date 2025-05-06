from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitIfStatement(self, ctx:PascalParser.IfStatementContext):
    thenBlock = self.symbolTable[self.currentFunction][0].append_basic_block(name="then")
    elseBlock = self.symbolTable[self.currentFunction][0].append_basic_block(name="else")
    endBlock = self.symbolTable[self.currentFunction][0].append_basic_block(name="end")
    expression, semantic = self.visit(ctx.expression())

    if semantic != PascalTypes.boolSemanticLabel:
        raise TypeError(f"Cannot use {expression} {semantic} as conditional")

    self.getBuilder().cbranch(expression, thenBlock, elseBlock)

    self.getBuilder().position_at_start(thenBlock)
    self.visit(ctx.statement(0))
    self.getBuilder().branch(endBlock)

    self.getBuilder().position_at_start(elseBlock)
    if ctx.statement(1):
        self.visit(ctx.statement(1))
    self.getBuilder().branch(endBlock)

    self.getBuilder().position_at_start(endBlock)