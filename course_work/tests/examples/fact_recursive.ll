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
  %".4" = load i32, i32* %"n.1"
  %".5" = sext i8 1 to i32
  %".6" = icmp eq i32 %".4", %".5"
  br i1 %".6", label %"then", label %"else"
then:
  %".8" = sext i8 1 to i32
  store i32 %".8", i32* %"Result"
  br label %"end"
else:
  %".11" = load i32, i32* %"n.1"
  %".12" = sext i8 1 to i32
  %".13" = sub i32 %".11", %".12"
  %".14" = call i32 @"fact"(i32 %".13")
  %".15" = load i32, i32* %"n.1"
  %".16" = mul i32 %".15", %".14"
  store i32 %".16", i32* %"Result"
  br label %"end"
end:
  %".19" = load i32, i32* %"Result"
  ret i32 %".19"
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]