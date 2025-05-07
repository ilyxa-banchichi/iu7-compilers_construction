; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"i" = alloca i8
  %"j" = alloca i8
  %"k" = alloca i8
  %"n" = alloca i8
  %"m" = alloca i8
  %"f" = alloca float
  %"a1" = alloca [10 x i16]
  %"ar1" = alloca [10 x float]
  %"ac1" = alloca [10 x i8]
  %"a2" = alloca [10 x [4 x i16]]
  %"ar2" = alloca [10 x [4 x float]]
  %"ac2" = alloca [10 x [4 x i8]]
  store i8 10, i8* %"n"
  store i8 5, i8* %"m"
  %".4" = alloca [255 x i8]
  store [255 x i8] c"Array\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".4"
  %".6" = getelementptr [255 x i8], [255 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = alloca [255 x i8]
  store [255 x i8] c"Int\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".8"
  %".10" = getelementptr [255 x i8], [255 x i8]* %".8", i8 0, i8 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  store i8 1, i8* %"i"
  br label %"for_cond"
for_cond:
  %".14" = load i8, i8* %"i"
  %".15" = load i8, i8* %"n"
  %".16" = icmp sle i8 %".14", %".15"
  br i1 %".16", label %"for_body", label %"for_exit"
for_body:
  %".18" = load i8, i8* %"i"
  %".19" = icmp uge i8 %".18", 1
  %".20" = icmp ule i8 %".18", 10
  %".21" = and i1 %".19", %".20"
  br i1 %".21", label %"access_ok", label %"access_fail"
for_exit:
  store i8 1, i8* %"i"
  br label %"for_cond.1"
access_ok:
  %".23" = sub i8 %".18", 1
  %"elem_ptr" = getelementptr [10 x i16], [10 x i16]* %"a1", i32 0, i8 %".23"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".25" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".28" = load i8, i8* %"i"
  %".29" = sub i8 %".28", 1
  %".30" = sext i8 %".29" to i16
  store i16 %".30", i16* %"final_elem_ptr"
  %".32" = add i8 %".14", 1
  store i8 %".32", i8* %"i"
  br label %"for_cond"
for_cond.1:
  %".37" = load i8, i8* %"i"
  %".38" = load i8, i8* %"n"
  %".39" = icmp sle i8 %".37", %".38"
  br i1 %".39", label %"for_body.1", label %"for_exit.1"
for_body.1:
  %".41" = load i8, i8* %"i"
  %".42" = icmp uge i8 %".41", 1
  %".43" = icmp ule i8 %".41", 10
  %".44" = and i1 %".42", %".43"
  br i1 %".44", label %"access_ok.1", label %"access_fail.1"
for_exit.1:
  %".59" = alloca [255 x i8]
  store [255 x i8] c"Float\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".59"
  %".61" = getelementptr [255 x i8], [255 x i8]* %".59", i8 0, i8 0
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".61")
  store i8 1, i8* %"i"
  br label %"for_cond.2"
access_ok.1:
  %".46" = sub i8 %".41", 1
  %"elem_ptr.1" = getelementptr [10 x i16], [10 x i16]* %"a1", i32 0, i8 %".46"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".48" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  i16* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".51" = load i16, i16* %"final_elem_ptr.1"
  %".52" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".52"
  %".54" = getelementptr [5 x i8], [5 x i8]* %".52", i8 0, i8 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54", i16 %".51")
  %".56" = add i8 %".37", 1
  store i8 %".56", i8* %"i"
  br label %"for_cond.1"
for_cond.2:
  %".65" = load i8, i8* %"i"
  %".66" = load i8, i8* %"n"
  %".67" = icmp sle i8 %".65", %".66"
  br i1 %".67", label %"for_body.2", label %"for_exit.2"
