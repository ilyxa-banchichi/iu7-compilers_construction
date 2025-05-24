program FibonacciFunction;

const
  Count = 10;

function Fibonacci(n: integer): integer;
begin
  if (n = 0) then
    Result := 0
  else if (n = 1) then
    Result := 1
  else
    Result := Fibonacci(n - 1) + Fibonacci(n - 2);
end;

var
  i: integer;

begin
  for i := 0 to Count do
    write(Fibonacci(i), ' ');
  writeln('');
end.