from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *

def visitForStatement(self, ctx:PascalParser.ForStatementContext):
    condBlock = self.symbolTable[self.currentFunction].append_basic_block("for_cond")
    bodyBlock = self.symbolTable[self.currentFunction].append_basic_block("for_body")
    exitBlock = self.symbolTable[self.currentFunction].append_basic_block("for_exit")

    iterPrt, varSemantic = self.symbolTable[self.visit(ctx.identifier())]
    if varSemantic != PascalTypes.numericSemanticLabel or not isinstance(iterPrt.type.pointee, ir.IntType):
        raise TypeError('Cannot use not integer variable as iterator')

    self.leftPartDefinition.Enter(iterPrt.type.pointee, varSemantic)
    initialValue, finalValue, direction = self.visit(ctx.forList())
    self.leftPartDefinition.Exit()
    self.builder.store(initialValue, iterPrt)

    self.builder.branch(condBlock)

    self.builder.position_at_start(condBlock)
    currentVal = self.builder.load(iterPrt)
    if direction > 0:
        cond = self.builder.icmp_signed("<=", currentVal, finalValue)
    else:
        cond = self.builder.icmp_signed(">=", currentVal, finalValue)
    self.builder.cbranch(cond, bodyBlock, exitBlock)

    self.builder.position_at_start(bodyBlock)
    self.visit(ctx.statement())

    step = ir.Constant(currentVal.type, 1)
    if direction > 0:
        newVal = self.builder.add(currentVal, step)
    else:
        newVal = self.builder.sub(currentVal, step)
    self.builder.store(newVal, iterPrt)
    self.builder.branch(condBlock)

    self.builder.position_at_start(exitBlock)

def visitForList(self, ctx:PascalParser.ForListContext):
    initialValue, _ = self.visit(ctx.initialValue())
    finalValue, _ = self.visit(ctx.finalValue())
    direction = 0
    if ctx.TO():
        direction = 1
    elif ctx.DOWNTO():
        direction = -1
    else:
        raise Exception("Incorrect for statement.")

    return initialValue, finalValue, direction