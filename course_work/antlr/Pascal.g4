grammar Pascal;
options {
    caseInsensitive = true;
}

program
    : programHeading (INTERFACE)? block DOT EOF
    ;
programHeading
    : PROGRAM identifier (LPAREN identifierList RPAREN)? SEMI
    | UNIT identifier SEMI
    ;
identifier
    : IDENT
    ;
block
    : (
        constantDefinitionPart
        | typeDefinitionPart
        | variableDeclarationPart
        | functionDeclarationPart
        | usesUnitsPart
        | IMPLEMENTATION
    )* compoundStatement
    ;
usesUnitsPart
    : USES identifierList SEMI
    ;
constantDefinitionPart
    : CONST (constantDefinition SEMI)+
    ;
constantDefinition
    : identifier EQUAL constant
    ;
constantChr
    : CHR LPAREN unsignedInteger RPAREN
    ;
constant
    : unsignedNumber
    | sign unsignedNumber
    | identifier
    | sign identifier
    | string
    | constantChr
    ;
unsignedNumber
    : unsignedInteger
    | unsignedReal
    ;
unsignedInteger
    : NUM_INT
    ;
unsignedReal
    : NUM_REAL
    ;
sign
    : PLUS
    | MINUS
    ;
bool_
    : TRUE
    | FALSE
    ;
string
    : STRING_LITERAL
    ;
typeDefinitionPart
    : TYPE (typeDefinition SEMI)+
    ;
typeDefinition
    : identifier EQUAL (type_ | functionType)
    ;
functionType
    : FUNCTION (formalParameterList)? (COLON resultType)?
    ;
type_
    : simpleType
    | structuredType
    | pointerType
    ;
simpleType
    : scalarType
    | subrangeType
    | typeIdentifier
    | stringtype
    ;
scalarType
    : LPAREN identifierList RPAREN
    ;
subrangeType
    : constant DOTDOT constant
    ;
typeIdentifier
    : identifier
    | (CHAR | BOOLEAN | INTEGER | REAL | STRING)
    ;
structuredType
    : arrayType
    | recordType
    ;
stringtype
    : STRING LBRACK (identifier | unsignedNumber) RBRACK
    ;
arrayType
    : ARRAY LBRACK typeList RBRACK OF componentType
    | ARRAY LBRACK2 typeList RBRACK2 OF componentType
    ;
typeList
    : indexType (COMMA indexType)*
    ;
indexType
    : simpleType
    ;
componentType
    : type_
    ;
recordType
    : RECORD fieldList? END
    ;
fieldList
    : fixedPart
    ;
fixedPart
    : recordSection (SEMI recordSection)*
    ;
recordSection
    : identifierList COLON type_
    ;
baseType
    : simpleType
    ;
pointerType
    : POINTER typeIdentifier
    ;
variableDeclarationPart
    : VAR variableDeclaration (SEMI variableDeclaration)* SEMI
    ;
variableDeclaration
    : identifierList COLON type_
    ;
functionDeclarationPart
    : functionDeclaration SEMI
    ;
formalParameterList
    : LPAREN formalParameterSection (SEMI formalParameterSection)* RPAREN
    ;
formalParameterSection
    : parameterGroup
    | VAR parameterGroup
    | FUNCTION parameterGroup
    ;
parameterGroup
    : identifierList COLON typeIdentifier
    ;
identifierList
    : identifier (COMMA identifier)*
    ;
constList
    : constant (COMMA constant)*
    ;
functionDeclaration
    : FUNCTION identifier (formalParameterList)? (COLON resultType)? SEMI block
    ;
resultType
    : typeIdentifier
    ;
statement
    : simpleStatement
    | structuredStatement
    ;
simpleStatement
    : assignmentStatement
    | functionDesignator
    | emptyStatement_
    ;
assignmentStatement
    : variable ASSIGN expression
    ;
variable
    : (AT identifier | identifier) (
        LBRACK expression (COMMA expression)* RBRACK
        | DOT identifier
        | POINTER
    )*
    ;
expression
    : shiftExpression (relationaloperator shiftExpression)?
    ;
shiftExpression
    : simpleExpression (shiftOperator shiftExpression)?
    ;
shiftOperator
    : SHL | SHR
    ;
relationaloperator
    : EQUAL
    | NOT_EQUAL
    | LT
    | LE
    | GE
    | GT
    | IN
    ;
