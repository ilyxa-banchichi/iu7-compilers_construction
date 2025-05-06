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
  %".5" = load float, float* %"y"
  call void @"swap"(float %".4", float %".5")
  %".7" = load float, float* %"x"
  %".8" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".8"
  %".10" = getelementptr [4 x i8], [4 x i8]* %".8", i8 0, i8 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", float %".7")
  %".12" = load float, float* %"y"
  %".13" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".13"
  %".15" = getelementptr [4 x i8], [4 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", float %".12")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define float @"f"(float %"x")
{
entry:
  %"Result" = alloca float
  %"x.1" = alloca float
  store float %"x", float* %"x.1"
  %".4" = load float, float* %"x.1"
  %".5" = load float, float* %"x.1"
  %".6" = fmul float %".4", %".5"
  %".7" = fadd float %".6", 0x3ff0000000000000
  store float %".7", float* %"Result"
  %".9" = load float, float* %"Result"
  ret float %".9"
}

define float @"g"(float %"x", float %"z")
{
entry:
  %"Result" = alloca float
  %"x.1" = alloca float
  store float %"x", float* %"x.1"
  %"z.1" = alloca float
  store float %"z", float* %"z.1"
  %".6" = load float, float* %"x.1"
  %".7" = load float, float* %"x.1"
  %".8" = fmul float %".6", %".7"
  %".9" = load float, float* %"z.1"
  %".10" = fmul float 0x4000000000000000, %".9"
  %".11" = fadd float %".8", %".10"
  store float %".11", float* %"Result"
  %".13" = load float, float* %"Result"
  ret float %".13"
}

define void @"swap"(float %"x", float %"y")
{
entry:
  %"x.1" = alloca float
  store float %"x", float* %"x.1"
  %"y.1" = alloca float
  store float %"y", float* %"y.1"
  %"temp" = alloca float
  %".6" = load float, float* %"x.1"
  store float %".6", float* %"temp"
  %".8" = load float, float* %"y.1"
  store float %".8", float* %"x.1"
  %".10" = load float, float* %"x.1"
  store float %".10", float* %"y.1"
  ret void
}
