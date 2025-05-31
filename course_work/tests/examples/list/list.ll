; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TNode" = type {%"TNode"*, i16}
%"PNode" = type {%"TNode"*}
define void @"main"()
{
entry:
  %"head" = alloca %"TNode"*
  %"current" = alloca %"TNode"*
  %"temp" = alloca %"TNode"*
  %"i" = alloca i16
  %"mem" = alloca [11 x %"TNode"]
  %"ptr" = alloca %"PNode"
  %".2" = icmp uge i8 0, 0
  %".3" = icmp ule i8 0, 10
  %".4" = and i1 %".2", %".3"
  br i1 %".4", label %"access_ok", label %"access_fail"
access_ok:
  %".6" = sub i8 0, 0
  %"elem_ptr" = getelementptr [11 x %"TNode"], [11 x %"TNode"]* %"mem", i32 0, i8 %".6"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".8" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  %"TNode"* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".11" = alloca %"TNode"*
  store %"TNode"* %"final_elem_ptr", %"TNode"** %".11"
  %".13" = load %"TNode"*, %"TNode"** %".11"
  store %"TNode"* %".13", %"TNode"** %"head"
  %".15" = load %"TNode"*, %"TNode"** %"head"
  %".16" = getelementptr %"TNode", %"TNode"* %".15", i32 0, i32 1
  %".17" = sext i8 0 to i16
  store i16 %".17", i16* %".16"
  %".19" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".19", %"TNode"** %"current"
  %".21" = sext i8 1 to i16
  store i16 %".21", i16* %"i"
  br label %"for_cond"
for_cond:
  %".24" = load i16, i16* %"i"
  %".25" = icmp sle i16 %".24", 10
  br i1 %".25", label %"for_body", label %"for_exit"
for_body:
  %".27" = load %"TNode"*, %"TNode"** %"current"
  %".28" = getelementptr %"TNode", %"TNode"* %".27", i32 0, i32 0
  %".29" = load i16, i16* %"i"
  %".30" = icmp uge i16 %".29", 0
  %".31" = icmp ule i16 %".29", 10
  %".32" = and i1 %".30", %".31"
  br i1 %".32", label %"access_ok.1", label %"access_fail.1"
for_exit:
  %".61" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".61", %"TNode"** %"current"
  br label %"while_cond"
access_ok.1:
  %".34" = sub i16 %".29", 0
  %"elem_ptr.1" = getelementptr [11 x %"TNode"], [11 x %"TNode"]* %"mem", i32 0, i16 %".34"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".36" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  %"TNode"* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".39" = alloca %"TNode"*
  store %"TNode"* %"final_elem_ptr.1", %"TNode"** %".39"
  %".41" = load %"TNode"*, %"TNode"** %".39"
  store %"TNode"* %".41", %"TNode"** %".28"
  %".43" = load %"TNode"*, %"TNode"** %"current"
  %".44" = getelementptr %"TNode", %"TNode"* %".43", i32 0, i32 0
  %".45" = load %"TNode"*, %"TNode"** %".44"
  %".46" = getelementptr %"TNode", %"TNode"* %".45", i32 0, i32 0
  store %"TNode"* null, %"TNode"** %".46"
  %".48" = load %"TNode"*, %"TNode"** %"current"
  %".49" = getelementptr %"TNode", %"TNode"* %".48", i32 0, i32 0
  %".50" = load %"TNode"*, %"TNode"** %".49"
  %".51" = getelementptr %"TNode", %"TNode"* %".50", i32 0, i32 1
  %".52" = load i16, i16* %"i"
  store i16 %".52", i16* %".51"
  %".54" = load %"TNode"*, %"TNode"** %"current"
  %".55" = getelementptr %"TNode", %"TNode"* %".54", i32 0, i32 0
  %".56" = load %"TNode"*, %"TNode"** %".55"
  store %"TNode"* %".56", %"TNode"** %"current"
  %".58" = add i16 %".24", 1
  store i16 %".58", i16* %"i"
  br label %"for_cond"
while_cond:
  %".64" = load %"TNode"*, %"TNode"** %"current"
  %".65" = icmp ne %"TNode"* %".64", null
  br i1 %".65", label %"while_body", label %"while_exit"
while_body:
  %".67" = getelementptr %"PNode", %"PNode"* %"ptr", i32 0, i32 0
  %".68" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".68", %"TNode"** %".67"
  %".70" = load %"PNode", %"PNode"* %"ptr"
  call void @"printNode"(%"PNode" %".70")
  %".72" = load %"TNode"*, %"TNode"** %"current"
  %".73" = getelementptr %"TNode", %"TNode"* %".72", i32 0, i32 0
  %".74" = load %"TNode"*, %"TNode"** %".73"
  store %"TNode"* %".74", %"TNode"** %"current"
  br label %"while_cond"
while_exit:
  %".77" = getelementptr %"PNode", %"PNode"* %"ptr", i32 0, i32 0
  %".78" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".78", %"TNode"** %".77"
  call void @"reverse"(%"PNode"* %"ptr")
  %".81" = getelementptr %"PNode", %"PNode"* %"ptr", i32 0, i32 0
  %".82" = load %"TNode"*, %"TNode"** %".81"
  store %"TNode"* %".82", %"TNode"** %"head"
  %".84" = alloca [17 x i8]
  store [17 x i8] c"___Reserved_____\00", [17 x i8]* %".84"
  %".86" = getelementptr [17 x i8], [17 x i8]* %".84", i8 0, i8 0
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".86")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".88" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".89" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".89", %"TNode"** %"current"
  br label %"while_cond.1"
