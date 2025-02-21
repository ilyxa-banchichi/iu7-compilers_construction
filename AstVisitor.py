from antlr4 import *
from antlr.LuaLexer import LuaLexer
from antlr.LuaParser import LuaParser
from antlr.LuaParserVisitor import LuaParserVisitor

class ExprVisitor(LuaParserVisitor):
    def visitExp(self, ctx: LuaParser.ExpContext):
        # Числа (целые и дробные)
        if ctx.getChildCount() == 1:
            text = ctx.getChild(0).getText()
            if text.isdigit():  # INT
                return int(text)
            try:
                return float(text)  # FLOAT
            except ValueError:
                pass

        # Операции: сложение, вычитание
        if ctx.operatorAddSub():
            left = self.visit(ctx.exp(0))
            right = self.visit(ctx.exp(1))
            op = ctx.operatorAddSub().getText()
            return left + right if op == "+" else left - right

        # Операции: умножение, деление
        if ctx.operatorMulDivMod():
            left = self.visit(ctx.exp(0))
            right = self.visit(ctx.exp(1))
            op = ctx.operatorMulDivMod().getText()
            if op == "*":
                return left * right
            elif op == "/":
                return left / right
            elif op == "%":
                return left % right

        return self.visitChildren(ctx)

def parse_expression(input_text):
    lexer = LuaLexer(input_text)
    stream = CommonTokenStream(lexer)
    parser = LuaParser(stream)
    tree = parser.exp()
    visitor = ExprVisitor()
    return visitor.visit(tree)