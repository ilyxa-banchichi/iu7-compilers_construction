program PointerTest;

type TRec = record
    Age: integer;
    Height: real
end;

var
    vInt: integer;
    arr: array[1..10] of integer;
    str: string[20];
    vPerson: TRec;

    pInt: ^integer;
    pChr: ^char;
    pPerson: ^TRec;
begin
    pInt := @vInt;

    vInt := 5;
    writeln(pInt^);

    pInt^ := 10;
    writeln(pInt^);

    pPerson := @vPerson;
    pInt := @vPerson.Age;

    vPerson.Age := 10;
    vPerson.Height := 30.0;

    writeln(pPerson^.Height);
    writeln(pInt^);

    arr[1] := 99;
    pInt := @arr[1];
    writeln(pInt^);

    pInt^ := 9999;
    writeln(arr[1]);

    str := 'Hello world';
    pChr := @str[2];
    writeln(pChr^);

    pChr^ := 'J';
    writeln(str);
end.