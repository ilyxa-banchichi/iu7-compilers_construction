program AABBCollision;

type TVector3 = record
    x, y, z: real
end;

function Vector3(x, y, z: real): TVector3;
begin
    Result.x := x;
    Result.y := y;
    Result.z := z;
end;

function PrintVector3(a: TVector3);
begin
    write('(');
    write(a.x);
    write(', ');
    write(a.y);
    write(', ');
    write(a.z);
    write(')');
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

type TAABB = record
    min, max: TVector3
end;

function PrintAABB(a: TAABB);
begin
    PrintVector3(a.min);
    write(', ');
    PrintVector3(a.max);
end;

function AABB(position, size: TVector3): TAABB;
var
    extents: TVector3;
begin
    extents := Mul(size, 0.5);
    Result.min := Sub(position, extents);
    Result.max := Add(position, extents);
end;

function IntersectAABB(a, b: TAABB): integer;
var
    temp: boolean;
begin
    temp := a.min.x <= b.max.x;
    if temp then
        Result := 1
    else
        Result := 0;
end;

type TCollisionMatrix = array[1..10, 1..10] of integer;
type TBoxes = array[1..10] of TAABB;

function FillCollisionMatrix(var m: TCollisionMatrix; var boxes: TBoxes);
var
    i, j: integer;
begin
    for i := 1 to 10 do begin
        for j := 1 to 10 do begin
            m[i, j] := IntersectAABB(boxes[i], boxes[j]);
        end;
    end;
end;

var
    i, j: integer;
    boxes: array[1..10] of TAABB;
    collisionMatrix: array[1..10, 1..10] of integer;
begin
{    boxes[1] := AABB(Vector3(10, 5, 10), Vector3(1, 1, 1));
    boxes[2] := AABB(Vector3(0, 0, 0), Vector3(2, 2, 2));
    boxes[3] := AABB(Vector3(1, 0, 1), Vector3(2, 2, 2));

    PrintAABB(boxes[1]);
    writeln('');
    PrintAABB(boxes[2]);
    writeln('');
    PrintAABB(boxes[3]);
    writeln('');}

    FillCollisionMatrix(collisionMatrix, boxes);

    for i := 1 to 10 do begin
        for j := 1 to 10 do begin
            writeln('Intersect AABB', i, ' vs ', j, ': ', collisionMatrix[i, j]);
        end;
    end;
end.