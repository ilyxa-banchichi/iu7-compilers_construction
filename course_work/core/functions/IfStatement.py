from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitIfStatement(self, ctx:PascalParser.IfStatementContext):
    self.tree_down("\<\<if statement\>\>")
    thenBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block(name="then")
    elseBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block(name="else")
    endBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block(name="end")
    self.tree_down("\<\<expression\>\>")
    expression, semantic = self.visit(ctx.expression())
    self.tree_up()

    if semantic != PascalTypes.boolSemanticLabel:
        self.add_error(ctx, f"Cannot use {expression} {semantic} as conditional")

    expression = self.load_if_pointer(expression)

    self.getBuilder().cbranch(expression, thenBlock, elseBlock)

    self.getBuilder().position_at_start(thenBlock)
    self.tree_down("\<\<then\>\>")
    self.visit(ctx.statement(0))
    self.tree_up()
    self.getBuilder().branch(endBlock)

    self.getBuilder().position_at_start(elseBlock)
    if ctx.statement(1):
        self.tree_down("\<\<else\>\>")
        self.visit(ctx.statement(1))
        self.tree_up()
    self.getBuilder().branch(endBlock)

    self.getBuilder().position_at_start(endBlock)
    self.tree_up()