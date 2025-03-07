program TypesTest;

var
    intVar: integer;
    longintVar: longint;
    byteVar: byte;

    booleanVar: boolean;

    charVar: char;

    floatVar: real;
    doubleVar: double;
begin
    intVar := 32767;
    writeln(intVar);

    intVar := -32768;
    writeln(intVar);

    longintVar := 2147483647;
    writeln(longintVar);

    longintVar := -2147483648;
    writeln(longintVar);

    byteVar := 255;
    writeln(byteVar);

    booleanVar := true;
    writeln(booleanVar);

    charVar := 'a';
    writeln(charVar);
    
    floatVar := 0.00001;
    writeln(floatVar);
    
    doubleVar := 0.00000000001;
    writeln(doubleVar);
end.