program PointerTest;

type TRec = record
    Age: integer;
    Height, Weight: real
end;

var
    vInt: integer;
    pInt: ^integer;
    pPerson: ^TRec;
    vPerson: TRec;
begin
    pInt := @vInt;

    vInt := 5;
    writeln(pInt^);

    pInt^ := 10;
    writeln(pInt^);

    pPerson := @vPerson;
    pInt := @vPerson.Age;

    vPerson.Age := 10;
    vPerson.Height := 20.0;
    vPerson.Weight := 30.0;

    writeln(pPerson^.Weight);
    writeln(pInt^);
end.