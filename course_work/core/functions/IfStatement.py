from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitIfStatement(self, ctx:PascalParser.IfStatementContext):
    thenBlock = self.symbolTable[self.currentFunction].append_basic_block(name="then")
    elseBlock = self.symbolTable[self.currentFunction].append_basic_block(name="else")
    endBlock = self.symbolTable[self.currentFunction].append_basic_block(name="end")
    expression, semantic = self.visit(ctx.expression())

    if semantic != PascalTypes.boolSemanticLabel:
        raise TypeError(f"Cannot use {expression} {semantic} as conditional")

    self.builder.cbranch(expression, thenBlock, elseBlock)

    self.builder.position_at_start(thenBlock)
    self.visit(ctx.statement(0))
    self.builder.branch(endBlock)

    self.builder.position_at_start(elseBlock)
    if ctx.statement(1):
        self.visit(ctx.statement(1))
    self.builder.branch(endBlock)

    self.builder.position_at_start(endBlock)