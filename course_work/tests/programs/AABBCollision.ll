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
  %"boxes" = alloca [3 x %"TAABB"]
  %"collisionMatrix" = alloca [3 x [3 x i16]]
  %".2" = icmp uge i8 1, 1
  %".3" = icmp ule i8 1, 3
  %".4" = and i1 %".2", %".3"
  br i1 %".4", label %"access_ok", label %"access_fail"
access_ok:
  %".6" = sub i8 1, 1
  %"elem_ptr" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".6"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".8" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  %"TAABB"* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".11" = sitofp i8 10 to float
  %".12" = sitofp i8 5 to float
  %".13" = sitofp i8 10 to float
  %".14" = call %"TVector3" @"Vector3"(float %".11", float %".12", float %".13")
  %".15" = sitofp i8 1 to float
  %".16" = sitofp i8 1 to float
  %".17" = sitofp i8 1 to float
  %".18" = call %"TVector3" @"Vector3"(float %".15", float %".16", float %".17")
  %".19" = call %"TAABB" @"AABB"(%"TVector3" %".14", %"TVector3" %".18")
  store %"TAABB" %".19", %"TAABB"* %"final_elem_ptr"
  %".21" = icmp uge i8 2, 1
  %".22" = icmp ule i8 2, 3
  %".23" = and i1 %".21", %".22"
  br i1 %".23", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".25" = sub i8 2, 1
  %"elem_ptr.1" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".25"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".27" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  %"TAABB"* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".30" = sitofp i8 0 to float
  %".31" = sitofp i8 0 to float
  %".32" = sitofp i8 0 to float
  %".33" = call %"TVector3" @"Vector3"(float %".30", float %".31", float %".32")
  %".34" = sitofp i8 2 to float
  %".35" = sitofp i8 2 to float
  %".36" = sitofp i8 2 to float
  %".37" = call %"TVector3" @"Vector3"(float %".34", float %".35", float %".36")
  %".38" = call %"TAABB" @"AABB"(%"TVector3" %".33", %"TVector3" %".37")
  store %"TAABB" %".38", %"TAABB"* %"final_elem_ptr.1"
  %".40" = icmp uge i8 3, 1
  %".41" = icmp ule i8 3, 3
  %".42" = and i1 %".40", %".41"
  br i1 %".42", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".44" = sub i8 3, 1
  %"elem_ptr.2" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".44"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".46" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  %"TAABB"* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".49" = sitofp i8 1 to float
  %".50" = sitofp i8 0 to float
  %".51" = sitofp i8 1 to float
  %".52" = call %"TVector3" @"Vector3"(float %".49", float %".50", float %".51")
  %".53" = sitofp i8 2 to float
  %".54" = sitofp i8 2 to float
  %".55" = sitofp i8 2 to float
  %".56" = call %"TVector3" @"Vector3"(float %".53", float %".54", float %".55")
  %".57" = call %"TAABB" @"AABB"(%"TVector3" %".52", %"TVector3" %".56")
  store %"TAABB" %".57", %"TAABB"* %"final_elem_ptr.2"
  %".59" = icmp uge i8 1, 1
  %".60" = icmp ule i8 1, 3
  %".61" = and i1 %".59", %".60"
  br i1 %".61", label %"access_ok.3", label %"access_fail.3"
access_ok.3:
  %".63" = sub i8 1, 1
  %"elem_ptr.3" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".63"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".65" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  %"TAABB"* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".68" = load %"TAABB", %"TAABB"* %"final_elem_ptr.3"
  call void @"PrintAABB"(%"TAABB" %".68")
  %".70" = alloca [1 x i8]
  store [1 x i8] c"\00", [1 x i8]* %".70"
  %".72" = getelementptr [1 x i8], [1 x i8]* %".70", i8 0, i8 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".75" = icmp uge i8 2, 1
  %".76" = icmp ule i8 2, 3
  %".77" = and i1 %".75", %".76"
  br i1 %".77", label %"access_ok.4", label %"access_fail.4"
access_ok.4:
  %".79" = sub i8 2, 1
  %"elem_ptr.4" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".79"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".81" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  %"TAABB"* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".84" = load %"TAABB", %"TAABB"* %"final_elem_ptr.4"
  call void @"PrintAABB"(%"TAABB" %".84")
  %".86" = alloca [1 x i8]
  store [1 x i8] c"\00", [1 x i8]* %".86"
  %".88" = getelementptr [1 x i8], [1 x i8]* %".86", i8 0, i8 0
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".88")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".91" = icmp uge i8 3, 1
  %".92" = icmp ule i8 3, 3
  %".93" = and i1 %".91", %".92"
  br i1 %".93", label %"access_ok.5", label %"access_fail.5"
