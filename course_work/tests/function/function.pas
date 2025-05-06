program FunctionTest;

function swap(var x, y: real);
var temp: real;
begin
    temp := x;
    x := y;
    y := temp;
end;

function add(x, y: real): real;
begin
    Result := x + y;
end;

var
    x, y: real;
    i: integer;
    c: char;
begin
    x := 10;
    y := 5;
    writeln(x);
    writeln(y);
    swap(x, y);
    writeln(x);
    writeln(y);
    writeln(add(x, y));
    writeln(add(x, 100));
end.