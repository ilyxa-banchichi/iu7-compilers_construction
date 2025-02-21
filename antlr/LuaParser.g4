parser grammar LuaParser;
options {
	tokenVocab = LuaLexer;
}

chunk: block EOF;

block: stat* retstat?;

stat:
	SEMICOLON
	| variablestat
	| variable
	| label
	| breakstat
	| gotostat
	| dostat
	| whilestat
	| repeatstat
	| ifstat
	| numericforstat
	| genericforstat
	| functionstat
	| localfunctionstat
	| localvariablestat;

breakstat: BREAK;
gotostat: GOTO NAME;
dostat: DO block END;
whilestat: WHILE exp DO block END;
repeatstat: REPEAT block UNTIL exp;
ifstat:
	IF exp THEN block (ELSEIF exp THEN block)* (ELSE block)? END;
genericforstat: FOR namelist IN explist DO block END;
numericforstat:
	FOR NAME EQUALS exp COMMA exp (COMMA exp)? DO block END;
functionstat: FUNCTION funcname funcbody;
localfunctionstat: LOCAL FUNCTION NAME funcbody;
localvariablestat: LOCAL attnamelist (EQUALS explist)?;
variablestat: variablelist EQUALS explist;

attnamelist: NAME attrib (COMMA NAME attrib)*;

attrib: (LT NAME GT)?;

retstat: RETURN explist? SEMICOLON?;

label: DCOLON NAME DCOLON;

funcname: NAME (DOT NAME)* (COLON NAME)?;

variablelist: variable (COMMA variable)*;

namelist: NAME (COMMA NAME)*;

explist: exp (COMMA exp)*;

exp:
	NIL
	| FALSE
	| TRUE
	| number
	| lstring
	| DOTS
	| functiondef
	| variable
	| tableconstructor
	| <assoc = right> exp operatorPower exp
	| operatorUnary exp
	| exp operatorMulDivMod exp
	| exp operatorAddSub exp
	| <assoc = right> exp operatorStrcat exp
	| exp operatorComparison exp
	| exp operatorAnd exp
	| exp operatorOr exp
	| exp operatorBitwise exp;

variable:
	NAME										# namedvariable
	| variable (LBRACK exp RBRACK | DOT NAME)	# index
	| LPAREN exp RPAREN							# parenthesesvariable
	| variable nameAndArgs						# functioncall;

nameAndArgs: (COLON NAME)? args;

args: LPAREN explist? RPAREN | tableconstructor | lstring;

functiondef: FUNCTION funcbody;

funcbody: LPAREN parlist? RPAREN block END;

parlist: namelist (COMMA DOTS)? | DOTS;

tableconstructor: LBRACE fieldlist? RBRACE;

fieldlist: field (fieldsep field)* fieldsep?;

field: LBRACK exp RBRACK EQUALS exp | NAME EQUALS exp | exp;

fieldsep: COMMA | SEMICOLON;

operatorOr: OR;

operatorAnd: AND;

operatorComparison:
	LT		# lessthan
	| GT	# greaterthan
	| LTE	# lessthanorequal
	| GTE	# greaterthanorequal
	| NEQ	# notequal
	| EQ	# equal;

operatorStrcat: STRCAT;

operatorAddSub: PLUS | MINUS;

operatorMulDivMod: MUL | DIV | MOD | DIVFLOOR;

operatorBitwise: BITAND | BITOR | BITNOT | BITSHL | BITSHR;

operatorUnary: NOT | LEN | MINUS | BITNOT;

operatorPower: POWER;

number: INT | HEX | FLOAT | HEX_FLOAT;

lstring: NORMALSTRING | CHARSTRING | LONGSTRING;
