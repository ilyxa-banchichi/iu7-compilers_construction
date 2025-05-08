program StructureTest;

type TPhoneNumber = array[1..11] of integer;
type TAddress = array[1..3] of string[50];

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
    write('Phone number: +');
    for i := 1 to 11 do begin
        write(phone[i]);
    end;
    write('\n');
end;

function PrintAddress(var address: TAddress);
var i: integer;
begin
    write(address[1][1]);
    write(address[1]);
    write(', ');
    write(address[2]);
    write(', ');
    write(address[3]);
    write('\n');
end;

type TPerson = record
    Name: string[15];
    Sex: char;
    Age: integer;
    Height, Weight: real;
    IsStudent: boolean;
    Phone: TPhoneNumber;
    Address: array[1..3] of string[50]
end;

var
    person, person2: TPerson;
begin
    person.Name := 'Alice';
    person.Sex := 'F';
    person.Age := 30;
    person.Height := 1.75;
    person.Weight := 55.7;
    person.IsStudent := false;
    FillPhoneNumber(person.Phone, 7);
    person.Address[1] := 'Moscow';
    person.Address[2] := 'Bauman Street';
    person.Address[3] := 'House 50';

    person2.Name := 'Bob';
    person2.Sex := 'M';
    person2.Age := 22;
    person2.Height := 1.97;
    person2.Weight := 65.5;
    person2.IsStudent := true;
    FillPhoneNumber(person2.Phone, 4);

    writeln('Name: ', person.Name);
    writeln('Sex: ', person.Sex);
    writeln('Age: ', person.Age);
    writeln('Height: ', person.Height);
    writeln('Weight: ', person.Height);
    writeln('Is Student: ', person.IsStudent);
    PrintPhoneNumber(person.Phone);
    PrintAddress(person.Address);

    write('\n');

    writeln('Name: ', person2.Name);
    writeln('Sex: ', person2.Sex);
    writeln('Age: ', person2.Age);
    writeln('Height: ', person2.Height);
    writeln('Weight: ', person2.Height);
    writeln('Is Student: ', person2.IsStudent);
    PrintPhoneNumber(person2.Phone);
end.