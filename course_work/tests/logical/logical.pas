program LogicalTest;

var
    bool1Var: boolean;
    bool2Var: boolean;
    resVar: boolean;
begin
    writeln('1 == true\n2 == false\n');
    bool1Var := true;
    bool2Var := false;
    resVar := bool1Var and bool2Var;

    writeln('and\n');
    writeln(resVar);

    writeln('1 == true\n2 == true\n');
    bool1Var := true;
    bool2Var := true;
    resVar := bool1Var and bool2Var;

    writeln('and\n');
    writeln(resVar);

    writeln('1 == false\n2 == false\n');
    bool1Var := false;
    bool2Var := false;
    resVar := bool1Var and bool2Var;

    writeln('and\n');
    writeln(resVar);

    writeln('1 == true\n2 == false\n');
    bool1Var := true;
    bool2Var := false;
    resVar := bool1Var or bool2Var;

    writeln('or\n');
    writeln(resVar);

    writeln('1 == true\n2 == true\n');
    bool1Var := true;
    bool2Var := true;
    resVar := bool1Var or bool2Var;

    writeln('or\n');
    writeln(resVar);

    writeln('1 == false\n2 == false\n');
    bool1Var := false;
    bool2Var := false;
    resVar := bool1Var or bool2Var;

    writeln('or\n');
    writeln(resVar);
end.