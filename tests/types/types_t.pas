program TypesTest;

var
    intVar: integer;
    longintVar: longint;
    byteVar: byte;

    floatVar: real;
    doubleVar: double;

    booleanVar: boolean;
    strVar: string;
begin
    intVar := 32767;
    writeln(intVar);

    intVar := -32768;
    writeln(intVar);

    intVar := 7;
    writeln(intVar);

    longintVar := 2147483647;
    writeln(longintVar);

    longintVar := -2147483648;
    writeln(longintVar);

    byteVar := 255;
    writeln(byteVar);

    floatVar := 1.01;
    writeln(floatVar);

    floatVar := 5;
    writeln(floatVar);

    doubleVar := 245.123456789;
    writeln(doubleVar);

    booleanVar := true;
    writeln(booleanVar);

    booleanVar := false;
    writeln(booleanVar);

    strVar := 'Hello world';
    writeln(strVar);
end.