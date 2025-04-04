program RelationalTest;

var
    intVar: integer;
    stepVar: real;
    floatVar: real;
    etalonVar: real;
begin
    intVar := 5;
    stepVar := 2.0;
    floatVar := 0.0;
    etalonVar := 10.123524;

    if floatVar < etalonVar then
        floatVar := intVar * stepVar
    else
        stepVar := stepVar / 2;

    writeln(stepVar);
    writeln(floatVar);

    if floatVar < etalonVar then
        floatVar := intVar * stepVar
    else
        stepVar := stepVar / 2;

    writeln(stepVar);
    writeln(floatVar);

    if floatVar < etalonVar then
        floatVar := intVar * stepVar
    else
        stepVar := stepVar / 2;

    writeln(stepVar);
    writeln(floatVar);
end.