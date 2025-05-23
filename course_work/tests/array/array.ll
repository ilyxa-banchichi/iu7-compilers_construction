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
  %".4" = alloca [6 x i8]
  store [6 x i8] c"Array\00", [6 x i8]* %".4"
  %".6" = getelementptr [6 x i8], [6 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".9" = alloca [4 x i8]
  store [4 x i8] c"Int\00", [4 x i8]* %".9"
  %".11" = getelementptr [4 x i8], [4 x i8]* %".9", i8 0, i8 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  store i8 1, i8* %"i"
  br label %"for_cond"
for_cond:
  %".16" = load i8, i8* %"i"
  %".17" = load i8, i8* %"n"
  %".18" = icmp sle i8 %".16", %".17"
  br i1 %".18", label %"for_body", label %"for_exit"
for_body:
  %".20" = load i8, i8* %"i"
  %".21" = icmp uge i8 %".20", 1
  %".22" = icmp ule i8 %".20", 10
  %".23" = and i1 %".21", %".22"
  br i1 %".23", label %"access_ok", label %"access_fail"
for_exit:
  store i8 1, i8* %"i"
  br label %"for_cond.1"
access_ok:
  %".25" = sub i8 %".20", 1
  %"elem_ptr" = getelementptr [10 x i16], [10 x i16]* %"a1", i32 0, i8 %".25"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".27" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".30" = load i8, i8* %"i"
  %".31" = sub i8 %".30", 1
  %".32" = sext i8 %".31" to i16
  store i16 %".32", i16* %"final_elem_ptr"
  %".34" = add i8 %".16", 1
  store i8 %".34", i8* %"i"
  br label %"for_cond"
for_cond.1:
  %".39" = load i8, i8* %"i"
  %".40" = load i8, i8* %"n"
  %".41" = icmp sle i8 %".39", %".40"
  br i1 %".41", label %"for_body.1", label %"for_exit.1"
for_body.1:
  %".43" = load i8, i8* %"i"
  %".44" = icmp uge i8 %".43", 1
  %".45" = icmp ule i8 %".43", 10
  %".46" = and i1 %".44", %".45"
  br i1 %".46", label %"access_ok.1", label %"access_fail.1"
for_exit.1:
  %".62" = alloca [6 x i8]
  store [6 x i8] c"Float\00", [6 x i8]* %".62"
  %".64" = getelementptr [6 x i8], [6 x i8]* %".62", i8 0, i8 0
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".64")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  store i8 1, i8* %"i"
  br label %"for_cond.2"
access_ok.1:
  %".48" = sub i8 %".43", 1
  %"elem_ptr.1" = getelementptr [10 x i16], [10 x i16]* %"a1", i32 0, i8 %".48"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".50" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  i16* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".53" = load i16, i16* %"final_elem_ptr.1"
  %".54" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".54"
  %".56" = getelementptr [4 x i8], [4 x i8]* %".54", i8 0, i8 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", i16 %".53")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".59" = add i8 %".39", 1
  store i8 %".59", i8* %"i"
  br label %"for_cond.1"
for_cond.2:
  %".69" = load i8, i8* %"i"
  %".70" = load i8, i8* %"n"
  %".71" = icmp sle i8 %".69", %".70"
  br i1 %".71", label %"for_body.2", label %"for_exit.2"
for_body.2:
  %".73" = load i8, i8* %"i"
  %".74" = icmp uge i8 %".73", 1
  %".75" = icmp ule i8 %".73", 10
  %".76" = and i1 %".74", %".75"
  br i1 %".76", label %"access_ok.2", label %"access_fail.2"
for_exit.2:
  store i8 1, i8* %"i"
  br label %"for_cond.3"
access_ok.2:
  %".78" = sub i8 %".73", 1
  %"elem_ptr.2" = getelementptr [10 x float], [10 x float]* %"ar1", i32 0, i8 %".78"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".80" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  float* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".83" = load i8, i8* %"i"
  %".84" = sub i8 %".83", 1
  %".85" = sitofp i8 %".84" to float
  store float %".85", float* %"final_elem_ptr.2"
  %".87" = add i8 %".69", 1
  store i8 %".87", i8* %"i"
  br label %"for_cond.2"
for_cond.3:
  %".92" = load i8, i8* %"i"
  %".93" = load i8, i8* %"n"
  %".94" = icmp sle i8 %".92", %".93"
  br i1 %".94", label %"for_body.3", label %"for_exit.3"
for_body.3:
  %".96" = load i8, i8* %"i"
  %".97" = icmp uge i8 %".96", 1
  %".98" = icmp ule i8 %".96", 10
  %".99" = and i1 %".97", %".98"
  br i1 %".99", label %"access_ok.3", label %"access_fail.3"
