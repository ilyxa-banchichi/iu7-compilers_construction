program ListTest;

const
  Count = 10;

type TNode = record
    Next: ^TNode;
    Value: integer
end;

type PNode = record
    Ptr: ^TNode
end;

function printNode(node: PNode);
begin
    writeln(node.Ptr^.Value);
end;

function reverse(var head: PNode);
var
    prev, current, next: ^TNode;
begin
    prev := nil;
    current := head.Ptr;
    while current <> nil do begin
        next := current^.Next;
        current^.Next := prev;
        prev := current;
        current := next;
    end;

    head.Ptr := prev;
end;

var
    head, current, temp: ^TNode;
    i: integer;
    mem: array[0..10] of TNode;
    ptr: PNode;
begin
    head := @mem[0];
    head^.Value := 0;

    current := head;
    for i := 1 to Count do begin
        current^.Next := @mem[i];
        current^.Next^.Next := nil;
        current^.Next^.Value := i;
        current := current^.Next;
    end;

    current := head;
    while current <> nil do begin
        ptr.Ptr := current;
        printNode(ptr);
        current := current^.Next;
    end;

    ptr.Ptr := head;
    reverse(ptr);
    head := ptr.Ptr;

    writeln('___Reserved_____');
    current := head;
    while current <> nil do begin
        ptr.Ptr := current;
        printNode(ptr);
        current := current^.Next;
    end;

    if current <> nil then
        write(current^.Value)
    else
        write(current^.Value)
end.