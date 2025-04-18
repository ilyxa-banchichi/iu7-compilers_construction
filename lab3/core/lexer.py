import re

from core.token import TokenType
from core.token import Token

class Lexer:
    TOKEN_SPECIFICATION = [
        (TokenType.WHITESPACE,  r'[ \t\n]+'),
        (TokenType.PLUS,        r'\+'),
        (TokenType.MINUS,       r'-'),
        (TokenType.STAR,        r'\*'),
        (TokenType.SLASH,       r'/'),
        (TokenType.EQUAL,       r'=='),
        (TokenType.NOT_EQUAL,   r'<>'),
        (TokenType.LE,          r'<='),
        (TokenType.GE,          r'>='),
        (TokenType.LT,          r'<'),
        (TokenType.GT,          r'>'),
        (TokenType.ASSIGN,      r'='),
        (TokenType.SEMI,        r';'),
        (TokenType.LPAREN,      r'\('),
        (TokenType.RPAREN,      r'\)'),
        (TokenType.CONSTANT,    r'\d+'),
        (TokenType.IDENTIFIER,  r'[A-Za-z][A-Za-z0-9_]*'),
        (TokenType.LCURLY,      r'\{'),
        (TokenType.RCURLY,      r'\}'),
    ]

    def __init__(self, code):
        self.code = code
        self.regex = re.compile('|'.join(f'(?P<{name}>{pattern})' for name, pattern in self.TOKEN_SPECIFICATION))
        self.pos = 0
        self.tokens = self._tokenize()

    def _tokenize(self):
        tokens = []
        for match in self.regex.finditer(self.code):
            kind = match.lastgroup
            value = match.group()
            if kind == TokenType.WHITESPACE:
                continue
            tokens.append(Token(kind, value))
        return tokens

    def get_next_token(self):
        if self.pos < len(self.tokens):
            token = self.tokens[self.pos]
            self.pos += 1
            return token
        return Token(TokenType.EOF, '')