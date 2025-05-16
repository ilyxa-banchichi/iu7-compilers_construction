; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"x" = alloca float
  %"y" = alloca float
  %"i" = alloca i16
  %"c" = alloca i8
  %".2" = sitofp i8 10 to float
  store float %".2", float* %"x"
  %".4" = sitofp i8 5 to float
  store float %".4", float* %"y"
  %".6" = load float, float* %"x"
  %".7" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".7"
  %".9" = getelementptr [3 x i8], [3 x i8]* %".7", i8 0, i8 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", float %".6")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".12" = load float, float* %"y"
  %".13" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".13"
  %".15" = getelementptr [3 x i8], [3 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", float %".12")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  call void @"swap"(float* %"x", float* %"y")
  %".19" = load float, float* %"x"
  %".20" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".20"
  %".22" = getelementptr [3 x i8], [3 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", float %".19")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".25" = load float, float* %"y"
  %".26" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".26"
  %".28" = getelementptr [3 x i8], [3 x i8]* %".26", i8 0, i8 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", float %".25")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".31" = load float, float* %"x"
  %".32" = load float, float* %"y"
  %".33" = call float @"add"(float %".31", float %".32")
  %".34" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".34"
  %".36" = getelementptr [3 x i8], [3 x i8]* %".34", i8 0, i8 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", float %".33")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".39" = load float, float* %"x"
  %".40" = sitofp i8 100 to float
  %".41" = call float @"add"(float %".39", float %".40")
  %".42" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".42"
  %".44" = getelementptr [3 x i8], [3 x i8]* %".42", i8 0, i8 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", float %".41")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define void @"swap"(float* %"x", float* %"y")
{
entry:
  %"temp" = alloca float
  %".4" = load float, float* %"x"
  store float %".4", float* %"temp"
  %".6" = load float, float* %"y"
  store float %".6", float* %"x"
  %".8" = load float, float* %"temp"
  store float %".8", float* %"y"
  ret void
}

define float @"add"(float %"x", float %"y")
{
entry:
  %"Result" = alloca float
  %"x.1" = alloca float
  store float %"x", float* %"x.1"
  %"y.1" = alloca float
  store float %"y", float* %"y.1"
  %".6" = load float, float* %"x.1"
  %".7" = load float, float* %"y.1"
  %".8" = fadd float %".6", %".7"
  store float %".8", float* %"Result"
  %".10" = load float, float* %"Result"
  ret float %".10"
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]