for_exit.3:
  %".115" = alloca [6 x i8]
  store [6 x i8] c"Char\0a\00", [6 x i8]* %".115"
  %".117" = getelementptr [6 x i8], [6 x i8]* %".115", i8 0, i8 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %".117")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".119" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  store i8 1, i8* %"i"
  br label %"for_cond.4"
access_ok.3:
  %".101" = sub i8 %".96", 1
  %"elem_ptr.3" = getelementptr [10 x float], [10 x float]* %"ar1", i32 0, i8 %".101"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".103" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  float* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".106" = load float, float* %"final_elem_ptr.3"
  %".107" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".107"
  %".109" = getelementptr [3 x i8], [3 x i8]* %".107", i8 0, i8 0
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".109", float %".106")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".112" = add i8 %".92", 1
  store i8 %".112", i8* %"i"
  br label %"for_cond.3"
for_cond.4:
  %".122" = load i8, i8* %"i"
  %".123" = load i8, i8* %"n"
  %".124" = icmp sle i8 %".122", %".123"
  br i1 %".124", label %"for_body.4", label %"for_exit.4"
for_body.4:
  %".126" = load i8, i8* %"i"
  %".127" = icmp uge i8 %".126", 1
  %".128" = icmp ule i8 %".126", 10
  %".129" = and i1 %".127", %".128"
  br i1 %".129", label %"access_ok.4", label %"access_fail.4"
for_exit.4:
  store i8 1, i8* %"i"
  br label %"for_cond.5"
access_ok.4:
  %".131" = sub i8 %".126", 1
  %"elem_ptr.4" = getelementptr [10 x i8], [10 x i8]* %"ac1", i32 0, i8 %".131"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".133" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  i8* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".136" = load i8, i8* %"i"
  %".137" = add i8 %".136", 60
  store i8 %".137", i8* %"final_elem_ptr.4"
  %".139" = add i8 %".122", 1
  store i8 %".139", i8* %"i"
  br label %"for_cond.4"
for_cond.5:
  %".144" = load i8, i8* %"i"
  %".145" = load i8, i8* %"n"
  %".146" = icmp sle i8 %".144", %".145"
  br i1 %".146", label %"for_body.5", label %"for_exit.5"
for_body.5:
  %".148" = load i8, i8* %"i"
  %".149" = icmp uge i8 %".148", 1
  %".150" = icmp ule i8 %".148", 10
  %".151" = and i1 %".149", %".150"
  br i1 %".151", label %"access_ok.5", label %"access_fail.5"
for_exit.5:
  %".167" = alloca [7 x i8]
  store [7 x i8] c"Matrix\00", [7 x i8]* %".167"
  %".169" = getelementptr [7 x i8], [7 x i8]* %".167", i8 0, i8 0
  %".170" = call i32 (i8*, ...) @"printf"(i8* %".169")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".171" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".172" = alloca [4 x i8]
  store [4 x i8] c"Int\00", [4 x i8]* %".172"
  %".174" = getelementptr [4 x i8], [4 x i8]* %".172", i8 0, i8 0
  %".175" = call i32 (i8*, ...) @"printf"(i8* %".174")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".176" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  store i8 0, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.6"
access_ok.5:
  %".153" = sub i8 %".148", 1
  %"elem_ptr.5" = getelementptr [10 x i8], [10 x i8]* %"ac1", i32 0, i8 %".153"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".155" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  i8* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".158" = load i8, i8* %"final_elem_ptr.5"
  %".159" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".159"
  %".161" = getelementptr [3 x i8], [3 x i8]* %".159", i8 0, i8 0
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".161", i8 %".158")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".163" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".164" = add i8 %".144", 1
  store i8 %".164", i8* %"i"
  br label %"for_cond.5"
for_cond.6:
  %".180" = load i8, i8* %"i"
  %".181" = load i8, i8* %"n"
  %".182" = icmp sle i8 %".180", %".181"
  br i1 %".182", label %"for_body.6", label %"for_exit.6"
for_body.6:
  store i8 2, i8* %"j"
  br label %"for_cond.7"
for_exit.6:
  store i8 1, i8* %"i"
  br label %"for_cond.8"
for_cond.7:
  %".186" = load i8, i8* %"j"
  %".187" = load i8, i8* %"m"
  %".188" = icmp sle i8 %".186", %".187"
  br i1 %".188", label %"for_body.7", label %"for_exit.7"
