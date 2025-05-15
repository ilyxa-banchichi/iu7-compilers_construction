; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TVector3" = type {float, float, float}
%"TAABB" = type {%"TVector3", %"TVector3"}
define void @"main"()
{
entry:
  %"i" = alloca i16
  %"j" = alloca i16
  %"boxes" = alloca [10 x %"TAABB"]
  %"collisionMatrix" = alloca [10 x [10 x i16]]
  %".2" = icmp uge i32 1, 1
  %".3" = icmp ule i32 1, 10
  %".4" = and i1 %".2", %".3"
  br i1 %".4", label %"access_ok", label %"access_fail"
access_ok:
  %".6" = sub i32 1, 1
  %"elem_ptr" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".6"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".8" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  %"TAABB"* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".11" = call %"TVector3" @"Vector3"(float 0x4024000000000000, float 0x4014000000000000, float 0x4024000000000000)
  %".12" = call %"TVector3" @"Vector3"(float 0x3ff0000000000000, float 0x3ff0000000000000, float 0x3ff0000000000000)
  %".13" = call %"TAABB" @"AABB"(%"TVector3" %".11", %"TVector3" %".12")
  store %"TAABB" %".13", %"TAABB"* %"final_elem_ptr"
  %".15" = icmp uge i32 2, 1
  %".16" = icmp ule i32 2, 10
  %".17" = and i1 %".15", %".16"
  br i1 %".17", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".19" = sub i32 2, 1
  %"elem_ptr.1" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".19"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".21" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  %"TAABB"* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".24" = call %"TVector3" @"Vector3"(float              0x0, float              0x0, float              0x0)
  %".25" = call %"TVector3" @"Vector3"(float 0x4000000000000000, float 0x4000000000000000, float 0x4000000000000000)
  %".26" = call %"TAABB" @"AABB"(%"TVector3" %".24", %"TVector3" %".25")
  store %"TAABB" %".26", %"TAABB"* %"final_elem_ptr.1"
  %".28" = icmp uge i32 3, 1
  %".29" = icmp ule i32 3, 10
  %".30" = and i1 %".28", %".29"
  br i1 %".30", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".32" = sub i32 3, 1
  %"elem_ptr.2" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".32"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".34" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  %"TAABB"* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".37" = call %"TVector3" @"Vector3"(float 0x3ff0000000000000, float              0x0, float 0x3ff0000000000000)
  %".38" = call %"TVector3" @"Vector3"(float 0x4000000000000000, float 0x4000000000000000, float 0x4000000000000000)
  %".39" = call %"TAABB" @"AABB"(%"TVector3" %".37", %"TVector3" %".38")
  store %"TAABB" %".39", %"TAABB"* %"final_elem_ptr.2"
  %".41" = icmp uge i32 1, 1
  %".42" = icmp ule i32 1, 10
  %".43" = and i1 %".41", %".42"
  br i1 %".43", label %"access_ok.3", label %"access_fail.3"
access_ok.3:
  %".45" = sub i32 1, 1
  %"elem_ptr.3" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".45"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".47" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  %"TAABB"* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".50" = load %"TAABB", %"TAABB"* %"final_elem_ptr.3"
  call void @"PrintAABB"(%"TAABB" %".50")
  %".52" = alloca [255 x i8]
  store [255 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".52"
  %".54" = getelementptr [255 x i8], [255 x i8]* %".52", i8 0, i8 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".57" = icmp uge i32 2, 1
  %".58" = icmp ule i32 2, 10
  %".59" = and i1 %".57", %".58"
  br i1 %".59", label %"access_ok.4", label %"access_fail.4"
access_ok.4:
  %".61" = sub i32 2, 1
  %"elem_ptr.4" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".61"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".63" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  %"TAABB"* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".66" = load %"TAABB", %"TAABB"* %"final_elem_ptr.4"
  call void @"PrintAABB"(%"TAABB" %".66")
  %".68" = alloca [255 x i8]
  store [255 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".68"
  %".70" = getelementptr [255 x i8], [255 x i8]* %".68", i8 0, i8 0
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".72" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".73" = icmp uge i32 3, 1
  %".74" = icmp ule i32 3, 10
  %".75" = and i1 %".73", %".74"
  br i1 %".75", label %"access_ok.5", label %"access_fail.5"
access_ok.5:
  %".77" = sub i32 3, 1
  %"elem_ptr.5" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i32 %".77"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".79" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  %"TAABB"* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".82" = load %"TAABB", %"TAABB"* %"final_elem_ptr.5"
  call void @"PrintAABB"(%"TAABB" %".82")
  %".84" = alloca [255 x i8]
  store [255 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".84"
  %".86" = getelementptr [255 x i8], [255 x i8]* %".84", i8 0, i8 0
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".86")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".88" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  call void @"FillCollisionMatrix"([10 x [10 x i16]]* %"collisionMatrix", [10 x %"TAABB"]* %"boxes")
  store i16 1, i16* %"i"
  br label %"for_cond.2"
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

define void @"PrintVector3"(%"TVector3" %"a")
{
entry:
  %"a.1" = alloca %"TVector3"
  store %"TVector3" %"a", %"TVector3"* %"a.1"
  %".4" = alloca [255 x i8]
  store [255 x i8] c"(\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".4"
  %".6" = getelementptr [255 x i8], [255 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 0
  %".9" = load float, float* %".8"
  %".10" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".10"
  %".12" = getelementptr [3 x i8], [3 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", float %".9")
  %".14" = alloca [255 x i8]
  store [255 x i8] c", \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".14"
  %".16" = getelementptr [255 x i8], [255 x i8]* %".14", i8 0, i8 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  %".18" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 1
  %".19" = load float, float* %".18"
  %".20" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".20"
  %".22" = getelementptr [3 x i8], [3 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", float %".19")
  %".24" = alloca [255 x i8]
  store [255 x i8] c", \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".24"
  %".26" = getelementptr [255 x i8], [255 x i8]* %".24", i8 0, i8 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26")
  %".28" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 2
  %".29" = load float, float* %".28"
  %".30" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".30"
  %".32" = getelementptr [3 x i8], [3 x i8]* %".30", i8 0, i8 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", float %".29")
  %".34" = alloca [255 x i8]
  store [255 x i8] c")\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".34"
  %".36" = getelementptr [255 x i8], [255 x i8]* %".34", i8 0, i8 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36")
  ret void
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

define void @"PrintAABB"(%"TAABB" %"a")
{
entry:
  %"a.1" = alloca %"TAABB"
  store %"TAABB" %"a", %"TAABB"* %"a.1"
  %".4" = getelementptr %"TAABB", %"TAABB"* %"a.1", i32 0, i32 0
  %".5" = load %"TVector3", %"TVector3"* %".4"
  call void @"PrintVector3"(%"TVector3" %".5")
  %".7" = alloca [255 x i8]
  store [255 x i8] c", \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".7"
  %".9" = getelementptr [255 x i8], [255 x i8]* %".7", i8 0, i8 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9")
  %".11" = getelementptr %"TAABB", %"TAABB"* %"a.1", i32 0, i32 1
  %".12" = load %"TVector3", %"TVector3"* %".11"
  call void @"PrintVector3"(%"TVector3" %".12")
  ret void
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

define i16 @"IntersectAABB"(%"TAABB" %"a", %"TAABB" %"b")
{
entry:
  %"Result" = alloca i16
  %"a.1" = alloca %"TAABB"
  store %"TAABB" %"a", %"TAABB"* %"a.1"
  %"b.1" = alloca %"TAABB"
  store %"TAABB" %"b", %"TAABB"* %"b.1"
  %"temp" = alloca i1
  %".6" = getelementptr %"TAABB", %"TAABB"* %"a.1", i32 0, i32 0
  %".7" = getelementptr %"TVector3", %"TVector3"* %".6", i32 0, i32 0
  %".8" = getelementptr %"TAABB", %"TAABB"* %"b.1", i32 0, i32 1
  %".9" = getelementptr %"TVector3", %"TVector3"* %".8", i32 0, i32 0
  %".10" = load float, float* %".7"
  %".11" = load float, float* %".9"
  %".12" = fcmp ole float %".10", %".11"
  store i1 %".12", i1* %"temp"
  %".14" = load i1, i1* %"temp"
  br i1 %".14", label %"then", label %"else"
then:
  store i16 1, i16* %"Result"
  br label %"end"
else:
  store i16 0, i16* %"Result"
  br label %"end"
end:
  %".20" = load i16, i16* %"Result"
  ret i16 %".20"
}

define void @"FillCollisionMatrix"([10 x [10 x i16]]* %"m", [10 x %"TAABB"]* %"boxes")
{
entry:
  %"i" = alloca i16
  %"j" = alloca i16
  store i16 1, i16* %"i"
  br label %"for_cond"
for_cond:
  %".6" = load i16, i16* %"i"
  %".7" = icmp sle i16 %".6", 10
  br i1 %".7", label %"for_body", label %"for_exit"
for_body:
  store i16 1, i16* %"j"
  br label %"for_cond.1"
for_exit:
  ret void
for_cond.1:
  %".11" = load i16, i16* %"j"
  %".12" = icmp sle i16 %".11", 10
  br i1 %".12", label %"for_body.1", label %"for_exit.1"
for_body.1:
  %".14" = load i16, i16* %"i"
  %".15" = load i16, i16* %"j"
  %".16" = icmp uge i16 %".14", 1
  %".17" = icmp ule i16 %".14", 10
  %".18" = and i1 %".16", %".17"
  %".19" = icmp uge i16 %".15", 1
  %".20" = icmp ule i16 %".15", 10
  %".21" = and i1 %".19", %".20"
  %".22" = and i1 %".18", %".21"
  br i1 %".22", label %"access_ok", label %"access_fail"
for_exit.1:
  %".57" = add i16 %".6", 1
  store i16 %".57", i16* %"i"
  br label %"for_cond"
access_ok:
  %".24" = sub i16 %".14", 1
  %".25" = sub i16 %".15", 1
  %"elem_ptr" = getelementptr [10 x [10 x i16]], [10 x [10 x i16]]* %"m", i32 0, i16 %".24", i16 %".25"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".27" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".30" = load i16, i16* %"i"
  %".31" = icmp uge i16 %".30", 1
  %".32" = icmp ule i16 %".30", 10
  %".33" = and i1 %".31", %".32"
  br i1 %".33", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".35" = sub i16 %".30", 1
  %"elem_ptr.1" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i16 %".35"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".37" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  %"TAABB"* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".40" = load %"TAABB", %"TAABB"* %"final_elem_ptr.1"
  %".41" = load i16, i16* %"j"
  %".42" = icmp uge i16 %".41", 1
  %".43" = icmp ule i16 %".41", 10
  %".44" = and i1 %".42", %".43"
  br i1 %".44", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".46" = sub i16 %".41", 1
  %"elem_ptr.2" = getelementptr [10 x %"TAABB"], [10 x %"TAABB"]* %"boxes", i32 0, i16 %".46"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".48" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  %"TAABB"* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".51" = load %"TAABB", %"TAABB"* %"final_elem_ptr.2"
  %".52" = call i16 @"IntersectAABB"(%"TAABB" %".40", %"TAABB" %".51")
  store i16 %".52", i16* %"final_elem_ptr"
  %".54" = add i16 %".11", 1
  store i16 %".54", i16* %"j"
  br label %"for_cond.1"
for_cond.2:
  %".61" = load i16, i16* %"i"
  %".62" = icmp sle i16 %".61", 10
  br i1 %".62", label %"for_body.2", label %"for_exit.2"
for_body.2:
  store i16 1, i16* %"j"
  br label %"for_cond.3"
for_exit.2:
  ret void
for_cond.3:
  %".66" = load i16, i16* %"j"
  %".67" = icmp sle i16 %".66", 10
  br i1 %".67", label %"for_body.3", label %"for_exit.3"
for_body.3:
  %".69" = add i16 %".66", 1
  store i16 %".69", i16* %"j"
  br label %"for_cond.3"
for_exit.3:
  %".72" = add i16 %".61", 1
  store i16 %".72", i16* %"i"
  br label %"for_cond.2"
}

declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]