for_body.2:
  %".69" = load i8, i8* %"i"
  %".70" = icmp uge i8 %".69", 1
  %".71" = icmp ule i8 %".69", 10
  %".72" = and i1 %".70", %".71"
  br i1 %".72", label %"access_ok.2", label %"access_fail.2"
for_exit.2:
  store i8 1, i8* %"i"
  br label %"for_cond.3"
access_ok.2:
  %".74" = sub i8 %".69", 1
  %"elem_ptr.2" = getelementptr [10 x float], [10 x float]* %"ar1", i32 0, i8 %".74"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".76" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  float* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".79" = load i8, i8* %"i"
  %".80" = sub i8 %".79", 1
  %".81" = sitofp i8 %".80" to float
  store float %".81", float* %"final_elem_ptr.2"
  %".83" = add i8 %".65", 1
  store i8 %".83", i8* %"i"
  br label %"for_cond.2"
for_cond.3:
  %".88" = load i8, i8* %"i"
  %".89" = load i8, i8* %"n"
  %".90" = icmp sle i8 %".88", %".89"
  br i1 %".90", label %"for_body.3", label %"for_exit.3"
for_body.3:
  %".92" = load i8, i8* %"i"
  %".93" = icmp uge i8 %".92", 1
  %".94" = icmp ule i8 %".92", 10
  %".95" = and i1 %".93", %".94"
  br i1 %".95", label %"access_ok.3", label %"access_fail.3"
for_exit.3:
  %".110" = alloca [255 x i8]
  store [255 x i8] c"Char\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".110"
  %".112" = getelementptr [255 x i8], [255 x i8]* %".110", i8 0, i8 0
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".112")
  store i8 1, i8* %"i"
  br label %"for_cond.4"
access_ok.3:
  %".97" = sub i8 %".92", 1
  %"elem_ptr.3" = getelementptr [10 x float], [10 x float]* %"ar1", i32 0, i8 %".97"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".99" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  float* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".102" = load float, float* %"final_elem_ptr.3"
  %".103" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".103"
  %".105" = getelementptr [4 x i8], [4 x i8]* %".103", i8 0, i8 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", float %".102")
  %".107" = add i8 %".88", 1
  store i8 %".107", i8* %"i"
  br label %"for_cond.3"
for_cond.4:
  %".116" = load i8, i8* %"i"
  %".117" = load i8, i8* %"n"
  %".118" = icmp sle i8 %".116", %".117"
  br i1 %".118", label %"for_body.4", label %"for_exit.4"
for_body.4:
  %".120" = load i8, i8* %"i"
  %".121" = icmp uge i8 %".120", 1
  %".122" = icmp ule i8 %".120", 10
  %".123" = and i1 %".121", %".122"
  br i1 %".123", label %"access_ok.4", label %"access_fail.4"
for_exit.4:
  store i8 1, i8* %"i"
  br label %"for_cond.5"
access_ok.4:
  %".125" = sub i8 %".120", 1
  %"elem_ptr.4" = getelementptr [10 x i8], [10 x i8]* %"ac1", i32 0, i8 %".125"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".127" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  i8* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".130" = load i8, i8* %"i"
  %".131" = add i8 %".130", 60
  store i8 %".131", i8* %"final_elem_ptr.4"
  %".133" = add i8 %".116", 1
  store i8 %".133", i8* %"i"
  br label %"for_cond.4"
for_cond.5:
  %".138" = load i8, i8* %"i"
  %".139" = load i8, i8* %"n"
  %".140" = icmp sle i8 %".138", %".139"
  br i1 %".140", label %"for_body.5", label %"for_exit.5"
for_body.5:
  %".142" = load i8, i8* %"i"
  %".143" = icmp uge i8 %".142", 1
  %".144" = icmp ule i8 %".142", 10
  %".145" = and i1 %".143", %".144"
  br i1 %".145", label %"access_ok.5", label %"access_fail.5"