for_body.7:
  %".190" = load i8, i8* %"i"
  %".191" = load i8, i8* %"j"
  %".192" = icmp uge i8 %".190", 1
  %".193" = icmp ule i8 %".190", 10
  %".194" = and i1 %".192", %".193"
  %".195" = icmp uge i8 %".191", 2
  %".196" = icmp ule i8 %".191", 5
  %".197" = and i1 %".195", %".196"
  %".198" = and i1 %".194", %".197"
  br i1 %".198", label %"access_ok.6", label %"access_fail.6"
for_exit.7:
  %".215" = add i8 %".180", 1
  store i8 %".215", i8* %"i"
  br label %"for_cond.6"
access_ok.6:
  %".200" = sub i8 %".190", 1
  %".201" = sub i8 %".191", 2
  %"elem_ptr.6" = getelementptr [10 x [4 x i16]], [10 x [4 x i16]]* %"a2", i32 0, i8 %".200", i8 %".201"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".203" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  i16* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".206" = load i8, i8* %"k"
  %".207" = sext i8 %".206" to i16
  store i16 %".207", i16* %"final_elem_ptr.6"
  %".209" = load i8, i8* %"k"
  %".210" = add i8 %".209", 1
  store i8 %".210", i8* %"k"
  %".212" = add i8 %".186", 1
  store i8 %".212", i8* %"j"
  br label %"for_cond.7"
for_cond.8:
  %".220" = load i8, i8* %"i"
  %".221" = load i8, i8* %"n"
  %".222" = icmp sle i8 %".220", %".221"
  br i1 %".222", label %"for_body.8", label %"for_exit.8"
for_body.8:
  store i8 2, i8* %"j"
  br label %"for_cond.9"
for_exit.8:
  %".258" = alloca [6 x i8]
  store [6 x i8] c"Float\00", [6 x i8]* %".258"
  %".260" = getelementptr [6 x i8], [6 x i8]* %".258", i8 0, i8 0
  %".261" = call i32 (i8*, ...) @"printf"(i8* %".260")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".262" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  store i8 0, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.10"
for_cond.9:
  %".226" = load i8, i8* %"j"
  %".227" = load i8, i8* %"m"
  %".228" = icmp sle i8 %".226", %".227"
  br i1 %".228", label %"for_body.9", label %"for_exit.9"
for_body.9:
  %".230" = load i8, i8* %"i"
  %".231" = load i8, i8* %"j"
  %".232" = icmp uge i8 %".230", 1
  %".233" = icmp ule i8 %".230", 10
  %".234" = and i1 %".232", %".233"
  %".235" = icmp uge i8 %".231", 2
  %".236" = icmp ule i8 %".231", 5
  %".237" = and i1 %".235", %".236"
  %".238" = and i1 %".234", %".237"
  br i1 %".238", label %"access_ok.7", label %"access_fail.7"
for_exit.9:
  %".255" = add i8 %".220", 1
  store i8 %".255", i8* %"i"
  br label %"for_cond.8"
access_ok.7:
  %".240" = sub i8 %".230", 1
  %".241" = sub i8 %".231", 2
  %"elem_ptr.7" = getelementptr [10 x [4 x i16]], [10 x [4 x i16]]* %"a2", i32 0, i8 %".240", i8 %".241"
  br label %"access_continue.7"
access_fail.7:
  %"out_of_bounds_err_str_ptr.7" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".243" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.7")
  call void @"llvm.trap"()
  br label %"access_continue.7"
access_continue.7:
  %"final_elem_ptr.7" = phi  i16* [%"elem_ptr.7", %"access_ok.7"], [null, %"access_fail.7"]
  %".246" = load i16, i16* %"final_elem_ptr.7"
  %".247" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".247"
  %".249" = getelementptr [4 x i8], [4 x i8]* %".247", i8 0, i8 0
  %".250" = call i32 (i8*, ...) @"printf"(i8* %".249", i16 %".246")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".251" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".252" = add i8 %".226", 1
  store i8 %".252", i8* %"j"
  br label %"for_cond.9"
for_cond.10:
  %".266" = load i8, i8* %"i"
  %".267" = load i8, i8* %"n"
  %".268" = icmp sle i8 %".266", %".267"
  br i1 %".268", label %"for_body.10", label %"for_exit.10"
for_body.10:
  store i8 2, i8* %"j"
  br label %"for_cond.11"
for_exit.10:
  store i8 1, i8* %"i"
  br label %"for_cond.12"
for_cond.11:
  %".272" = load i8, i8* %"j"
  %".273" = load i8, i8* %"m"
  %".274" = icmp sle i8 %".272", %".273"
  br i1 %".274", label %"for_body.11", label %"for_exit.11"
