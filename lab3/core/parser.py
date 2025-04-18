from core.lexer import Lexer
from core.token import Token
from core.token import TokenType

class Parser:
    def __init__(self, lexer: Lexer):
        self.lexer = lexer
        self.current_token = self.lexer.get_next_token()
        self.tree = []

    def error(self, msg=""):
        raise Exception(f"Syntax error: {msg}")

    def match_current_token(self, token_type):
        return self.current_token.type == token_type

    def match_list_current_token(self, token_types: list):
        for token_type in token_types:
            if self.match_current_token(token_type):
                return True
        return False

    def eat(self, token_type) -> Token:
        if self.current_token.type == token_type:
            if self.current_token.type != TokenType.LPAREN and self.current_token.type != TokenType.RPAREN:
                self.tree.append(f"{self.current_token.value} ")
            self.current_token = self.lexer.get_next_token()
        else:
            self.error(f"Expected {token_type}, got {self.current_token}")

    def program(self):
        self.tree.append('(program ')
        self.block()
        self.tree.append(')')

    def block(self):
        print(self.current_token)
        self.tree.append('(block ')
        if self.match_current_token(TokenType.LCURLY):
            self.eat(TokenType.LCURLY)
            self.operator_list()
            self.eat(TokenType.RCURLY)
        else:
            self.error("Unexpected block")
        self.tree.append(')')

    def operator_list(self):
        self.tree.append('(operator_list ')
        self.operator()
        self.operator_list_tail()
        self.tree.append(')')

    def operator_list_tail(self):
        self.tree.append('(operator_list_tail ')
        if self.match_current_token(TokenType.SEMI):
            self.eat(TokenType.SEMI)
            self.operator()
            self.operator_list_tail()
        self.tree.append(')')

    def operator(self):
        self.tree.append('(operator ')
        if self.match_current_token(TokenType.IDENTIFIER):
            self.eat(TokenType.IDENTIFIER)
            self.eat(TokenType.ASSIGN)
            self.expression()
        else:
            self.block()
        self.tree.append(')')

    def expression(self):
        self.tree.append('(expression ')
        self.arithmetic_expression()
        self.expression_tail()
        self.tree.append(')')

    def expression_tail(self):
        self.tree.append('(expression_tail ')
        if self.match_list_current_token([TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE]):
            self.relation_operator()
            self.arithmetic_expression()
        self.tree.append(')')

    def arithmetic_expression(self):
        self.tree.append('(arithmetic_expression ')
        self.term()
        self.arithmetic_expression_tail()
        self.tree.append(')')

    def arithmetic_expression_tail(self):
        self.tree.append('(arithmetic_expression_tail ')
        if self.match_list_current_token([TokenType.PLUS, TokenType.MINUS]):
            self.additive_operator()
            self.term()
            self.arithmetic_expression_tail()

        self.tree.append(')')

    def term(self):
        self.tree.append('(term ')
        self.factor()
        self.term_tail()
        self.tree.append(')')

    def term_tail(self):
        self.tree.append('(term_tail ')
        if self.match_list_current_token([TokenType.STAR, TokenType.SLASH]):
            self.multiplicative_operator()
            self.factor()
            self.term_tail()
        self.tree.append(')')

    def factor(self):
        self.tree.append('(factor ')
        if self.match_current_token(TokenType.IDENTIFIER):
            self.eat(TokenType.IDENTIFIER)
        elif self.match_current_token(TokenType.CONSTANT):
            self.eat(TokenType.CONSTANT)
        elif self.match_current_token(TokenType.LPAREN):
            self.eat(TokenType.LPAREN)
            self.arithmetic_expression()
            self.eat(TokenType.RPAREN)
        else:
            self.error("Unexpected factor")
        self.tree.append(')')

    def relation_operator(self):
        self.tree.append('(relation_operator ')
        if self.match_current_token(TokenType.LT):
            self.eat(TokenType.LT)
        elif self.match_current_token(TokenType.LE):
            self.eat(TokenType.LE)
        elif self.match_current_token(TokenType.EQUAL):
            self.eat(TokenType.EQUAL)
        elif self.match_current_token(TokenType.NOT_EQUAL):
            self.eat(TokenType.NOT_EQUAL)
        elif self.match_current_token(TokenType.GT):
            self.eat(TokenType.GT)
        elif self.match_current_token(TokenType.GE):
            self.eat(TokenType.GE)
        else:
            self.error("Unexpected relation operator")
        self.tree.append(')')

    def multiplicative_operator(self):
        self.tree.append('(multiplicative_operator ')
        if self.match_current_token(TokenType.STAR):
            self.eat(TokenType.STAR)
        elif self.match_current_token(TokenType.SLASH):
            self.eat(TokenType.SLASH)
        else:
            self.error("Unexpected multiplicative operator")
        self.tree.append(')')

    def additive_operator(self):
        self.tree.append('(additive_operator ')
        if self.match_current_token(TokenType.PLUS):
            self.eat(TokenType.PLUS)
        elif self.match_current_token(TokenType.MINUS):
            self.eat(TokenType.MINUS)
        else:
            self.error("Unexpected additive operator")
        self.tree.append(')')

