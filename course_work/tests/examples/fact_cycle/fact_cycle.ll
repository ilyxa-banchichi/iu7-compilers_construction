; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"n" = alloca i32
  %".2" = sext i8 10 to i32
  store i32 %".2", i32* %"n"
  %".4" = load i32, i32* %"n"
  %".5" = call i32 @"fact"(i32 %".4")
  %".6" = alloca [3 x i8]
  store [3 x i8] c"%d\00", [3 x i8]* %".6"
  %".8" = getelementptr [3 x i8], [3 x i8]* %".6", i8 0, i8 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".5")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

define i32 @"fact"(i32 %"n")
{
entry:
  %"Result" = alloca i32
  %"n.1" = alloca i32
  store i32 %"n", i32* %"n.1"
  %".4" = sext i8 1 to i32
  store i32 %".4", i32* %"Result"
  br label %"while_cond"
while_cond:
  %".7" = load i32, i32* %"n.1"
  %".8" = sext i8 1 to i32
  %".9" = icmp sgt i32 %".7", %".8"
  br i1 %".9", label %"while_body", label %"while_exit"
while_body:
  %".11" = load i32, i32* %"Result"
  %".12" = load i32, i32* %"n.1"
  %".13" = mul i32 %".11", %".12"
  store i32 %".13", i32* %"Result"
  %".15" = load i32, i32* %"n.1"
  %".16" = sext i8 1 to i32
  %".17" = sub i32 %".15", %".16"
  store i32 %".17", i32* %"n.1"
  br label %"while_cond"
while_exit:
  %".20" = load i32, i32* %"Result"
  ret i32 %".20"
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]