for_body.11:
  %".276" = load i8, i8* %"i"
  %".277" = load i8, i8* %"j"
  %".278" = icmp uge i8 %".276", 1
  %".279" = icmp ule i8 %".276", 10
  %".280" = and i1 %".278", %".279"
  %".281" = icmp uge i8 %".277", 2
  %".282" = icmp ule i8 %".277", 5
  %".283" = and i1 %".281", %".282"
  %".284" = and i1 %".280", %".283"
  br i1 %".284", label %"access_ok.8", label %"access_fail.8"
for_exit.11:
  %".301" = add i8 %".266", 1
  store i8 %".301", i8* %"i"
  br label %"for_cond.10"
access_ok.8:
  %".286" = sub i8 %".276", 1
  %".287" = sub i8 %".277", 2
  %"elem_ptr.8" = getelementptr [10 x [4 x float]], [10 x [4 x float]]* %"ar2", i32 0, i8 %".286", i8 %".287"
  br label %"access_continue.8"
access_fail.8:
  %"out_of_bounds_err_str_ptr.8" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".289" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.8")
  call void @"llvm.trap"()
  br label %"access_continue.8"
access_continue.8:
  %"final_elem_ptr.8" = phi  float* [%"elem_ptr.8", %"access_ok.8"], [null, %"access_fail.8"]
  %".292" = load i8, i8* %"k"
  %".293" = sitofp i8 %".292" to float
  store float %".293", float* %"final_elem_ptr.8"
  %".295" = load i8, i8* %"k"
  %".296" = add i8 %".295", 1
  store i8 %".296", i8* %"k"
  %".298" = add i8 %".272", 1
  store i8 %".298", i8* %"j"
  br label %"for_cond.11"
for_cond.12:
  %".306" = load i8, i8* %"i"
  %".307" = load i8, i8* %"n"
  %".308" = icmp sle i8 %".306", %".307"
  br i1 %".308", label %"for_body.12", label %"for_exit.12"
for_body.12:
  store i8 2, i8* %"j"
  br label %"for_cond.13"
for_exit.12:
  %".344" = alloca [5 x i8]
  store [5 x i8] c"Char\00", [5 x i8]* %".344"
  %".346" = getelementptr [5 x i8], [5 x i8]* %".344", i8 0, i8 0
  %".347" = call i32 (i8*, ...) @"printf"(i8* %".346")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".348" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  store i8 60, i8* %"k"
  store i8 1, i8* %"i"
  br label %"for_cond.14"
for_cond.13:
  %".312" = load i8, i8* %"j"
  %".313" = load i8, i8* %"m"
  %".314" = icmp sle i8 %".312", %".313"
  br i1 %".314", label %"for_body.13", label %"for_exit.13"
for_body.13:
  %".316" = load i8, i8* %"i"
  %".317" = load i8, i8* %"j"
  %".318" = icmp uge i8 %".316", 1
  %".319" = icmp ule i8 %".316", 10
  %".320" = and i1 %".318", %".319"
  %".321" = icmp uge i8 %".317", 2
  %".322" = icmp ule i8 %".317", 5
  %".323" = and i1 %".321", %".322"
  %".324" = and i1 %".320", %".323"
  br i1 %".324", label %"access_ok.9", label %"access_fail.9"
for_exit.13:
  %".341" = add i8 %".306", 1
  store i8 %".341", i8* %"i"
  br label %"for_cond.12"
access_ok.9:
  %".326" = sub i8 %".316", 1
  %".327" = sub i8 %".317", 2
  %"elem_ptr.9" = getelementptr [10 x [4 x float]], [10 x [4 x float]]* %"ar2", i32 0, i8 %".326", i8 %".327"
  br label %"access_continue.9"
access_fail.9:
  %"out_of_bounds_err_str_ptr.9" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".329" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.9")
  call void @"llvm.trap"()
  br label %"access_continue.9"
access_continue.9:
  %"final_elem_ptr.9" = phi  float* [%"elem_ptr.9", %"access_ok.9"], [null, %"access_fail.9"]
  %".332" = load float, float* %"final_elem_ptr.9"
  %".333" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".333"
  %".335" = getelementptr [3 x i8], [3 x i8]* %".333", i8 0, i8 0
  %".336" = call i32 (i8*, ...) @"printf"(i8* %".335", float %".332")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".337" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".338" = add i8 %".312", 1
  store i8 %".338", i8* %"j"
  br label %"for_cond.13"
