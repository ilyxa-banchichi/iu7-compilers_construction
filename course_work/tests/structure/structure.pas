program StructureTest;


type TPhoneNumber = array[1..11] of integer;

function FillPhoneNumber(var phone: TPhoneNumber; startNumber: integer);
var i: integer;
begin
    for i := 1 to 11 do begin
        phone[i] := (startNumber mod 10);
        startNumber := startNumber + 1;
    end;
end;

function PrintPhoneNumber(phone: TPhoneNumber);
var i: integer;
begin
    for i := 1 to 11 do begin
        writeln(phone[i]);
    end;
end;

type TPerson = record
    Age: integer;
    Height, Weight: real;
    IsStudent: boolean;
    Phone: TPhoneNumber
end;

var
    person, person2: TPerson;
begin
    person.Age := 30;
    person.Height := 1.75;
    person.Weight := 55.7;
    person.IsStudent := false;
    FillPhoneNumber(person.Phone, 7);

    person2.Age := 22;
    person2.Height := 1.97;
    person2.Weight := 65.5;
    person2.IsStudent := true;
    FillPhoneNumber(person2.Phone, 4);

    writeln('Age: ', person.Age);
    writeln('Height: ', person.Height);
    writeln('Weight: ', person.Height);
    writeln('Is Student: ', person.IsStudent);
    PrintPhoneNumber(person.Phone);

    writeln('Age: ', person2.Age);
    writeln('Height: ', person2.Height);
    writeln('Weight: ', person2.Height);
    writeln('Is Student: ', person2.IsStudent);
    PrintPhoneNumber(person2.Phone);
end.