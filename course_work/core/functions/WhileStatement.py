from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitWhileStatement(self, ctx:PascalParser.WhileStatementContext):
    self.tree_down("\<\<cycle while\>\>")
    condBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("while_cond")
    bodyBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("while_body")
    exitBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("while_exit")

    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(condBlock)
    self.tree_down("\<\<expression\>\>")
    expression, semantic = self.visit(ctx.expression())
    self.tree_up()
    if semantic != PascalTypes.boolSemanticLabel:
        self.add_error(ctx, "While condition must have boolean type")

    self.getBuilder().cbranch(expression, bodyBlock, exitBlock)

    self.getBuilder().position_at_start(bodyBlock)
    self.tree_down("\<\<body\>\>")
    self.visit(ctx.statement())
    self.tree_up()
    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(exitBlock)
    self.tree_up()