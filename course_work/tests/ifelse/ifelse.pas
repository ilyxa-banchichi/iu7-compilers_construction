program RelationalTest;

var
    intVar: integer;
    floatVar: real;
    resVar: boolean;
begin
    intVar := 5;
    floatVar := 10.1234;
    floatVar := intVar * floatVar;
    writeln(floatVar);
end.