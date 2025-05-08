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
  store float 0x4024000000000000, float* %"x"
  store float 0x4014000000000000, float* %"y"
  %".4" = load float, float* %"x"
  %".5" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".5"
  %".7" = getelementptr [3 x i8], [3 x i8]* %".5", i8 0, i8 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", float %".4")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".10" = load float, float* %"y"
  %".11" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".11"
  %".13" = getelementptr [3 x i8], [3 x i8]* %".11", i8 0, i8 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", float %".10")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  call void @"swap"(float* %"x", float* %"y")
  %".17" = load float, float* %"x"
  %".18" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".18"
  %".20" = getelementptr [3 x i8], [3 x i8]* %".18", i8 0, i8 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", float %".17")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".22" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".23" = load float, float* %"y"
  %".24" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".24"
  %".26" = getelementptr [3 x i8], [3 x i8]* %".24", i8 0, i8 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", float %".23")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".29" = load float, float* %"x"
  %".30" = load float, float* %"y"
  %".31" = call float @"add"(float %".29", float %".30")
  %".32" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".32"
  %".34" = getelementptr [3 x i8], [3 x i8]* %".32", i8 0, i8 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", float %".31")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".37" = load float, float* %"x"
  %".38" = call float @"add"(float %".37", float 0x4059000000000000)
  %".39" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".39"
  %".41" = getelementptr [3 x i8], [3 x i8]* %".39", i8 0, i8 0
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41", float %".38")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
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