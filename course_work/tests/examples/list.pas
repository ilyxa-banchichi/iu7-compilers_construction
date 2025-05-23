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

function printNode(var node: PNode);
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
    ttt: PNode;
begin
    new(head);
    head^.Value := 0;

    current := head;
    for i := 1 to Count do begin
        new(current^.Next);
        current^.Next^.Next := nil;
        current^.Next^.Value := i;
        current := current^.Next;
    end;

    current := head;
    while current <> nil do begin
        ttt.Ptr := current;
        printNode(ttt);
        current := current^.Next;
    end;

    ttt.Ptr := head;
    reverse(ttt);
    head := ttt.Ptr;

    writeln('___Reserved_____');
    current := head;
    while current <> nil do begin
        ttt.Ptr := current;
        printNode(ttt);
        current := current^.Next;
    end;

    current := head;
    while current <> nil do begin
        temp := current^.Next;
        dispose(current);
        current := temp;
    end;
end.