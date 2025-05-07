program ArrayTest;

var
    i, j, k, n, m: byte;
    f: real;
    a1: array[1..10] of integer;
    ar1: array[1..10] of real;
    ac1: array[1..10] of char;
    a2: array[1..10, 2..5] of integer;
    ar2: array[1..10, 2..5] of real;
    ac2: array[1..10, 2..5] of char;
begin
    n := 10;
    m := 5;

    writeln('Array\n');
    writeln('Int\n');
    for i := 1 to n do begin
        a1[i] := (i - 1);
    end;

    for i := 1 to n do begin
        writeln(a1[i]);
    end;

    writeln('Float\n');
    for i := 1 to n do begin
        ar1[i] := (i - 1);
    end;

    for i := 1 to n do begin
        writeln(ar1[i]);
    end;

    writeln('Char\n');
    for i := 1 to n do begin
        ac1[i] := i + 60;
    end;

    for i := 1 to n do begin
        writeln(ac1[i]);
    end;

    writeln('Matrix\n');
    writeln('Int\n');
    k := 0;
    for i := 1 to n do begin
        for j := 2 to m do begin
            a2[i, j] := k;
            k := k + 1;
        end;
    end;

    for i := 1 to n do begin
        for j := 2 to m do begin
            writeln(a2[i, j]);
        end;
    end;

    writeln('Float\n');
    k := 0;
    for i := 1 to n do begin
        for j := 2 to m do begin
            ar2[i, j] := k;
            k := k + 1;
        end;
    end;

    for i := 1 to n do begin
        for j := 2 to m do begin
            writeln(ar2[i, j]);
        end;
    end;

    writeln('Char\n');
    k := 60;
    for i := 1 to n do begin
        for j := 2 to m do begin
            ac2[i, j] := k;
            k := k + 1;
        end;
    end;

    for i := 1 to n do begin
        for j := 2 to m do begin
            writeln(ac2[i, j]);
        end;
    end;
end.