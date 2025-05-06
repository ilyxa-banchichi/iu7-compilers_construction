program FunctionTest;

function f(x: real): real;
begin
    Result := x * x + 1;
end;

function g(x, z: real): real;
begin
    Result := x * x + 2 * z;
end;

function swap(var x, y: real);
var temp: real;
begin
    temp := x;
    x := y;
    y := x;
end;

var
    x, y: real;
    i: integer;
    c: char;
begin
    x := 10;
    y := 5;
    swap(x, y);
    writeln(x);
    writeln(y);
end.