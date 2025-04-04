program CyclesTest;

var
    i, n: integer;
    f: real;
begin
    n := 10;
    f := 1;
    writeln('Start for 1 to ', n);

    for i := 1 to n do begin
        if i mod 2 = 0 then
            f := f * i
        else
            f := f / i;

        writeln('f = ', f);
    end;

    f := 0;
    i := 1;
    while f < 100 do begin
        i := i * 2;
        f := f + i;
        writeln('i = ', i);
    end;
    writeln('Sum = ', f);
end.