from core.lexer import Lexer
from core.token import Token
from core.token import TokenType

class Parser:
    def __init__(self, lexer: Lexer):
        self.lexer = lexer
        self.current_token = self.lexer.get_next_token()
        self.errors = []

    def error(self, msg: str):
        token = self.current_token
        self.errors.append(Exception(f"Syntax error: {msg}. Line {token.line} column {token.column}"))

    def match_current_token(self, token_type):
        return self.current_token.type == token_type

    def match_list_current_token(self, token_types: list):
        for token_type in token_types:
            if self.match_current_token(token_type):
                return True
        return False

    def eat(self, token_type) -> Token:
        if self.current_token.type == token_type:
            self.current_token = self.lexer.get_next_token()
        else:
            self.error(f"Expected {self.lexer.TOKEN_SPECIFICATION[token_type]}, got {self.current_token.value}")

    def program(self):
        if self.match_current_token(TokenType.LCURLY):
            self.block()
        else:
            self.error(f"Expected '{{' to start a program, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def block(self):
        if self.match_current_token(TokenType.LCURLY):
            self.eat(TokenType.LCURLY)
            self.operator_list()
            self.eat(TokenType.RCURLY)
        else:
            self.error(f"Expected '{{' to start a block, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.LCURLY, TokenType.SEMI, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def operator_list(self):
        if self.match_list_current_token([TokenType.IDENTIFIER, TokenType.LCURLY]):
            self.operator()
            self.operator_list_tail()
        else:
            self.error(f"Expected '{{' or identifier to start a operator list, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.RCURLY, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def operator_list_tail(self):
        if self.match_list_current_token([TokenType.IDENTIFIER, TokenType.LCURLY]):
            self.operator()
            self.operator_list_tail()
        # else:
        #     self.error(f"Expected ';' to end a operator list, got '{self.current_token.value}'")
        #     while self.current_token.type not in {TokenType.RCURLY, TokenType.EOF}:
        #         self.current_token = self.lexer.get_next_token()


    def operator(self):
        if self.match_current_token(TokenType.IDENTIFIER):
            self.eat(TokenType.IDENTIFIER)
            self.eat(TokenType.ASSIGN)
            self.expression()
            self.eat(TokenType.SEMI)
        elif self.match_current_token(TokenType.LCURLY):
            self.block()
        else:
            self.error(f"Expected '{{' or identifier to start a operator, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.SEMI, TokenType.RCURLY, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def expression(self):
        if self.match_list_current_token([TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT]):
            self.arithmetic_expression()
            self.expression_tail()
        else:
            self.error(f"Expected constant, identifier or ( to start a expression, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.SEMI, TokenType.RCURLY, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def expression_tail(self):
        if self.match_list_current_token([TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE]):
            self.relation_operator()
            self.arithmetic_expression()
        # else:
        #     self.error(f"Expected relation operator to end a expression, got '{self.current_token.value}'")
        #     while self.current_token.type not in {TokenType.SEMI, TokenType.RCURLY, TokenType.EOF}:
        #         self.current_token = self.lexer.get_next_token()

    def arithmetic_expression(self):
        if self.match_list_current_token([TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT]):
            self.term()
            self.arithmetic_expression_tail()
        else:
            self.error(f"Expected constant, identifier or ( to start a arithmetic expression, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.RPAREN, TokenType.RCURLY, TokenType.SEMI, TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def arithmetic_expression_tail(self):
        if self.match_list_current_token([TokenType.PLUS, TokenType.MINUS]):
            self.additive_operator()
            self.term()
            self.arithmetic_expression_tail()
        # else:
        #     self.error(f"Expected constant, identifier or ( to end a arithmetic expression, got '{self.current_token.value}'")
        #     while self.current_token.type not in {TokenType.RPAREN, TokenType.RCURLY, TokenType.SEMI, TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE, TokenType.EOF}:
        #         self.current_token = self.lexer.get_next_token()

    def term(self):
        if self.match_list_current_token([TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT]):
            self.factor()
            self.term_tail()
        else:
            self.error(f"Expected constant, identifier or ( to start a term, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.PLUS, TokenType.MINUS, TokenType.RPAREN, TokenType.RCURLY, TokenType.SEMI, TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def term_tail(self):
        if self.match_list_current_token([TokenType.STAR, TokenType.SLASH]):
            self.multiplicative_operator()
            self.factor()
            self.term_tail()
        # else:
        #     self.error(f"Expected constant, identifier or ( to end a term, got '{self.current_token.value}'")
        #     while self.current_token.type not in {TokenType.PLUS, TokenType.MINUS, TokenType.RPAREN, TokenType.RCURLY, TokenType.SEMI, TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE, TokenType.EOF}:
        #         self.current_token = self.lexer.get_next_token()

    def factor(self):
        if self.match_current_token(TokenType.IDENTIFIER):
            self.eat(TokenType.IDENTIFIER)
        elif self.match_current_token(TokenType.CONSTANT):
            self.eat(TokenType.CONSTANT)
        elif self.match_current_token(TokenType.LPAREN):
            self.eat(TokenType.LPAREN)
            self.arithmetic_expression()
            self.eat(TokenType.RPAREN)
        else:
            self.error(f"Expected constant, identifier or ( to start a factor, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.STAR, TokenType.SLASH, TokenType.PLUS, TokenType.MINUS, TokenType.RPAREN, TokenType.RCURLY, TokenType.SEMI, TokenType.LT, TokenType.LE, TokenType.EQUAL, TokenType.NOT_EQUAL, TokenType.GT, TokenType.GE, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def relation_operator(self):
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
            self.error(f"Expected relation operator, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def multiplicative_operator(self):
        if self.match_current_token(TokenType.STAR):
            self.eat(TokenType.STAR)
        elif self.match_current_token(TokenType.SLASH):
            self.eat(TokenType.SLASH)
        else:
            self.error(f"Expected multiplicative operator, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()

    def additive_operator(self):
        if self.match_current_token(TokenType.PLUS):
            self.eat(TokenType.PLUS)
        elif self.match_current_token(TokenType.MINUS):
            self.eat(TokenType.MINUS)
        else:
            self.error(f"Expected additive operator, got '{self.current_token.value}'")
            while self.current_token.type not in {TokenType.LPAREN, TokenType.IDENTIFIER, TokenType.CONSTANT, TokenType.EOF}:
                self.current_token = self.lexer.get_next_token()