simpleExpression
    : term (additiveoperator simpleExpression)?
    ;
additiveoperator
    : PLUS
    | MINUS
    | OR
    ;
term
    : signedFactor (multiplicativeoperator term)?
    ;
multiplicativeoperator
    : STAR
    | SLASH
    | DIV
    | MOD
    | AND
    ;
signedFactor
    : (PLUS | MINUS)? factor
    ;
factor
    : variable
    | LPAREN expression RPAREN
    | functionDesignator
    | unsignedConstant
    | NOT factor
    | bool_
    ;
unsignedConstant
    : unsignedNumber
    | constantChr
    | string
    | NIL
    ;
functionDesignator
    : identifier LPAREN parameterList RPAREN
    ;
parameterList
    : actualParameter (COMMA actualParameter)*
    ;
elementList
    : element (COMMA element)*
    |
    ;
element
    : expression (DOTDOT expression)?
    ;
actualParameter
    : expression parameterwidth*
    ;
parameterwidth
    : COLON expression
    ;
emptyStatement_
    :
    ;
structuredStatement
    : compoundStatement
    | conditionalStatement
    | repetetiveStatement
    ;
compoundStatement
    : BEGIN statements END
    ;
statements
    : statement (SEMI statement)*
    ;
conditionalStatement
    : ifStatement
    ;
ifStatement
    : IF expression THEN statement (ELSE statement)?
    ;
repetetiveStatement
    : whileStatement
    | forStatement
    ;
whileStatement
    : WHILE expression DO statement
    ;
forStatement
    : FOR identifier ASSIGN forList DO statement
    ;
forList
    : initialValue (TO | DOWNTO) finalValue
    ;
initialValue
    : expression
    ;
finalValue
    : expression
    ;
AND          : 'AND';
ARRAY        : 'ARRAY';
BEGIN        : 'BEGIN';
BOOLEAN      : 'BOOLEAN';
CASE         : 'CASE';
CHAR         : 'CHAR';
CHR          : 'CHR';
CONST        : 'CONST';
DIV          : 'DIV';
DO           : 'DO';
DOWNTO       : 'DOWNTO';
ELSE         : 'ELSE';
END          : 'END';
FILE         : 'FILE';
FOR          : 'FOR';
FUNCTION     : 'FUNCTION';
IF           : 'IF';
IN           : 'IN';
INTEGER      : 'INTEGER';
MOD          : 'MOD';
NIL          : 'NIL';
NOT          : 'NOT';
OF           : 'OF';
OR           : 'OR';
PACKED       : 'PACKED';
PROGRAM      : 'PROGRAM';
REAL         : 'REAL';
RECORD       : 'RECORD';
REPEAT       : 'REPEAT';
THEN         : 'THEN';
TO           : 'TO';
TYPE         : 'TYPE';
UNTIL        : 'UNTIL';
VAR          : 'VAR';
WHILE        : 'WHILE';
WITH         : 'WITH';
PLUS         : '+';
MINUS        : '-';
STAR         : '*';
SLASH        : '/';
ASSIGN       : ':=';
COMMA        : ',';
SEMI         : ';';
COLON        : ':';
EQUAL        : '=';
NOT_EQUAL    : '<>';
LT           : '<';
LE           : '<=';
GE           : '>=';
GT           : '>';
LPAREN       : '(';
RPAREN       : ')';
LBRACK       : '[';
LBRACK2      : '(.';
RBRACK       : ']';
RBRACK2      : '.)';
POINTER      : '^';
AT           : '@';
DOT          : '.';
DOTDOT       : '..';
LCURLY       : '{';
RCURLY       : '}';
UNIT         : 'UNIT';
INTERFACE    : 'INTERFACE';
USES         : 'USES';
STRING       : 'STRING';
IMPLEMENTATION: 'IMPLEMENTATION';
TRUE         : 'TRUE';
FALSE        : 'FALSE';
SHL          : 'SHL';
SHR          : 'SHR';
WS           : [ \t\r\n]+ -> skip;
COMMENT_1    : '(*' .*? '*)' -> skip;
COMMENT_2    : '{' .*? '}' -> skip;
IDENT        : [A-Za-z][A-Za-z0-9_]*;
STRING_LITERAL: '\'' ('\'\'' | ~'\'')* '\'';
NUM_INT      : [0-9]+;
NUM_REAL     : [0-9]+ ('.' [0-9]+)? ([Ee] [+-]? [0-9]+)?;