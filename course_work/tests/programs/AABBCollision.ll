; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TVector3" = type {float, float, float}
%"TAABB" = type {%"TVector3", %"TVector3"}
define void @"main"()
{
entry:
  %"Box1" = alloca %"TAABB"
  %"Box2" = alloca %"TAABB"
  %".2" = alloca [255 x i8]
  store [255 x i8] c"jopa\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".2"
  %".4" = getelementptr [255 x i8], [255 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define %"TVector3" @"Vector3"(float %"x", float %"y", float %"z")
{
entry:
  %"Result" = alloca %"TVector3"
  %".5" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  store float %"x", float* %".5"
  %".7" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  store float %"y", float* %".7"
  %".9" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  store float %"z", float* %".9"
  ret %"TVector3"* %"Result"
}

define %"TVector3" @"Mul"(%"TVector3" %"a", float %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %".4" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".5" = extractvalue %"TVector3" %"a", 0
  %".6" = fmul float %".5", %"b"
  store float %".6", float* %".4"
  %".8" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".9" = extractvalue %"TVector3" %"a", 1
  %".10" = fmul float %".9", %"b"
  store float %".10", float* %".8"
  %".12" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".13" = extractvalue %"TVector3" %"a", 2
  %".14" = fmul float %".13", %"b"
  store float %".14", float* %".12"
  ret %"TVector3"* %"Result"
}

define %"TVector3" @"Add"(%"TVector3" %"a", %"TVector3" %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %".4" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".5" = extractvalue %"TVector3" %"a", 0
  %".6" = extractvalue %"TVector3" %"b", 0
  %".7" = fadd float %".5", %".6"
  store float %".7", float* %".4"
  %".9" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".10" = extractvalue %"TVector3" %"a", 1
  %".11" = extractvalue %"TVector3" %"b", 1
  %".12" = fadd float %".10", %".11"
  store float %".12", float* %".9"
  %".14" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".15" = extractvalue %"TVector3" %"a", 2
  %".16" = extractvalue %"TVector3" %"b", 2
  %".17" = fadd float %".15", %".16"
  store float %".17", float* %".14"
  ret %"TVector3"* %"Result"
}

define %"TVector3" @"Sub"(%"TVector3" %"a", %"TVector3" %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %".4" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".5" = extractvalue %"TVector3" %"a", 0
  %".6" = extractvalue %"TVector3" %"b", 0
  %".7" = fsub float %".5", %".6"
  store float %".7", float* %".4"
  %".9" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".10" = extractvalue %"TVector3" %"a", 1
  %".11" = extractvalue %"TVector3" %"b", 1
  %".12" = fsub float %".10", %".11"
  store float %".12", float* %".9"
  %".14" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".15" = extractvalue %"TVector3" %"a", 2
  %".16" = extractvalue %"TVector3" %"b", 2
  %".17" = fsub float %".15", %".16"
  store float %".17", float* %".14"
  ret %"TVector3"* %"Result"
}

define %"TAABB" @"AABB"(%"TVector3" %"min", %"TVector3" %"max")
{
entry:
  %"Result" = alloca %"TAABB"
  %".4" = getelementptr %"TAABB", %"TAABB"* %"Result", i32 0, i32 0
  store %"TVector3" %"min", %"TVector3"* %".4"
  %".6" = getelementptr %"TAABB", %"TAABB"* %"Result", i32 0, i32 1
  store %"TVector3" %"max", %"TVector3"* %".6"
  ret %"TAABB"* %"Result"
}
