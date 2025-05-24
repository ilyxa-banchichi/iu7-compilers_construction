program BitsTest;

var
    intVar: integer;
    byteVar: byte;
begin
    writeln('___Integer tests');

    intVar := 101;
    writeln(intVar);

    writeln('intVar or 2');
    intVar := intVar or 2;
    writeln(intVar);

    writeln('intVar and 83');
    intVar := intVar and 83;
    writeln(intVar);

    writeln('intVar shl 2');
    intVar := intVar shl 2;
    writeln(intVar);

    writeln('intVar shr 2');
    intVar := intVar shr 2;
    writeln(intVar);

    writeln('not intVar');
    intVar := not intVar;
    writeln(intVar);
end.