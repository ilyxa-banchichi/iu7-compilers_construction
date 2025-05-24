; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"i" = alloca i16
  %".2" = sext i8 0 to i16
  store i16 %".2", i16* %"i"
  br label %"for_cond"
for_cond:
  %".5" = load i16, i16* %"i"
  %".6" = icmp sle i16 %".5", 10
  br i1 %".6", label %"for_body", label %"for_exit"
for_body:
  %".8" = load i16, i16* %"i"
  %".9" = call i16 @"Fibonacci"(i16 %".8")
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i16 %".9")
  %".14" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".14"
  %".16" = getelementptr [3 x i8], [3 x i8]* %".14", i8 0, i8 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i8 32)
  %".18" = add i16 %".5", 1
  store i16 %".18", i16* %"i"
  br label %"for_cond"
for_exit:
  %".21" = alloca [1 x i8]
  store [1 x i8] c"\00", [1 x i8]* %".21"
  %".23" = getelementptr [1 x i8], [1 x i8]* %".21", i8 0, i8 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define i16 @"Fibonacci"(i16 %"n")
{
entry:
  %"Result" = alloca i16
  %"n.1" = alloca i16
  store i16 %"n", i16* %"n.1"
  %".4" = load i16, i16* %"n.1"
  %".5" = sext i8 0 to i16
  %".6" = icmp eq i16 %".4", %".5"
  br i1 %".6", label %"then", label %"else"
then:
  %".8" = sext i8 0 to i16
  store i16 %".8", i16* %"Result"
  br label %"end"
else:
  %".11" = load i16, i16* %"n.1"
  %".12" = sext i8 1 to i16
  %".13" = icmp eq i16 %".11", %".12"
  br i1 %".13", label %"then.1", label %"else.1"
end:
  %".30" = load i16, i16* %"Result"
  ret i16 %".30"
then.1:
  %".15" = sext i8 1 to i16
  store i16 %".15", i16* %"Result"
  br label %"end.1"
else.1:
  %".18" = load i16, i16* %"n.1"
  %".19" = sext i8 1 to i16
  %".20" = sub i16 %".18", %".19"
  %".21" = call i16 @"Fibonacci"(i16 %".20")
  %".22" = load i16, i16* %"n.1"
  %".23" = sext i8 2 to i16
  %".24" = sub i16 %".22", %".23"
  %".25" = call i16 @"Fibonacci"(i16 %".24")
  %".26" = add i16 %".21", %".25"
  store i16 %".26", i16* %"Result"
  br label %"end.1"
end.1:
  br label %"end"
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]