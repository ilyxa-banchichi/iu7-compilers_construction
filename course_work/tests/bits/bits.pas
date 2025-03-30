program BitsTest;

var
    intVar: integer;
    byteVar: byte;
begin
    writeln('___Integer tests\n');

    intVar := 101;
    writeln(intVar);

    // writeln('intVar or 2\n');
    // intVar := intVar or 2;
    // writeln(intVar);

    // writeln('intVar and 83\n');
    // intVar := intVar and 83;
    // writeln(intVar);

    writeln('intVar xor 83\n');
    intVar := intVar xor 83;
    writeln(intVar);

    // writeln('___Byte (unsigned int) tests\n');
    // byteVar := 101;
    // writeln(byteVar);

    // writeln('byteVar or 2\n');
    // byteVar := byteVar or 2;
    // writeln(byteVar);

    // writeln('byteVar and 83\n');
    // byteVar := byteVar and 83;
    // writeln(byteVar);
end.