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
  %".5" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".5"
  %".7" = getelementptr [4 x i8], [4 x i8]* %".5", i8 0, i8 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", float %".4")
  %".9" = load float, float* %"y"
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", float %".9")
  call void @"swap"(float* %"x", float* %"y")
  %".15" = load float, float* %"x"
  %".16" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".16"
  %".18" = getelementptr [4 x i8], [4 x i8]* %".16", i8 0, i8 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", float %".15")
  %".20" = load float, float* %"y"
  %".21" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".21"
  %".23" = getelementptr [4 x i8], [4 x i8]* %".21", i8 0, i8 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", float %".20")
  %".25" = load float, float* %"x"
  %".26" = load float, float* %"y"
  %".27" = call float @"add"(float %".25", float %".26")
  %".28" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".28"
  %".30" = getelementptr [4 x i8], [4 x i8]* %".28", i8 0, i8 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", float %".27")
  %".32" = load float, float* %"x"
  %".33" = call float @"add"(float %".32", float 0x4059000000000000)
  %".34" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".34"
  %".36" = getelementptr [4 x i8], [4 x i8]* %".34", i8 0, i8 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", float %".33")
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
