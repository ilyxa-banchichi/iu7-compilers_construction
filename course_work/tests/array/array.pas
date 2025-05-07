program ArrayTest;

var
    i, j, k, n, m: integer;
    f: real;
    a1: array[1..10] of integer;
    ar1: array[1..10] of real;
    a2: array[1..10, 2..5] of integer;
    ar2: array[1..10, 2..5] of real;
begin
    n := 10;
    m := 5;
    for i := 1 to n do begin
        a1[i] := (i - 1);
    end;

    for i := 1 to n do begin
        writeln(a1[i]);
    end;

    writeln('Matrix\n');
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
end.