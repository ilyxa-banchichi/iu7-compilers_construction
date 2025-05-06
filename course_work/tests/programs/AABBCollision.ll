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
  %".2" = fsub float              0x0, 0x3ff0000000000000
  %".3" = fsub float              0x0, 0x3ff0000000000000
  %".4" = fsub float              0x0, 0x3ff0000000000000
  %".5" = call %"TVector3" @"Vector3"(float %".2", float %".3", float %".4")
  %".6" = call %"TVector3" @"Vector3"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %".7" = call %"TAABB" @"AABB"(%"TVector3" %".5", %"TVector3" %".6")
  store %"TAABB" %".7", %"TAABB"* %"Box1"
  %".9" = call %"TVector3" @"Vector3"(float              0x0, float              0x0, float              0x0)
  %".10" = call %"TVector3" @"Vector3"(float 0x4000000000000000, float 0x4000000000000000, float 0x4000000000000000)
  %".11" = call %"TAABB" @"AABB"(%"TVector3" %".9", %"TVector3" %".10")
  store %"TAABB" %".11", %"TAABB"* %"Box2"
  %".13" = alloca [255 x i8]
  store [255 x i8] c"Box2\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".13"
  %".15" = getelementptr [255 x i8], [255 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %".17" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 0
  %".18" = getelementptr %"TVector3", %"TVector3"* %".17", i32 0, i32 0
  %".19" = load float, float* %".18"
  %".20" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".20"
  %".22" = getelementptr [4 x i8], [4 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", float %".19")
  %".24" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 0
  %".25" = getelementptr %"TVector3", %"TVector3"* %".24", i32 0, i32 1
  %".26" = load float, float* %".25"
  %".27" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".27"
  %".29" = getelementptr [4 x i8], [4 x i8]* %".27", i8 0, i8 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", float %".26")
  %".31" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 0
  %".32" = getelementptr %"TVector3", %"TVector3"* %".31", i32 0, i32 2
  %".33" = load float, float* %".32"
  %".34" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".34"
  %".36" = getelementptr [4 x i8], [4 x i8]* %".34", i8 0, i8 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", float %".33")
  %".38" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 1
  %".39" = getelementptr %"TVector3", %"TVector3"* %".38", i32 0, i32 0
  %".40" = load float, float* %".39"
  %".41" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".41"
  %".43" = getelementptr [4 x i8], [4 x i8]* %".41", i8 0, i8 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".43", float %".40")
  %".45" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 1
  %".46" = getelementptr %"TVector3", %"TVector3"* %".45", i32 0, i32 1
  %".47" = load float, float* %".46"
  %".48" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".48"
  %".50" = getelementptr [4 x i8], [4 x i8]* %".48", i8 0, i8 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", float %".47")
  %".52" = getelementptr %"TAABB", %"TAABB"* %"Box2", i32 0, i32 1
  %".53" = getelementptr %"TVector3", %"TVector3"* %".52", i32 0, i32 2
  %".54" = load float, float* %".53"
  %".55" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".55"
  %".57" = getelementptr [4 x i8], [4 x i8]* %".55", i8 0, i8 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", float %".54")
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
