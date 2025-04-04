program RelationalTest;

var
    intVar: integer;
    stepVar: real;
    floatVar: real;
    etalonVar: real;
begin
    floatVar := 5.123524;
    intVar := 5;

    writeln('intVar = 5\n');
    writeln(intVar);

    writeln('Single line then intVar * 2\n');
    if intVar < floatVar then
        intVar := intVar * 2;

    writeln(intVar);

    writeln('Single line else intVar * 2\n');
    if intVar < floatVar then
        intVar := intVar * 5
    else
        intVar := intVar * 2;

    writeln(intVar);

    writeln('Multiline test\n');
    floatVar := 50.5;
    if intVar < floatVar then begin
        writeln('then\n');
        intVar := intVar * 5;
    end;
    writeln(intVar);

    writeln('Multiline test\n');
    if intVar < floatVar then begin
        writeln('then\n');
        intVar := intVar * 2;
    end
    else begin
        writeln('else\n');
        intVar := intVar * 2;
    end;
    writeln(intVar);

    writeln('then else singleline test\n');
    if intVar < 1000 then
        if intVar < 1 then
            intVar := 10000
        else
            intVar := 1
    else
        if intVar < 1 then
            intVar := -10000
        else
            intVar := -5;
    writeln(intVar);

    writeln('else then singleline test\n');
    if intVar < 0 then
        if intVar < 1 then
            intVar := 10000
        else
            intVar := 1
    else
        if intVar = 1 then
            intVar := -10000
        else
            intVar := -5;
    writeln(intVar);

    writeln('then else then multiline test\n');
    if intVar < 0 then begin
        writeln('then\n');
        if intVar < -20000 then begin
            writeln('then\n');
            intVar := 10000;
        end
        else begin
            writeln('else\n');
            if intVar > -15000 begin
                writeln('then\n');
                intVar := 1;
            end
            else begin
                writeln('else');
                intVar := -1;
            end;
        end;
    end
    else begin
        if intVar = 1 then
            intVar := -10000
        else
            intVar := -5;
    end;
    writeln(intVar);
end.