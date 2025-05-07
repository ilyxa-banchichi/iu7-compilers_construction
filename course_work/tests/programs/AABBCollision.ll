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
  %".2" = call %"TVector3" @"Vector3"(float 0x4024000000000000, float 0x4014000000000000, float 0x4024000000000000)
  %".3" = call %"TVector3" @"Vector3"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %".4" = call %"TAABB" @"AABB"(%"TVector3" %".2", %"TVector3" %".3")
  store %"TAABB" %".4", %"TAABB"* %"Box1"
  %".6" = call %"TVector3" @"Vector3"(float              0x0, float              0x0, float              0x0)
  %".7" = call %"TVector3" @"Vector3"(float 0x4000000000000000, float 0x4000000000000000, float 0x4000000000000000)
  %".8" = call %"TAABB" @"AABB"(%"TVector3" %".6", %"TVector3" %".7")
  store %"TAABB" %".8", %"TAABB"* %"Box2"
  %".10" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.x = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".10"
  %".12" = getelementptr [255 x i8], [255 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  %".14" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".15" = getelementptr %"TVector3", %"TVector3"* %".14", i32 0, i32 0
  %".16" = load float, float* %".15"
  %".17" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".17"
  %".19" = getelementptr [4 x i8], [4 x i8]* %".17", i8 0, i8 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", float %".16")
  %".21" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.y = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".21"
  %".23" = getelementptr [255 x i8], [255 x i8]* %".21", i8 0, i8 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  %".25" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".26" = getelementptr %"TVector3", %"TVector3"* %".25", i32 0, i32 1
  %".27" = load float, float* %".26"
  %".28" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".28"
  %".30" = getelementptr [4 x i8], [4 x i8]* %".28", i8 0, i8 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", float %".27")
  %".32" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".33" = getelementptr %"TVector3", %"TVector3"* %".32", i32 0, i32 0
  %".34" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".35" = getelementptr %"TVector3", %"TVector3"* %".34", i32 0, i32 1
  call void @"swap"(float* %".33", float* %".35")
  %".37" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.x = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".37"
  %".39" = getelementptr [255 x i8], [255 x i8]* %".37", i8 0, i8 0
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39")
  %".41" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".42" = getelementptr %"TVector3", %"TVector3"* %".41", i32 0, i32 0
  %".43" = load float, float* %".42"
  %".44" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".44"
  %".46" = getelementptr [4 x i8], [4 x i8]* %".44", i8 0, i8 0
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".46", float %".43")
  %".48" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.y = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".48"
  %".50" = getelementptr [255 x i8], [255 x i8]* %".48", i8 0, i8 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50")
  %".52" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".53" = getelementptr %"TVector3", %"TVector3"* %".52", i32 0, i32 1
  %".54" = load float, float* %".53"
  %".55" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".55"
  %".57" = getelementptr [4 x i8], [4 x i8]* %".55", i8 0, i8 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", float %".54")
  %".59" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".60" = getelementptr %"TVector3", %"TVector3"* %".59", i32 0, i32 0
  %".61" = load float, float* %".60"
  %".62" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".63" = getelementptr %"TVector3", %"TVector3"* %".62", i32 0, i32 1
  %".64" = load float, float* %".63"
  %".65" = call float @"add_real"(float %".61", float %".64")
  %".66" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".66"
  %".68" = getelementptr [4 x i8], [4 x i8]* %".66", i8 0, i8 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68", float %".65")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define %"TVector3" @"Vector3"(float %"x", float %"y", float %"z")
{
entry:
  %"Result" = alloca %"TVector3"
  %"x.1" = alloca float
  store float %"x", float* %"x.1"
  %"y.1" = alloca float
  store float %"y", float* %"y.1"
  %"z.1" = alloca float
  store float %"z", float* %"z.1"
  %".8" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".9" = load float, float* %"x.1"
  store float %".9", float* %".8"
  %".11" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".12" = load float, float* %"y.1"
  store float %".12", float* %".11"
  %".14" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".15" = load float, float* %"z.1"
  store float %".15", float* %".14"
  %".17" = load %"TVector3", %"TVector3"* %"Result"
  ret %"TVector3" %".17"
}

