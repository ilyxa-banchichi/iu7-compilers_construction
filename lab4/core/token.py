from collections import namedtuple


class Token:
    def __init__(self, type, value, line=0, column=0):
        self.type = type
        self.value = value
        self.line = line
        self.column = column

class TokenType:
    WHITESPACE  = 'WHITESPACE'
    PLUS        = 'PLUS'
    MINUS       = 'MINUS'
    STAR        = 'STAR'
    SLASH       = 'SLASH'
    EQUAL       = 'EQUAL'
    NOT_EQUAL   = 'NOT_EQUAL'
    LE          = 'LE'
    GE          = 'GE'
    LT          = 'LT'
    GT          = 'GT'
    ASSIGN      = 'ASSIGN'
    SEMI        = 'SEMI'
    LPAREN      = 'LPAREN'
    RPAREN      = 'RPAREN'
    CONSTANT    = 'CONSTANT'
    IDENTIFIER  = 'IDENTIFIER'
    EOF         = 'EOF'
    LCURLY      = 'LCURLY'
    RCURLY      = 'RCURLY'