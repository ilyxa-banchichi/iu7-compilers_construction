; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"bool1Var" = alloca i1
  %"bool2Var" = alloca i1
  %"resVar" = alloca i1
  %".2" = alloca [22 x i8]
  store [22 x i8] c"1 == true\0a2 == false\0a\00", [22 x i8]* %".2"
  %".4" = getelementptr [22 x i8], [22 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  store i1 1, i1* %"bool1Var"
  store i1 0, i1* %"bool2Var"
  %".9" = load i1, i1* %"bool1Var"
  %".10" = load i1, i1* %"bool2Var"
  %".11" = and i1 %".9", %".10"
  store i1 %".11", i1* %"resVar"
  %".13" = alloca [5 x i8]
  store [5 x i8] c"and\0a\00", [5 x i8]* %".13"
  %".15" = getelementptr [5 x i8], [5 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".18" = load i1, i1* %"resVar"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".19" = select  i1 %".18", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".22" = alloca [21 x i8]
  store [21 x i8] c"1 == true\0a2 == true\0a\00", [21 x i8]* %".22"
  %".24" = getelementptr [21 x i8], [21 x i8]* %".22", i8 0, i8 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  store i1 1, i1* %"bool1Var"
  store i1 1, i1* %"bool2Var"
  %".29" = load i1, i1* %"bool1Var"
  %".30" = load i1, i1* %"bool2Var"
  %".31" = and i1 %".29", %".30"
  store i1 %".31", i1* %"resVar"
  %".33" = alloca [5 x i8]
  store [5 x i8] c"and\0a\00", [5 x i8]* %".33"
  %".35" = getelementptr [5 x i8], [5 x i8]* %".33", i8 0, i8 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".38" = load i1, i1* %"resVar"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".39" = select  i1 %".38", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".42" = alloca [23 x i8]
  store [23 x i8] c"1 == false\0a2 == false\0a\00", [23 x i8]* %".42"
  %".44" = getelementptr [23 x i8], [23 x i8]* %".42", i8 0, i8 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  store i1 0, i1* %"bool1Var"
  store i1 0, i1* %"bool2Var"
  %".49" = load i1, i1* %"bool1Var"
  %".50" = load i1, i1* %"bool2Var"
  %".51" = and i1 %".49", %".50"
  store i1 %".51", i1* %"resVar"
  %".53" = alloca [5 x i8]
  store [5 x i8] c"and\0a\00", [5 x i8]* %".53"
  %".55" = getelementptr [5 x i8], [5 x i8]* %".53", i8 0, i8 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".58" = load i1, i1* %"resVar"
  %"true_value_str_ptr.2" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.2" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".59" = select  i1 %".58", i8* %"true_value_str_ptr.2", i8* %"false_value_str_ptr.2"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".62" = alloca [22 x i8]
  store [22 x i8] c"1 == true\0a2 == false\0a\00", [22 x i8]* %".62"
  %".64" = getelementptr [22 x i8], [22 x i8]* %".62", i8 0, i8 0
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".64")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  store i1 1, i1* %"bool1Var"
  store i1 0, i1* %"bool2Var"
  %".69" = load i1, i1* %"bool1Var"
  %".70" = load i1, i1* %"bool2Var"
  %".71" = or i1 %".69", %".70"
  store i1 %".71", i1* %"resVar"
  %".73" = alloca [4 x i8]
  store [4 x i8] c"or\0a\00", [4 x i8]* %".73"
  %".75" = getelementptr [4 x i8], [4 x i8]* %".73", i8 0, i8 0
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".75")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".77" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".78" = load i1, i1* %"resVar"
  %"true_value_str_ptr.3" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.3" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".79" = select  i1 %".78", i8* %"true_value_str_ptr.3", i8* %"false_value_str_ptr.3"
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".79")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".82" = alloca [21 x i8]
  store [21 x i8] c"1 == true\0a2 == true\0a\00", [21 x i8]* %".82"
  %".84" = getelementptr [21 x i8], [21 x i8]* %".82", i8 0, i8 0
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".84")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  store i1 1, i1* %"bool1Var"
  store i1 1, i1* %"bool2Var"
  %".89" = load i1, i1* %"bool1Var"
  %".90" = load i1, i1* %"bool2Var"
  %".91" = or i1 %".89", %".90"
  store i1 %".91", i1* %"resVar"
  %".93" = alloca [4 x i8]
  store [4 x i8] c"or\0a\00", [4 x i8]* %".93"
  %".95" = getelementptr [4 x i8], [4 x i8]* %".93", i8 0, i8 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".97" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".98" = load i1, i1* %"resVar"
  %"true_value_str_ptr.4" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.4" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".99" = select  i1 %".98", i8* %"true_value_str_ptr.4", i8* %"false_value_str_ptr.4"
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".99")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".101" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".102" = alloca [23 x i8]
  store [23 x i8] c"1 == false\0a2 == false\0a\00", [23 x i8]* %".102"
  %".104" = getelementptr [23 x i8], [23 x i8]* %".102", i8 0, i8 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  store i1 0, i1* %"bool1Var"
  store i1 0, i1* %"bool2Var"
  %".109" = load i1, i1* %"bool1Var"
  %".110" = load i1, i1* %"bool2Var"
  %".111" = or i1 %".109", %".110"
  store i1 %".111", i1* %"resVar"
  %".113" = alloca [4 x i8]
  store [4 x i8] c"or\0a\00", [4 x i8]* %".113"
  %".115" = getelementptr [4 x i8], [4 x i8]* %".113", i8 0, i8 0
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".115")
  %"end_line_str_ptr.16" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".117" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.16")
  %".118" = load i1, i1* %"resVar"
  %"true_value_str_ptr.5" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.5" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".119" = select  i1 %".118", i8* %"true_value_str_ptr.5", i8* %"false_value_str_ptr.5"
  %".120" = call i32 (i8*, ...) @"printf"(i8* %".119")
  %"end_line_str_ptr.17" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.17")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]