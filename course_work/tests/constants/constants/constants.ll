; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %".2" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".2"
  %".4" = getelementptr [5 x i8], [5 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 3)
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".7" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".7"
  %".9" = getelementptr [4 x i8], [4 x i8]* %".7", i8 0, i8 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i16 -3)
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".12" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".12"
  %".14" = getelementptr [3 x i8], [3 x i8]* %".12", i8 0, i8 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", float 0x40244cccc0000000)
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".17" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".17"
  %".19" = getelementptr [3 x i8], [3 x i8]* %".17", i8 0, i8 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", float 0xc0244cccc0000000)
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".22" = alloca [8 x i8]
  store [8 x i8] c"asdgadg\00", [8 x i8]* %".22"
  %".24" = getelementptr [8 x i8], [8 x i8]* %".22", i8 0, i8 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".27" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".27"
  %".29" = getelementptr [3 x i8], [3 x i8]* %".27", i8 0, i8 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i8 97)
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]