for_exit.5:
  %".160" = alloca [255 x i8]
  store [255 x i8] c"Matrix\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".160"
  %".162" = getelementptr [255 x i8], [255 x i8]* %".160", i8 0, i8 0
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".162")
  %".164" = alloca [255 x i8]
  store [255 x i8] c"Int\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".164"
  %".166" = getelementptr [255 x i8], [255 x i8]* %".164", i8 0, i8 0
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".166")
  store i8 0, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.6"
access_ok.5:
  %".147" = sub i8 %".142", 1
  %"elem_ptr.5" = getelementptr [10 x i8], [10 x i8]* %"ac1", i32 0, i8 %".147"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".149" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  i8* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".152" = load i8, i8* %"final_elem_ptr.5"
  %".153" = alloca [4 x i8]
  store [4 x i8] c"%c\0a\00", [4 x i8]* %".153"
  %".155" = getelementptr [4 x i8], [4 x i8]* %".153", i8 0, i8 0
  %".156" = call i32 (i8*, ...) @"printf"(i8* %".155", i8 %".152")
  %".157" = add i8 %".138", 1
  store i8 %".157", i8* %"i"
  br label %"for_cond.5"
for_cond.6:
  %".171" = load i8, i8* %"i"
  %".172" = load i8, i8* %"n"
  %".173" = icmp sle i8 %".171", %".172"
  br i1 %".173", label %"for_body.6", label %"for_exit.6"
for_body.6:
  store i8 2, i8* %"j"
  br label %"for_cond.7"
for_exit.6:
  store i8 1, i8* %"i"
  br label %"for_cond.8"
for_cond.7:
  %".177" = load i8, i8* %"j"
  %".178" = load i8, i8* %"m"
  %".179" = icmp sle i8 %".177", %".178"
  br i1 %".179", label %"for_body.7", label %"for_exit.7"
for_body.7:
  %".181" = load i8, i8* %"i"
  %".182" = load i8, i8* %"j"
  %".183" = icmp uge i8 %".181", 1
  %".184" = icmp ule i8 %".181", 10
  %".185" = and i1 %".183", %".184"
  %".186" = icmp uge i8 %".182", 2
  %".187" = icmp ule i8 %".182", 5
  %".188" = and i1 %".186", %".187"
  %".189" = and i1 %".185", %".188"
  br i1 %".189", label %"access_ok.6", label %"access_fail.6"
for_exit.7:
  %".206" = add i8 %".171", 1
  store i8 %".206", i8* %"i"
  br label %"for_cond.6"
access_ok.6:
  %".191" = sub i8 %".181", 1
  %".192" = sub i8 %".182", 2
  %"elem_ptr.6" = getelementptr [10 x [4 x i16]], [10 x [4 x i16]]* %"a2", i32 0, i8 %".191", i8 %".192"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".194" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  i16* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".197" = load i8, i8* %"k"
  %".198" = sext i8 %".197" to i16
  store i16 %".198", i16* %"final_elem_ptr.6"
  %".200" = load i8, i8* %"k"
  %".201" = add i8 %".200", 1
  store i8 %".201", i8* %"k"
  %".203" = add i8 %".177", 1
  store i8 %".203", i8* %"j"
  br label %"for_cond.7"
for_cond.8:
  %".211" = load i8, i8* %"i"
  %".212" = load i8, i8* %"n"
  %".213" = icmp sle i8 %".211", %".212"
  br i1 %".213", label %"for_body.8", label %"for_exit.8"
for_body.8:
  store i8 2, i8* %"j"
  br label %"for_cond.9"
for_exit.8:
  %".248" = alloca [255 x i8]
  store [255 x i8] c"Float\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".248"
  %".250" = getelementptr [255 x i8], [255 x i8]* %".248", i8 0, i8 0
  %".251" = call i32 (i8*, ...) @"printf"(i8* %".250")
  store i8 0, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.10"
