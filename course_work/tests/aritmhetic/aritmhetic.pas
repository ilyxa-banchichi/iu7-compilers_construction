program TypesTest;

var
    intVar: integer;
    longintVar: longint;
    byteVar: byte;

    floatVar: real;
    doubleVar: double;
begin
    writeln('___Integer tests\n');

    intVar := 101;
    writeln(intVar);

    writeln('intVar + 2\n');
    intVar := intVar + 2;
    writeln(intVar);

    writeln('intVar - 1\n');
    intVar := intVar - 1;
    writeln(intVar);

    writeln('intVar * 22\n');
    intVar := intVar * 22;
    writeln(intVar);

    writeln('intVar / 13\n');
    floatVar := intVar / 13;
    writeln(floatVar);

    writeln('intVar div 13\n');
    intVar := intVar div 13;
    writeln(intVar);

    writeln('intVar mod 13\n');
    intVar := intVar mod 13;
    writeln(intVar);

    writeln('___Float tests\n');

    floatVar := 101;
    writeln(floatVar);

    writeln('floatVar + 2\n');
    floatVar := floatVar + 2;
    writeln(floatVar);

    writeln('floatVar - 1\n');
    floatVar := floatVar - 1;
    writeln(floatVar);

    writeln('floatVar * 22\n');
    floatVar := floatVar * 22;
    writeln(floatVar);

    writeln('floatVar / 13\n');
    floatVar := floatVar / 13;
    writeln(floatVar);

    writeln('___Byte (unsigned int) tests\n');
    byteVar := 101;
    writeln(byteVar);

    writeln('intVar + 2\n');
    byteVar := byteVar + 2;
    writeln(byteVar);

    writeln('byteVar - 1\n');
    byteVar := byteVar - 1;
    writeln(byteVar);

    writeln('byteVar * 2\n');
    byteVar := byteVar * 2;
    writeln(byteVar);

    writeln('byteVar / 13\n');
    floatVar := byteVar / 13;
    writeln(floatVar);

    writeln('byteVar div 13\n');
    byteVar := byteVar div 13;
    writeln(byteVar);

    writeln('byteVar mod 13\n');
    byteVar := byteVar mod 13;
    writeln(byteVar);
end.