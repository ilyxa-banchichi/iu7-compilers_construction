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

function AABB(min, max: TVector3): TAABB;
begin
    Result.min := min;
    Result.max := max;
end;

var
    Box1, Box2: TAABB;
begin
    writeln('jopa');
end.