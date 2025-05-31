from antlr.PascalParser import PascalParser
from llvmlite import ir
from core.PascalTypes import *
from core.TypeCast import *

def visitForStatement(self, ctx:PascalParser.ForStatementContext):
    self.tree_down("\<\<cycle for\>\>")
    condBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("for_cond")
    bodyBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("for_body")
    exitBlock = self.symbolTable[self.getCurrentFunction()][0].append_basic_block("for_exit")

    iterPrt, varSemantic = self.symbolTable[self.visit(ctx.identifier())]
    if varSemantic != PascalTypes.numericSemanticLabel or not isinstance(iterPrt.type.pointee, ir.IntType):
        self.add_error(ctx, 'Cannot use not integer variable as iterator')

    self.tree_down("\<\<from to\>\>")
    initialValue, finalValue, direction = self.visit(ctx.forList())
    self.tree_up()
    initialValue = castStoredValue(ctx, self, iterPrt, initialValue)
    self.getBuilder().store(initialValue, iterPrt)

    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(condBlock)
    currentVal = self.getBuilder().load(iterPrt)
    if direction > 0:
        cond = self.getBuilder().icmp_signed("<=", currentVal, self.load_if_pointer(finalValue))
    else:
        cond = self.getBuilder().icmp_signed(">=", currentVal, self.load_if_pointer(finalValue))
    self.getBuilder().cbranch(cond, bodyBlock, exitBlock)

    self.getBuilder().position_at_start(bodyBlock)
    self.tree_down("\<\<body\>\>")
    self.visit(ctx.statement())
    self.tree_up()

    step = ir.Constant(currentVal.type, 1)
    if direction > 0:
        newVal = self.getBuilder().add(currentVal, step)
    else:
        newVal = self.getBuilder().sub(currentVal, step)
    self.getBuilder().store(newVal, iterPrt)
    self.getBuilder().branch(condBlock)

    self.getBuilder().position_at_start(exitBlock)

def visitForList(self, ctx:PascalParser.ForListContext):
    initialValue, _ = self.visit(ctx.initialValue())
    finalValue, _ = self.visit(ctx.finalValue())
    direction = 0
    if ctx.TO():
        direction = 1
    elif ctx.DOWNTO():
        direction = -1
    else:
        self.add_error(ctx, "Incorrect for statement.")

    self.tree_up()
    return initialValue, finalValue, direction