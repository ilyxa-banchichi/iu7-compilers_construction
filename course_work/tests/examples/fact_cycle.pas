program FactCycleTest;

function fact(n: longint): longint;
begin
    Result := 1;
    while n > 1 do begin
        Result := Result * n;
        n := n - 1;
    end;
end;

var
    n: longint;
begin
    n := 10;
    writeln(fact(n));
end.