access_ok.5:
  %".95" = sub i8 3, 1
  %"elem_ptr.5" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i8 %".95"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".97" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  %"TAABB"* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".100" = load %"TAABB", %"TAABB"* %"final_elem_ptr.5"
  call void @"PrintAABB"(%"TAABB" %".100")
  %".102" = alloca [1 x i8]
  store [1 x i8] c"\00", [1 x i8]* %".102"
  %".104" = getelementptr [1 x i8], [1 x i8]* %".102", i8 0, i8 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  call void @"FillCollisionMatrix"([3 x [3 x i16]]* %"collisionMatrix", [3 x %"TAABB"]* %"boxes")
  %".108" = sext i8 1 to i16
  store i16 %".108", i16* %"i"
  br label %"for_cond"
for_cond:
  %".111" = load i16, i16* %"i"
  %".112" = icmp sle i16 %".111", 3
  br i1 %".112", label %"for_body", label %"for_exit"
for_body:
  %".114" = sext i8 1 to i16
  store i16 %".114", i16* %"j"
  br label %"for_cond.1"
for_exit:
  ret void
for_cond.1:
  %".117" = load i16, i16* %"j"
  %".118" = icmp sle i16 %".117", 3
  br i1 %".118", label %"for_body.1", label %"for_exit.1"
for_body.1:
  %".120" = alloca [16 x i8]
  store [16 x i8] c"Intersect AABB \00", [16 x i8]* %".120"
  %".122" = getelementptr [16 x i8], [16 x i8]* %".120", i8 0, i8 0
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".122")
  %".124" = load i16, i16* %"i"
  %".125" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".125"
  %".127" = getelementptr [4 x i8], [4 x i8]* %".125", i8 0, i8 0
  %".128" = call i32 (i8*, ...) @"printf"(i8* %".127", i16 %".124")
  %".129" = alloca [5 x i8]
  store [5 x i8] c" vs \00", [5 x i8]* %".129"
  %".131" = getelementptr [5 x i8], [5 x i8]* %".129", i8 0, i8 0
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".131")
  %".133" = load i16, i16* %"j"
  %".134" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".134"
  %".136" = getelementptr [4 x i8], [4 x i8]* %".134", i8 0, i8 0
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", i16 %".133")
  %".138" = alloca [3 x i8]
  store [3 x i8] c": \00", [3 x i8]* %".138"
  %".140" = getelementptr [3 x i8], [3 x i8]* %".138", i8 0, i8 0
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".140")
  %".142" = load i16, i16* %"i"
  %".143" = load i16, i16* %"j"
  %".144" = icmp uge i16 %".142", 1
  %".145" = icmp ule i16 %".142", 3
  %".146" = and i1 %".144", %".145"
  %".147" = icmp uge i16 %".143", 1
  %".148" = icmp ule i16 %".143", 3
  %".149" = and i1 %".147", %".148"
  %".150" = and i1 %".146", %".149"
  br i1 %".150", label %"access_ok.6", label %"access_fail.6"
for_exit.1:
  %".167" = add i16 %".111", 1
  store i16 %".167", i16* %"i"
  br label %"for_cond"