for_cond.9:
  %".217" = load i8, i8* %"j"
  %".218" = load i8, i8* %"m"
  %".219" = icmp sle i8 %".217", %".218"
  br i1 %".219", label %"for_body.9", label %"for_exit.9"
for_body.9:
  %".221" = load i8, i8* %"i"
  %".222" = load i8, i8* %"j"
  %".223" = icmp uge i8 %".221", 1
  %".224" = icmp ule i8 %".221", 10
  %".225" = and i1 %".223", %".224"
  %".226" = icmp uge i8 %".222", 2
  %".227" = icmp ule i8 %".222", 5
  %".228" = and i1 %".226", %".227"
  %".229" = and i1 %".225", %".228"
  br i1 %".229", label %"access_ok.7", label %"access_fail.7"
for_exit.9:
  %".245" = add i8 %".211", 1
  store i8 %".245", i8* %"i"
  br label %"for_cond.8"
access_ok.7:
  %".231" = sub i8 %".221", 1
  %".232" = sub i8 %".222", 2
  %"elem_ptr.7" = getelementptr [10 x [4 x i16]], [10 x [4 x i16]]* %"a2", i32 0, i8 %".231", i8 %".232"
  br label %"access_continue.7"
access_fail.7:
  %"out_of_bounds_err_str_ptr.7" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".234" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.7")
  call void @"llvm.trap"()
  br label %"access_continue.7"
access_continue.7:
  %"final_elem_ptr.7" = phi  i16* [%"elem_ptr.7", %"access_ok.7"], [null, %"access_fail.7"]
  %".237" = load i16, i16* %"final_elem_ptr.7"
  %".238" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".238"
  %".240" = getelementptr [5 x i8], [5 x i8]* %".238", i8 0, i8 0
  %".241" = call i32 (i8*, ...) @"printf"(i8* %".240", i16 %".237")
  %".242" = add i8 %".217", 1
  store i8 %".242", i8* %"j"
  br label %"for_cond.9"
for_cond.10:
  %".255" = load i8, i8* %"i"
  %".256" = load i8, i8* %"n"
  %".257" = icmp sle i8 %".255", %".256"
  br i1 %".257", label %"for_body.10", label %"for_exit.10"
for_body.10:
  store i8 2, i8* %"j"
  br label %"for_cond.11"
for_exit.10:
  store i8 1, i8* %"i"
  br label %"for_cond.12"
for_cond.11:
  %".261" = load i8, i8* %"j"
  %".262" = load i8, i8* %"m"
  %".263" = icmp sle i8 %".261", %".262"
  br i1 %".263", label %"for_body.11", label %"for_exit.11"
for_body.11:
  %".265" = load i8, i8* %"i"
  %".266" = load i8, i8* %"j"
  %".267" = icmp uge i8 %".265", 1
  %".268" = icmp ule i8 %".265", 10
  %".269" = and i1 %".267", %".268"
  %".270" = icmp uge i8 %".266", 2
  %".271" = icmp ule i8 %".266", 5
  %".272" = and i1 %".270", %".271"
  %".273" = and i1 %".269", %".272"
  br i1 %".273", label %"access_ok.8", label %"access_fail.8"
for_exit.11:
  %".290" = add i8 %".255", 1
  store i8 %".290", i8* %"i"
  br label %"for_cond.10"
access_ok.8:
  %".275" = sub i8 %".265", 1
  %".276" = sub i8 %".266", 2
  %"elem_ptr.8" = getelementptr [10 x [4 x float]], [10 x [4 x float]]* %"ar2", i32 0, i8 %".275", i8 %".276"
  br label %"access_continue.8"
access_fail.8:
  %"out_of_bounds_err_str_ptr.8" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".278" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.8")
  call void @"llvm.trap"()
  br label %"access_continue.8"
