program SumTest;

var
    x, y, z, res, neg: Integer;
begin
    x := 10;
    writeln(x);

    y := 20;
    z := 30 + 40;
    writeln(z);

    res := x + 100;
    writeln(res);

    res := res - z;
    writeln(res);

    res := res OR y;
    writeln(res);

    neg := -1;
    writeln(neg);

    res := res * neg;
    writeln(res);

    res := 10 + res;
    writeln(res);
end.