access_ok.6:
  %".152" = sub i16 %".142", 1
  %".153" = sub i16 %".143", 1
  %"elem_ptr.6" = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %"collisionMatrix", i32 0, i16 %".152", i16 %".153"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".155" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  i16* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".158" = load i16, i16* %"final_elem_ptr.6"
  %".159" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".159"
  %".161" = getelementptr [4 x i8], [4 x i8]* %".159", i8 0, i8 0
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".161", i16 %".158")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".163" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".164" = add i16 %".117", 1
  store i16 %".164", i16* %"j"
  br label %"for_cond.1"
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
  %".4" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".4"
  %".6" = getelementptr [3 x i8], [3 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8 40)
  %".8" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 0
  %".9" = load float, float* %".8"
  %".10" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".10"
  %".12" = getelementptr [3 x i8], [3 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", float %".9")
  %".14" = alloca [3 x i8]
  store [3 x i8] c", \00", [3 x i8]* %".14"
  %".16" = getelementptr [3 x i8], [3 x i8]* %".14", i8 0, i8 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  %".18" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 1
  %".19" = load float, float* %".18"
  %".20" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".20"
  %".22" = getelementptr [3 x i8], [3 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", float %".19")
  %".24" = alloca [3 x i8]
  store [3 x i8] c", \00", [3 x i8]* %".24"
  %".26" = getelementptr [3 x i8], [3 x i8]* %".24", i8 0, i8 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26")
  %".28" = getelementptr %"TVector3", %"TVector3"* %"a.1", i32 0, i32 2
  %".29" = load float, float* %".28"
  %".30" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".30"
  %".32" = getelementptr [3 x i8], [3 x i8]* %".30", i8 0, i8 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", float %".29")
  %".34" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".34"
  %".36" = getelementptr [3 x i8], [3 x i8]* %".34", i8 0, i8 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", i8 41)
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
  %".7" = alloca [3 x i8]
  store [3 x i8] c", \00", [3 x i8]* %".7"
  %".9" = getelementptr [3 x i8], [3 x i8]* %".7", i8 0, i8 0
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
  %".16" = sext i8 1 to i16
  store i16 %".16", i16* %"Result"
  br label %"end"
else:
  %".19" = sext i8 0 to i16
  store i16 %".19", i16* %"Result"
  br label %"end"
end:
  %".22" = load i16, i16* %"Result"
  ret i16 %".22"
}

define void @"FillCollisionMatrix"([3 x [3 x i16]]* %"m", [3 x %"TAABB"]* %"boxes")
{
entry:
  %"i" = alloca i16
  %"j" = alloca i16
  %".4" = sext i8 1 to i16
  store i16 %".4", i16* %"i"
  br label %"for_cond"
for_cond:
  %".7" = load i16, i16* %"i"
  %".8" = icmp sle i16 %".7", 3
  br i1 %".8", label %"for_body", label %"for_exit"
for_body:
  %".10" = sext i8 1 to i16
  store i16 %".10", i16* %"j"
  br label %"for_cond.1"
for_exit:
  ret void
for_cond.1:
  %".13" = load i16, i16* %"j"
  %".14" = icmp sle i16 %".13", 3
  br i1 %".14", label %"for_body.1", label %"for_exit.1"
for_body.1:
  %".16" = load i16, i16* %"i"
  %".17" = load i16, i16* %"j"
  %".18" = icmp uge i16 %".16", 1
  %".19" = icmp ule i16 %".16", 3
  %".20" = and i1 %".18", %".19"
  %".21" = icmp uge i16 %".17", 1
  %".22" = icmp ule i16 %".17", 3
  %".23" = and i1 %".21", %".22"
  %".24" = and i1 %".20", %".23"
  br i1 %".24", label %"access_ok", label %"access_fail"
for_exit.1:
  %".59" = add i16 %".7", 1
  store i16 %".59", i16* %"i"
  br label %"for_cond"
access_ok:
  %".26" = sub i16 %".16", 1
  %".27" = sub i16 %".17", 1
  %"elem_ptr" = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %"m", i32 0, i16 %".26", i16 %".27"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".29" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".32" = load i16, i16* %"i"
  %".33" = icmp uge i16 %".32", 1
  %".34" = icmp ule i16 %".32", 3
  %".35" = and i1 %".33", %".34"
  br i1 %".35", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".37" = sub i16 %".32", 1
  %"elem_ptr.1" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i16 %".37"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".39" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  %"TAABB"* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".42" = load %"TAABB", %"TAABB"* %"final_elem_ptr.1"
  %".43" = load i16, i16* %"j"
  %".44" = icmp uge i16 %".43", 1
  %".45" = icmp ule i16 %".43", 3
  %".46" = and i1 %".44", %".45"
  br i1 %".46", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".48" = sub i16 %".43", 1
  %"elem_ptr.2" = getelementptr [3 x %"TAABB"], [3 x %"TAABB"]* %"boxes", i32 0, i16 %".48"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".50" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  %"TAABB"* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".53" = load %"TAABB", %"TAABB"* %"final_elem_ptr.2"
  %".54" = call i16 @"IntersectAABB"(%"TAABB" %".42", %"TAABB" %".53")
  store i16 %".54", i16* %"final_elem_ptr"
  %".56" = add i16 %".13", 1
  store i16 %".56", i16* %"j"
  br label %"for_cond.1"
}

declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]