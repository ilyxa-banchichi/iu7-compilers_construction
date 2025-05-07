program StructureTest;

function FillPhoneNumber(var number: array[1..11] of integer, startNumber: integer);
var i: integer;
begin
    for i := 1 to 11 do begin
        number[i] := (startNumber mod 10);
        startNumber += 1;
    end;
end;

type TUniversity = record
    Name: string;
    IsTechnical: boolean
end;

type TPerson = record
    Name: string;
    Age: integer;
    Height, Weight: real;
    IsStudent: boolean;
    University: TUniversity;
    PhoneNumber: array[1..11] of integer
end;

var
    person, person2: TPerson;
begin
    person.Name := 'Alice';
    person.Age := 30;
    person.Height := 1.75;
    person.Weight := 55.7;
    person.IsStudent := false;
    FillPhoneNumber(person.PhoneNumber, 7);

    person2.Name := 'Bob';
    person2.Age := 22;
    person2.Height := 1.97;
    person2.Weight := 65.5;
    person2.IsStudent := true;
    person2.University.Name := 'BMSTU';
    person2.University.IsTechnical := true;
    FillPhoneNumber(person2.PhoneNumber, 4);

    writeln('Name: ', person.Name, '\n');
    writeln('Age: ', person.Age);
    writeln('Height: ', person.Height);
    writeln('Is Student: ', person.IsStudent);
    writeln('Is Student: ', person.IsStudent);
    writeln('University: ',  person.University.Name, '\n');
    writeln('University Is Technical: ',  person.University.IsTechnical);

    writeln('Name: ', person2.Name, '\n');
    writeln('Age: ', person2.Age);
    writeln('Height: ', person2.Height);
    writeln('Is Student: ', person2.IsStudent);
    writeln('University: ',  person2.University.Name, '\n');
    writeln('University Is Technical: ',  person2.University.IsTechnical);
end.