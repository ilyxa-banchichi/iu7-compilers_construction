from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitWhileStatement(self, ctx:PascalParser.WhileStatementContext):
    condBlock = self.symbolTable[self.currentFunction].append_basic_block("while_cond")
    bodyBlock = self.symbolTable[self.currentFunction].append_basic_block("while_body")
    exitBlock = self.symbolTable[self.currentFunction].append_basic_block("while_exit")

    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(condBlock)
    expression, semantic = self.visit(ctx.expression())
    if semantic != PascalTypes.boolSemanticLabel:
        raise TypeError("While condition must have boolean type")

    self.getBuilder().cbranch(expression, bodyBlock, exitBlock)

    self.getBuilder().position_at_start(bodyBlock)
    self.visit(ctx.statement())
    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(exitBlock)