access_continue.8:
  %"final_elem_ptr.8" = phi  float* [%"elem_ptr.8", %"access_ok.8"], [null, %"access_fail.8"]
  %".281" = load i8, i8* %"k"
  %".282" = sitofp i8 %".281" to float
  store float %".282", float* %"final_elem_ptr.8"
  %".284" = load i8, i8* %"k"
  %".285" = add i8 %".284", 1
  store i8 %".285", i8* %"k"
  %".287" = add i8 %".261", 1
  store i8 %".287", i8* %"j"
  br label %"for_cond.11"
for_cond.12:
  %".295" = load i8, i8* %"i"
  %".296" = load i8, i8* %"n"
  %".297" = icmp sle i8 %".295", %".296"
  br i1 %".297", label %"for_body.12", label %"for_exit.12"
for_body.12:
  store i8 2, i8* %"j"
  br label %"for_cond.13"
for_exit.12:
  %".332" = alloca [255 x i8]
  store [255 x i8] c"Char\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".332"
  %".334" = getelementptr [255 x i8], [255 x i8]* %".332", i8 0, i8 0
  %".335" = call i32 (i8*, ...) @"printf"(i8* %".334")
  store i8 60, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.14"
for_cond.13:
  %".301" = load i8, i8* %"j"
  %".302" = load i8, i8* %"m"
  %".303" = icmp sle i8 %".301", %".302"
  br i1 %".303", label %"for_body.13", label %"for_exit.13"
for_body.13:
  %".305" = load i8, i8* %"i"
  %".306" = load i8, i8* %"j"
  %".307" = icmp uge i8 %".305", 1
  %".308" = icmp ule i8 %".305", 10
  %".309" = and i1 %".307", %".308"
  %".310" = icmp uge i8 %".306", 2
  %".311" = icmp ule i8 %".306", 5
  %".312" = and i1 %".310", %".311"
  %".313" = and i1 %".309", %".312"
  br i1 %".313", label %"access_ok.9", label %"access_fail.9"
for_exit.13:
  %".329" = add i8 %".295", 1
  store i8 %".329", i8* %"i"
  br label %"for_cond.12"
access_ok.9:
  %".315" = sub i8 %".305", 1
  %".316" = sub i8 %".306", 2
  %"elem_ptr.9" = getelementptr [10 x [4 x float]], [10 x [4 x float]]* %"ar2", i32 0, i8 %".315", i8 %".316"
  br label %"access_continue.9"
access_fail.9:
  %"out_of_bounds_err_str_ptr.9" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".318" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.9")
  call void @"llvm.trap"()
  br label %"access_continue.9"
access_continue.9:
  %"final_elem_ptr.9" = phi  float* [%"elem_ptr.9", %"access_ok.9"], [null, %"access_fail.9"]
  %".321" = load float, float* %"final_elem_ptr.9"
  %".322" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".322"
  %".324" = getelementptr [4 x i8], [4 x i8]* %".322", i8 0, i8 0
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".324", float %".321")
  %".326" = add i8 %".301", 1
  store i8 %".326", i8* %"j"
  br label %"for_cond.13"
for_cond.14:
  %".339" = load i8, i8* %"i"
  %".340" = load i8, i8* %"n"
  %".341" = icmp sle i8 %".339", %".340"
  br i1 %".341", label %"for_body.14", label %"for_exit.14"
for_body.14:
  store i8 2, i8* %"j"
  br label %"for_cond.15"
for_exit.14:
  store i8 1, i8* %"i"
  br label %"for_cond.16"
for_cond.15:
  %".345" = load i8, i8* %"j"
  %".346" = load i8, i8* %"m"
  %".347" = icmp sle i8 %".345", %".346"
  br i1 %".347", label %"for_body.15", label %"for_exit.15"