define %"TVector3" @"Mul"(%"TVector3" %"a", float %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %"a.1" = alloca %"TVector3"
  store %"TVector3" %"a", %"TVector3"* %"a.1"
  %"b.1" = alloca float
  store float %"b", float* %"b.1"
  %".6" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".7" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 0
  %".8" = load float, float* %".7"
  %".9" = load float, float* %"b.1"
  %".10" = fmul float %".8", %".9"
  store float %".10", float* %".6"
  %".12" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".13" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 1
  %".14" = load float, float* %".13"
  %".15" = load float, float* %"b.1"
  %".16" = fmul float %".14", %".15"
  store float %".16", float* %".12"
  %".18" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".19" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 2
  %".20" = load float, float* %".19"
  %".21" = load float, float* %"b.1"
  %".22" = fmul float %".20", %".21"
  store float %".22", float* %".18"
  %".24" = load %"TVector3", %"TVector3"* %"Result"
  ret %"TVector3" %".24"
}

define %"TVector3" @"Add"(%"TVector3" %"a", %"TVector3" %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %"a.1" = alloca %"TVector3"
  store %"TVector3" %"a", %"TVector3"* %"a.1"
  %"b.1" = alloca %"TVector3"
  store %"TVector3" %"b", %"TVector3"* %"b.1"
  %".6" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".7" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 0
  %".8" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 0
  %".9" = load float, float* %".7"
  %".10" = load float, float* %".8"
  %".11" = fadd float %".9", %".10"
  store float %".11", float* %".6"
  %".13" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".14" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 1
  %".15" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 1
  %".16" = load float, float* %".14"
  %".17" = load float, float* %".15"
  %".18" = fadd float %".16", %".17"
  store float %".18", float* %".13"
  %".20" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".21" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 2
  %".22" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 2
  %".23" = load float, float* %".21"
  %".24" = load float, float* %".22"
  %".25" = fadd float %".23", %".24"
  store float %".25", float* %".20"
  %".27" = load %"TVector3", %"TVector3"* %"Result"
  ret %"TVector3" %".27"
}

define %"TVector3" @"Sub"(%"TVector3" %"a", %"TVector3" %"b")
{
entry:
  %"Result" = alloca %"TVector3"
  %"a.1" = alloca %"TVector3"
  store %"TVector3" %"a", %"TVector3"* %"a.1"
  %"b.1" = alloca %"TVector3"
  store %"TVector3" %"b", %"TVector3"* %"b.1"
  %".6" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 0
  %".7" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 0
  %".8" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 0
  %".9" = load float, float* %".7"
  %".10" = load float, float* %".8"
  %".11" = fsub float %".9", %".10"
  store float %".11", float* %".6"
  %".13" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 1
  %".14" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 1
  %".15" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 1
  %".16" = load float, float* %".14"
  %".17" = load float, float* %".15"
  %".18" = fsub float %".16", %".17"
  store float %".18", float* %".13"
  %".20" = getelementptr %"TVector3", %"TVector3"* %"Result", i32 0, i32 2
  %".21" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 2
  %".22" = getelementptr %"TVector3", %"TVector3"* %"b.1", i32 0, i32 2
  %".23" = load float, float* %".21"
  %".24" = load float, float* %".22"
  %".25" = fsub float %".23", %".24"
  store float %".25", float* %".20"
  %".27" = load %"TVector3", %"TVector3"* %"Result"
  ret %"TVector3" %".27"
}

define %"TAABB" @"AABB"(%"TVector3" %"position", %"TVector3" %"size")
{
entry:
  %"Result" = alloca %"TAABB"
  %"position.1" = alloca %"TVector3"
  store %"TVector3" %"position", %"TVector3"* %"position.1"
  %"size.1" = alloca %"TVector3"
  store %"TVector3" %"size", %"TVector3"* %"size.1"
  %"extents" = alloca %"TVector3"
  %".6" = load %"TVector3", %"TVector3"* %"size.1"
  %".7" = call %"TVector3" @"Mul"(%"TVector3" %".6", float 0x3fe0000000000000)
  store %"TVector3" %".7", %"TVector3"* %"extents"
  %".9" = getelementptr %"TAABB", %"TAABB"* %"Result", i32 0, i32 0
  %".10" = load %"TVector3", %"TVector3"* %"position.1"
  %".11" = load %"TVector3", %"TVector3"* %"extents"
  %".12" = call %"TVector3" @"Sub"(%"TVector3" %".10", %"TVector3" %".11")
  store %"TVector3" %".12", %"TVector3"* %".9"
  %".14" = getelementptr %"TAABB", %"TAABB"* %"Result", i32 0, i32 1
  %".15" = load %"TVector3", %"TVector3"* %"position.1"
  %".16" = load %"TVector3", %"TVector3"* %"extents"
  %".17" = call %"TVector3" @"Add"(%"TVector3" %".15", %"TVector3" %".16")
  store %"TVector3" %".17", %"TVector3"* %".14"
  %".19" = load %"TAABB", %"TAABB"* %"Result"
  ret %"TAABB" %".19"
}

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

define float @"add_real"(float %"x", float %"y")
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
