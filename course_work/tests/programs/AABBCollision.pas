program AABBCollision;

type TVector3 = record
    x, y, z: real
end;

type TAABB = record
    min, max: TVector3
end;

function Vector3(x, y, z: real): TVector3;
begin
    Result.x := x;
    Result.y := y;
    Result.z := z;
end;

function Mul(a: TVector3; b: real): TVector3;
begin
    Result.x := a.x * b;
    Result.y := a.y * b;
    Result.z := a.z * b;
end;

function Add(a, b: TVector3): TVector3;
begin
    Result.x := a.x + b.x;
    Result.y := a.y + b.y;
    Result.z := a.z + b.z;
end;

function Sub(a, b: TVector3): TVector3;
begin
    Result.x := a.x - b.x;
    Result.y := a.y - b.y;
    Result.z := a.z - b.z;
end;

function AABB(position, size: TVector3): TAABB;
var
    extents: TVector3;
begin
    extents := Mul(size, 0.5);
    Result.min := Sub(position, extents);
    Result.max := Add(position, extents);
end;

function swap(var x, y: real);
var temp: real;
begin
    temp := x;
    x := y;
    y := temp;
end;

function add_real(x, y: real): real;
begin
    Result := x + y;
end;

var
    Box1, Box2: TAABB;
begin
    Box1 := AABB(Vector3(10, 5, 10), Vector3(1, 1, 1));
    Box2 := AABB(Vector3(0, 0, 0), Vector3(2, 2, 2));

    writeln('Box1.min.x = ', Box1.min.x);
    writeln('Box1.min.y = ',Box1.min.y);
    swap(Box1.min.x, Box1.min.y);
    writeln('Box1.min.x = ', Box1.min.x);
    writeln('Box1.min.y = ', Box1.min.y);
    writeln(add_real(Box1.min.x, Box1.min.y));
end.