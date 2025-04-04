program RelationalTest;

var
    intVar: integer;
    byteVar: byte;
    floatVar: real;
    resVar: boolean;
begin
    writeln('___Integer tests\n');

    intVar := 5;
    resVar := intVar = intVar;
    writeln('intVar == intVar\n');
    writeln(resVar);

    resVar := intVar = 10;
    writeln('intVar == 10\n');
    writeln(resVar);

    resVar := intVar <> 10;
    writeln('intVar != 10\n');
    writeln(resVar);

    resVar := intVar > intVar;
    writeln('intVar > intVar\n');
    writeln(resVar);

    resVar := intVar < intVar;
    writeln('intVar < intVar\n');
    writeln(resVar);

    resVar := intVar >= intVar;
    writeln('intVar >= intVar\n');
    writeln(resVar);

    resVar := intVar <= intVar;
    writeln('intVar <= intVar\n');
    writeln(resVar);

    writeln('___Bytes tests\n');

    byteVar := 200;
    resVar := byteVar = byteVar;
    writeln('byteVar == byteVar\n');
    writeln(resVar);

    resVar := byteVar = 10;
    writeln('byteVar == 10\n');
    writeln(resVar);

    resVar := byteVar <> 10;
    writeln('byteVar != 10\n');
    writeln(resVar);

    resVar := byteVar > byteVar;
    writeln('byteVar > byteVar\n');
    writeln(resVar);

    resVar := byteVar < byteVar;
    writeln('byteVar < byteVar\n');
    writeln(resVar);

    resVar := byteVar >= byteVar;
    writeln('byteVar >= byteVar\n');
    writeln(resVar);

    resVar := byteVar <= byteVar;
    writeln('byteVar <= byteVar\n');
    writeln(resVar);

    writeln('___Float tests\n');

    floatVar := 20.0123;
    resVar := floatVar = floatVar;
    writeln('floatVar == floatVar\n');
    writeln(resVar);

    resVar := floatVar = 10.25;
    writeln('floatVar == 10.25\n');
    writeln(resVar);

    resVar := floatVar <> 10.25;
    writeln('floatVar != 10.25\n');
    writeln(resVar);

    resVar := floatVar > floatVar;
    writeln('floatVar > floatVar\n');
    writeln(resVar);

    resVar := floatVar < floatVar;
    writeln('floatVar < floatVar\n');
    writeln(resVar);

    resVar := floatVar >= floatVar;
    writeln('floatVar >= floatVar\n');
    writeln(resVar);

    resVar := floatVar <= floatVar;
    writeln('floatVar <= floatVar\n');
    writeln(resVar);
end.