for_cond.14:
  %".352" = load i8, i8* %"i"
  %".353" = load i8, i8* %"n"
  %".354" = icmp sle i8 %".352", %".353"
  br i1 %".354", label %"for_body.14", label %"for_exit.14"
for_body.14:
  store i8 2, i8* %"j"
  br label %"for_cond.15"
for_exit.14:
  store i8 1, i8* %"i"
  br label %"for_cond.16"
for_cond.15:
  %".358" = load i8, i8* %"j"
  %".359" = load i8, i8* %"m"
  %".360" = icmp sle i8 %".358", %".359"
  br i1 %".360", label %"for_body.15", label %"for_exit.15"
for_body.15:
  %".362" = load i8, i8* %"i"
  %".363" = load i8, i8* %"j"
  %".364" = icmp uge i8 %".362", 1
  %".365" = icmp ule i8 %".362", 10
  %".366" = and i1 %".364", %".365"
  %".367" = icmp uge i8 %".363", 2
  %".368" = icmp ule i8 %".363", 5
  %".369" = and i1 %".367", %".368"
  %".370" = and i1 %".366", %".369"
  br i1 %".370", label %"access_ok.10", label %"access_fail.10"
for_exit.15:
  %".386" = add i8 %".352", 1
  store i8 %".386", i8* %"i"
  br label %"for_cond.14"
access_ok.10:
  %".372" = sub i8 %".362", 1
  %".373" = sub i8 %".363", 2
  %"elem_ptr.10" = getelementptr [10 x [4 x i8]], [10 x [4 x i8]]* %"ac2", i32 0, i8 %".372", i8 %".373"
  br label %"access_continue.10"
access_fail.10:
  %"out_of_bounds_err_str_ptr.10" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".375" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.10")
  call void @"llvm.trap"()
  br label %"access_continue.10"
access_continue.10:
  %"final_elem_ptr.10" = phi  i8* [%"elem_ptr.10", %"access_ok.10"], [null, %"access_fail.10"]
  %".378" = load i8, i8* %"k"
  store i8 %".378", i8* %"final_elem_ptr.10"
  %".380" = load i8, i8* %"k"
  %".381" = add i8 %".380", 1
  store i8 %".381", i8* %"k"
  %".383" = add i8 %".358", 1
  store i8 %".383", i8* %"j"
  br label %"for_cond.15"
for_cond.16:
  %".391" = load i8, i8* %"i"
  %".392" = load i8, i8* %"n"
  %".393" = icmp sle i8 %".391", %".392"
  br i1 %".393", label %"for_body.16", label %"for_exit.16"
for_body.16:
  store i8 2, i8* %"j"
  br label %"for_cond.17"
for_exit.16:
  ret void
for_cond.17:
  %".397" = load i8, i8* %"j"
  %".398" = load i8, i8* %"m"
  %".399" = icmp sle i8 %".397", %".398"
  br i1 %".399", label %"for_body.17", label %"for_exit.17"
for_body.17:
  %".401" = load i8, i8* %"i"
  %".402" = load i8, i8* %"j"
  %".403" = icmp uge i8 %".401", 1
  %".404" = icmp ule i8 %".401", 10
  %".405" = and i1 %".403", %".404"
  %".406" = icmp uge i8 %".402", 2
  %".407" = icmp ule i8 %".402", 5
  %".408" = and i1 %".406", %".407"
  %".409" = and i1 %".405", %".408"
  br i1 %".409", label %"access_ok.11", label %"access_fail.11"
for_exit.17:
  %".426" = add i8 %".391", 1
  store i8 %".426", i8* %"i"
  br label %"for_cond.16"
access_ok.11:
  %".411" = sub i8 %".401", 1
  %".412" = sub i8 %".402", 2
  %"elem_ptr.11" = getelementptr [10 x [4 x i8]], [10 x [4 x i8]]* %"ac2", i32 0, i8 %".411", i8 %".412"
  br label %"access_continue.11"
access_fail.11:
  %"out_of_bounds_err_str_ptr.11" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".414" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.11")
  call void @"llvm.trap"()
  br label %"access_continue.11"
access_continue.11:
  %"final_elem_ptr.11" = phi  i8* [%"elem_ptr.11", %"access_ok.11"], [null, %"access_fail.11"]
  %".417" = load i8, i8* %"final_elem_ptr.11"
  %".418" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".418"
  %".420" = getelementptr [3 x i8], [3 x i8]* %".418", i8 0, i8 0
  %".421" = call i32 (i8*, ...) @"printf"(i8* %".420", i8 %".417")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".422" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".423" = add i8 %".397", 1
  store i8 %".423", i8* %"j"
  br label %"for_cond.17"
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()