for_body.15:
  %".349" = load i8, i8* %"i"
  %".350" = load i8, i8* %"j"
  %".351" = icmp uge i8 %".349", 1
  %".352" = icmp ule i8 %".349", 10
  %".353" = and i1 %".351", %".352"
  %".354" = icmp uge i8 %".350", 2
  %".355" = icmp ule i8 %".350", 5
  %".356" = and i1 %".354", %".355"
  %".357" = and i1 %".353", %".356"
  br i1 %".357", label %"access_ok.10", label %"access_fail.10"
for_exit.15:
  %".373" = add i8 %".339", 1
  store i8 %".373", i8* %"i"
  br label %"for_cond.14"
access_ok.10:
  %".359" = sub i8 %".349", 1
  %".360" = sub i8 %".350", 2
  %"elem_ptr.10" = getelementptr [10 x [4 x i8]], [10 x [4 x i8]]* %"ac2", i32 0, i8 %".359", i8 %".360"
  br label %"access_continue.10"
access_fail.10:
  %"out_of_bounds_err_str_ptr.10" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".362" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.10")
  call void @"llvm.trap"()
  br label %"access_continue.10"
access_continue.10:
  %"final_elem_ptr.10" = phi  i8* [%"elem_ptr.10", %"access_ok.10"], [null, %"access_fail.10"]
  %".365" = load i8, i8* %"k"
  store i8 %".365", i8* %"final_elem_ptr.10"
  %".367" = load i8, i8* %"k"
  %".368" = add i8 %".367", 1
  store i8 %".368", i8* %"k"
  %".370" = add i8 %".345", 1
  store i8 %".370", i8* %"j"
  br label %"for_cond.15"
for_cond.16:
  %".378" = load i8, i8* %"i"
  %".379" = load i8, i8* %"n"
  %".380" = icmp sle i8 %".378", %".379"
  br i1 %".380", label %"for_body.16", label %"for_exit.16"
for_body.16:
  store i8 2, i8* %"j"
  br label %"for_cond.17"
for_exit.16:
  ret void
for_cond.17:
  %".384" = load i8, i8* %"j"
  %".385" = load i8, i8* %"m"
  %".386" = icmp sle i8 %".384", %".385"
  br i1 %".386", label %"for_body.17", label %"for_exit.17"
for_body.17:
  %".388" = load i8, i8* %"i"
  %".389" = load i8, i8* %"j"
  %".390" = icmp uge i8 %".388", 1
  %".391" = icmp ule i8 %".388", 10
  %".392" = and i1 %".390", %".391"
  %".393" = icmp uge i8 %".389", 2
  %".394" = icmp ule i8 %".389", 5
  %".395" = and i1 %".393", %".394"
  %".396" = and i1 %".392", %".395"
  br i1 %".396", label %"access_ok.11", label %"access_fail.11"
for_exit.17:
  %".412" = add i8 %".378", 1
  store i8 %".412", i8* %"i"
  br label %"for_cond.16"
access_ok.11:
  %".398" = sub i8 %".388", 1
  %".399" = sub i8 %".389", 2
  %"elem_ptr.11" = getelementptr [10 x [4 x i8]], [10 x [4 x i8]]* %"ac2", i32 0, i8 %".398", i8 %".399"
  br label %"access_continue.11"
access_fail.11:
  %"out_of_bounds_err_str_ptr.11" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".401" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.11")
  call void @"llvm.trap"()
  br label %"access_continue.11"
access_continue.11:
  %"final_elem_ptr.11" = phi  i8* [%"elem_ptr.11", %"access_ok.11"], [null, %"access_fail.11"]
  %".404" = load i8, i8* %"final_elem_ptr.11"
  %".405" = alloca [4 x i8]
  store [4 x i8] c"%c\0a\00", [4 x i8]* %".405"
  %".407" = getelementptr [4 x i8], [4 x i8]* %".405", i8 0, i8 0
  %".408" = call i32 (i8*, ...) @"printf"(i8* %".407", i8 %".404")
  %".409" = add i8 %".384", 1
  store i8 %".409", i8* %"j"
  br label %"for_cond.17"
}

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()
