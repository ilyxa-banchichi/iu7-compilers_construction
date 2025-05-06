program FunctionTest;

procedure p(x: real);
begin
    writeln(x);
end;

function f(x: real): real;
begin
    Result := x * x + 1;
end;

function g(x, z: real): real;
begin
    Result := x * x + 2 * z;
end;

var
    x, y: real;
    i: integer;
    c: char;
begin
    x := 10;
    i := 5;
    y := f(x);
    y := g(x, i);
    y := p(y);
    writeln(y);
end.