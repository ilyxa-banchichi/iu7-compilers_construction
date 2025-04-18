from collections import namedtuple


Token = namedtuple('Token', ['type', 'value'])

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