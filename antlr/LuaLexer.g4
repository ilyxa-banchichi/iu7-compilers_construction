lexer grammar LuaLexer;
channels {
	COMMENTS
}

SEMICOLON: ';';
BREAK: 'break';
GOTO: 'goto';

DO: 'do';

WHILE: 'while';

END: 'end';

REPEAT: 'repeat';

UNTIL: 'until';

FOR: 'for';

FUNCTION: 'function';

LOCAL: 'local';

IF: 'if';
THEN: 'then';
ELSEIF: 'elseif';

ELSE: 'else';
RETURN: 'return';

COLON: ':';

DCOLON: '::';

DOT: '.';

COMMA: ',';
IN: 'in';

LPAREN: '(';
RPAREN: ')';

LBRACK: '[';

RBRACK: ']';

LBRACE: '{';

RBRACE: '}';

OR: 'or';

AND: 'and';

LT: '<';
GT: '>';

LTE: '<=';
GTE: '>=';
NEQ: '~=';
EQ: '==';

EQUALS: '=';

STRCAT: '..';
PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
MOD: '%';

DIVFLOOR: '//';

BITAND: '&';

BITOR: '|';

BITNOT: '~';
BITSHL: '<<';
BITSHR: '>>';

NOT: 'not';

LEN: '#';

POWER: '^';

NIL: 'nil';

FALSE: 'false';

TRUE: 'true';

DOTS: '...';

NAME: [a-zA-Z_][a-zA-Z_0-9]*;

NORMALSTRING: '"' ( EscapeSequence | ~('\\' | '"'))* '"';

CHARSTRING: '\'' ( EscapeSequence | ~('\'' | '\\'))* '\'';

LONGSTRING: '[' NESTED_STR ']';

fragment NESTED_STR: '=' NESTED_STR '=' | '[' .*? ']';

INT: Digit+;

HEX: '0' [xX] HexDigit+;

FLOAT:
	Digit+ '.' Digit* ExponentPart?
	| '.' Digit+ ExponentPart?
	| Digit+ ExponentPart;

HEX_FLOAT:
	'0' [xX] HexDigit+ '.' HexDigit* HexExponentPart?
	| '0' [xX] '.' HexDigit+ HexExponentPart?
	| '0' [xX] HexDigit+ HexExponentPart;

fragment ExponentPart: [eE] [+-]? Digit+;

fragment HexExponentPart: [pP] [+-]? Digit+;

fragment EscapeSequence:
	'\\' [abfnrtvz"'\\]
	| '\\' '\r'? '\n'
	| DecimalEscape
	| HexEscape
	| UtfEscape;

fragment DecimalEscape:
	'\\' Digit
	| '\\' Digit Digit
	| '\\' [0-2] Digit Digit;

fragment HexEscape: '\\' 'x' HexDigit HexDigit;

fragment UtfEscape: '\\' 'u{' HexDigit+ '}';

fragment Digit: [0-9];

fragment HexDigit: [0-9a-fA-F];

COMMENT: '--[' NESTED_STR ']' -> channel(COMMENTS);

LINE_COMMENT:
	'--' (
		// --
		| '[' '='* // --[==
		| '[' '='* ~('=' | '[' | '\r' | '\n') ~('\r' | '\n')* // --[==AA
		| ~('[' | '\r' | '\n') ~('\r' | '\n')* // --AAA
	) ('\r\n' | '\r' | '\n' | EOF) -> channel(COMMENTS);

WS: [ \t\u000C\r\n]+ -> channel(HIDDEN);

SHEBANG: '#' '!' ~('\n' | '\r')* -> channel(HIDDEN);