while_cond.1:
  %".92" = load %"TNode"*, %"TNode"** %"current"
  %".93" = icmp ne %"TNode"* %".92", null
  br i1 %".93", label %"while_body.1", label %"while_exit.1"
while_body.1:
  %".95" = getelementptr %"PNode", %"PNode"* %"ptr", i32 0, i32 0
  %".96" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".96", %"TNode"** %".95"
  %".98" = load %"PNode", %"PNode"* %"ptr"
  call void @"printNode"(%"PNode" %".98")
  %".100" = load %"TNode"*, %"TNode"** %"current"
  %".101" = getelementptr %"TNode", %"TNode"* %".100", i32 0, i32 0
  %".102" = load %"TNode"*, %"TNode"** %".101"
  store %"TNode"* %".102", %"TNode"** %"current"
  br label %"while_cond.1"
while_exit.1:
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define void @"printNode"(%"PNode" %"node")
{
entry:
  %"node.1" = alloca %"PNode"
  store %"PNode" %"node", %"PNode"* %"node.1"
  %".4" = getelementptr %"PNode", %"PNode"* %"node.1", i32 0, i32 0
  %".5" = load %"TNode"*, %"TNode"** %".4"
  %".6" = getelementptr %"TNode", %"TNode"* %".5", i32 0, i32 1
  %".7" = load i16, i16* %".6"
  %".8" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".8"
  %".10" = getelementptr [4 x i8], [4 x i8]* %".8", i8 0, i8 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i16 %".7")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  ret void
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
define void @"reverse"(%"PNode"* %"head")
{
entry:
  %"prev" = alloca %"TNode"*
  %"current" = alloca %"TNode"*
  %"next" = alloca %"TNode"*
  store %"TNode"* null, %"TNode"** %"prev"
  %".4" = getelementptr %"PNode", %"PNode"* %"head", i32 0, i32 0
  %".5" = load %"TNode"*, %"TNode"** %".4"
  store %"TNode"* %".5", %"TNode"** %"current"
  br label %"while_cond"
while_cond:
  %".8" = load %"TNode"*, %"TNode"** %"current"
  %".9" = icmp ne %"TNode"* %".8", null
  br i1 %".9", label %"while_body", label %"while_exit"
while_body:
  %".11" = load %"TNode"*, %"TNode"** %"current"
  %".12" = getelementptr %"TNode", %"TNode"* %".11", i32 0, i32 0
  %".13" = load %"TNode"*, %"TNode"** %".12"
  store %"TNode"* %".13", %"TNode"** %"next"
  %".15" = load %"TNode"*, %"TNode"** %"current"
  %".16" = getelementptr %"TNode", %"TNode"* %".15", i32 0, i32 0
  %".17" = load %"TNode"*, %"TNode"** %"prev"
  store %"TNode"* %".17", %"TNode"** %".16"
  %".19" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".19", %"TNode"** %"prev"
  %".21" = load %"TNode"*, %"TNode"** %"next"
  store %"TNode"* %".21", %"TNode"** %"current"
  br label %"while_cond"
while_exit:
  %".24" = getelementptr %"PNode", %"PNode"* %"head", i32 0, i32 0
  %".25" = load %"TNode"*, %"TNode"** %"prev"
  store %"TNode"* %".25", %"TNode"** %".24"
  ret void
}

declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()
