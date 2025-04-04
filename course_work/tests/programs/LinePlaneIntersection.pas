program LinePlaneIntersection;

type TVector3 = record
    x, y, z: real
end;

var
    A, B, C, D: real;
    P0: TVector3;
    d: TVector3;
    t: real;
    intersection: TVector3;
    denominator, numerator: real;
begin
    A := 1;
    B := 2;
    C := 3;
    D := -6;

    P0.x := 1;
    P0.y := 1;
    P0.z := 1;

    d.x := 1;
    d.y := 1;
    d.z := 1;

    numerator := -(A * P0.x + B * P0.y + C * P0.z + D);
    denominator := A * d.x + B * d.y + C * d.z;

    if denominator = 0 then begin
        if numerator = 0 then
            writeln('Legit')
        else
            writeln('Is parrallel');
    end
    else begin
        t := numerator / denominator;

        intersection.x := P0.x + t * d.x;
        intersection.y := P0.y + t * d.y;
        intersection.z := P0.z + t * d.z;

        writeln('Intersection point:\n');
        writeln(intersection.x);
        writeln(intersection.y);
        writeln(intersection.z);
    end;
end.