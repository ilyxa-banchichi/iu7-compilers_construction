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
  store i16 5, i16* %"i"
  %".4" = load float, float* %"x"
  %".5" = call float @"f"(float %".4")
  store float %".5", float* %"y"
  %".7" = load float, float* %"x"
  %".8" = load i16, i16* %"i"
  %".9" = sitofp i16 %".8" to float
  %".10" = call float @"g"(float %".7", float %".9")
  store float %".10", float* %"y"
  %".12" = load i16, i16* %"i"
  %".13" = sitofp i16 %".12" to float
  %".14" = load float, float* %"x"
  %".15" = call float @"g"(float %".13", float %".14")
  call void @"p"(float %".15")
  %".17" = load float, float* %"y"
  %".18" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".18"
  %".20" = getelementptr [4 x i8], [4 x i8]* %".18", i8 0, i8 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", float %".17")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define void @"p"(float %"x")
{
entry:
  %".3" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".3"
  %".5" = getelementptr [4 x i8], [4 x i8]* %".3", i8 0, i8 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", float %"x")
  ret void
}

define float @"f"(float %"x")
{
entry:
  %"Result" = alloca float
  %".3" = fmul float %"x", %"x"
  %".4" = fadd float %".3", 0x3ff0000000000000
  store float %".4", float* %"Result"
  %".6" = load float, float* %"Result"
  ret float %".6"
}

define float @"g"(float %"x", float %"z")
{
entry:
  %"Result" = alloca float
  %".4" = fmul float %"x", %"x"
  %".5" = fmul float 0x4000000000000000, %"z"
  %".6" = fadd float %".4", %".5"
  store float %".6", float* %"Result"
  %".8" = load float, float* %"Result"
  ret float %".8"
}
