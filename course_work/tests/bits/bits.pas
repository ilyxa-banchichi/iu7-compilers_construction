program BitsTest;

var
    intVar: integer;
    byteVar: byte;
begin
    writeln('___Integer tests\n');

    intVar := 101;
    writeln(intVar);

    writeln('intVar or 2\n');
    intVar := intVar or 2;
    writeln(intVar);

    writeln('intVar and 83\n');
    intVar := intVar and 83;
    writeln(intVar);

    writeln('intVar shl 2\n');
    intVar := intVar shl 2;
    writeln(intVar);

    writeln('intVar shr 2\n');
    intVar := intVar shr 2;
    writeln(intVar);

    writeln('not intVar\n');
    intVar := not intVar;
    writeln(intVar);

    writeln('___Byte (unsigned int) tests\n');
    byteVar := 101;
    writeln(byteVar);

    writeln('byteVar or 2\n');
    byteVar := byteVar or 2;
    writeln(byteVar);

    writeln('byteVar and 83\n');
    byteVar := byteVar and 83;
    writeln(byteVar);

    writeln('byteVar shl 1\n');
    byteVar := byteVar shl 1;
    writeln(byteVar);

    writeln('byteVar shr 2\n');
    byteVar := byteVar shr 1;
    writeln(byteVar);

    writeln('not byteVar\n');
    byteVar := not byteVar;
    writeln(byteVar);
end.