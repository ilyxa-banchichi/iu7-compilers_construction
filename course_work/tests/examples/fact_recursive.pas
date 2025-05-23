program FactRecursiveTest;

function fact(n: longint): longint;
begin
    if n = 1 then
        Result := 1
    else
        Result := n * fact(n - 1);
end;

var
    n: longint;
begin
    n := 10;
    writeln(fact(n));
end.