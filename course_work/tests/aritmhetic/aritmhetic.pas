program TypesTest;

var
    intVar: integer;
    longintVar: longint;
    byteVar: byte;

    floatVar: real;
    doubleVar: double;

    booleanVar: boolean;
    strVar: string;

    charVar: char;
begin
    intVar := 32767;
    writeln(intVar);

    intVar := floatVar - 32000;
    writeln(intVar);
end.