; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"floatVar" = alloca float
  %"resVar" = alloca i1
  store i16 5, i16* %"intVar"
  store float 0x40243f2e40000000, float* %"floatVar"
  %".4" = load i16, i16* %"intVar"
  %".5" = load float, float* %"floatVar"
  %".6" = sitofp i16 %".4" to float
  %".7" = fmul float %".6", %".5"
  store float %".7", float* %"floatVar"
  %".9" = load float, float* %"floatVar"
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", float %".9")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)
