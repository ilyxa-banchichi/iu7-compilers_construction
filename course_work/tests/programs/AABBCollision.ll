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
  %".17" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".17"
  %".19" = getelementptr [3 x i8], [3 x i8]* %".17", i8 0, i8 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", float %".16")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".22" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.y = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".22"
  %".24" = getelementptr [255 x i8], [255 x i8]* %".22", i8 0, i8 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24")
  %".26" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".27" = getelementptr %"TVector3", %"TVector3"* %".26", i32 0, i32 1
  %".28" = load float, float* %".27"
  %".29" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".29"
  %".31" = getelementptr [3 x i8], [3 x i8]* %".29", i8 0, i8 0
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", float %".28")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".34" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".35" = getelementptr %"TVector3", %"TVector3"* %".34", i32 0, i32 0
  %".36" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".37" = getelementptr %"TVector3", %"TVector3"* %".36", i32 0, i32 1
  call void @"swap"(float* %".35", float* %".37")
  %".39" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.x = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".39"
  %".41" = getelementptr [255 x i8], [255 x i8]* %".39", i8 0, i8 0
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41")
  %".43" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".44" = getelementptr %"TVector3", %"TVector3"* %".43", i32 0, i32 0
  %".45" = load float, float* %".44"
  %".46" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".46"
  %".48" = getelementptr [3 x i8], [3 x i8]* %".46", i8 0, i8 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", float %".45")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".51" = alloca [255 x i8]
  store [255 x i8] c"Box1.min.y = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".51"
  %".53" = getelementptr [255 x i8], [255 x i8]* %".51", i8 0, i8 0
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53")
  %".55" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".56" = getelementptr %"TVector3", %"TVector3"* %".55", i32 0, i32 1
  %".57" = load float, float* %".56"
  %".58" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".58"
  %".60" = getelementptr [3 x i8], [3 x i8]* %".58", i8 0, i8 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60", float %".57")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".62" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".63" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".64" = getelementptr %"TVector3", %"TVector3"* %".63", i32 0, i32 0
  %".65" = load float, float* %".64"
  %".66" = getelementptr %"TAABB", %"TAABB"* %"Box1", i32 0, i32 0
  %".67" = getelementptr %"TVector3", %"TVector3"* %".66", i32 0, i32 1
  %".68" = load float, float* %".67"
  %".69" = call float @"add_real"(float %".65", float %".68")
  %".70" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".70"
  %".72" = getelementptr [3 x i8], [3 x i8]* %".70", i8 0, i8 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72", float %".69")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
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

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]