; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TPerson" = type {[15 x i8], i8, i16, float, float, i1, [11 x i16], [3 x [50 x i8]], [3 x [5 x i16]], [5 x i16]}
define void @"main"()
{
entry:
  %"person" = alloca %"TPerson"
  %"person2" = alloca %"TPerson"
  %".2" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 0
  store [15 x i8] c"Alice\00\00\00\00\00\00\00\00\00\00", [15 x i8]* %".2"
  %".4" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 1
  store i8 70, i8* %".4"
  %".6" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 2
  store i16 30, i16* %".6"
  %".8" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  store float 0x3ffc000000000000, float* %".8"
  %".10" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 4
  store float 0x404bd999a0000000, float* %".10"
  %".12" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 5
  store i1 0, i1* %".12"
  %".14" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 6
  call void @"FillPhoneNumber"([11 x i16]* %".14", i16 7)
  %".16" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".17" = icmp uge i32 1, 1
  %".18" = icmp ule i32 1, 3
  %".19" = and i1 %".17", %".18"
  br i1 %".19", label %"access_ok", label %"access_fail"
access_ok:
  %".21" = sub i32 1, 1
  %"elem_ptr" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".16", i32 0, i32 %".21"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".23" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  [50 x i8]* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  store [50 x i8] c"Moscow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr"
  %".27" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".28" = icmp uge i32 2, 1
  %".29" = icmp ule i32 2, 3
  %".30" = and i1 %".28", %".29"
  br i1 %".30", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".32" = sub i32 2, 1
  %"elem_ptr.1" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".27", i32 0, i32 %".32"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".34" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  [50 x i8]* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  store [50 x i8] c"Bauman Street\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr.1"
  %".38" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".39" = icmp uge i32 3, 1
  %".40" = icmp ule i32 3, 3
  %".41" = and i1 %".39", %".40"
  br i1 %".41", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".43" = sub i32 3, 1
  %"elem_ptr.2" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".38", i32 0, i32 %".43"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".45" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  [50 x i8]* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  store [50 x i8] c"House 50\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr.2"
  %".49" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".50" = icmp uge i32 1, 1
  %".51" = icmp ule i32 1, 5
  %".52" = and i1 %".50", %".51"
  br i1 %".52", label %"access_ok.3", label %"access_fail.3"
access_ok.3:
  %".54" = sub i32 1, 1
  %"elem_ptr.3" = getelementptr [5 x i16], [5 x i16]* %".49", i32 0, i32 %".54"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".56" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  i16* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".59" = sub i16 0, 99
  store i16 %".59", i16* %"final_elem_ptr.3"
  %".61" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".62" = icmp uge i32 5, 1
  %".63" = icmp ule i32 5, 5
  %".64" = and i1 %".62", %".63"
  br i1 %".64", label %"access_ok.4", label %"access_fail.4"
access_ok.4:
  %".66" = sub i32 5, 1
  %"elem_ptr.4" = getelementptr [5 x i16], [5 x i16]* %".61", i32 0, i32 %".66"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".68" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  i16* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  store i16 99, i16* %"final_elem_ptr.4"
  %".72" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".73" = icmp uge i32 1, 1
  %".74" = icmp ule i32 1, 3
  %".75" = and i1 %".73", %".74"
  br i1 %".75", label %"access_ok.5", label %"access_fail.5"
access_ok.5:
  %".77" = sub i32 1, 1
  %"elem_ptr.5" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".72", i32 0, i32 %".77"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".79" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  [5 x i16]* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".82" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".83" = load [5 x i16], [5 x i16]* %".82"
  store [5 x i16] %".83", [5 x i16]* %"final_elem_ptr.5"
  %".85" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".86" = icmp uge i32 1, 1
  %".87" = icmp ule i32 1, 3
  %".88" = and i1 %".86", %".87"
  br i1 %".88", label %"access_ok.6", label %"access_fail.6"
access_ok.6:
  %".90" = sub i32 1, 1
  %"elem_ptr.6" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".85", i32 0, i32 %".90"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".92" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  [5 x i16]* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".95" = icmp uge i32 1, 1
  %".96" = icmp ule i32 1, 5
  %".97" = and i1 %".95", %".96"
  br i1 %".97", label %"access_ok.7", label %"access_fail.7"
access_ok.7:
  %".99" = sub i32 1, 1
  %"elem_ptr.7" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.6", i32 0, i32 %".99"
  br label %"access_continue.7"
access_fail.7:
  %"out_of_bounds_err_str_ptr.7" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".101" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.7")
  call void @"llvm.trap"()
  br label %"access_continue.7"
access_continue.7:
  %"final_elem_ptr.7" = phi  i16* [%"elem_ptr.7", %"access_ok.7"], [null, %"access_fail.7"]
  %".104" = load i16, i16* %"final_elem_ptr.7"
  %".105" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".105"
  %".107" = getelementptr [4 x i8], [4 x i8]* %".105", i8 0, i8 0
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".107", i16 %".104")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".109" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".110" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".111" = icmp uge i32 1, 1
  %".112" = icmp ule i32 1, 3
  %".113" = and i1 %".111", %".112"
  br i1 %".113", label %"access_ok.8", label %"access_fail.8"
access_ok.8:
  %".115" = sub i32 1, 1
  %"elem_ptr.8" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".110", i32 0, i32 %".115"
  br label %"access_continue.8"
access_fail.8:
  %"out_of_bounds_err_str_ptr.8" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".117" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.8")
  call void @"llvm.trap"()
  br label %"access_continue.8"
access_continue.8:
  %"final_elem_ptr.8" = phi  [5 x i16]* [%"elem_ptr.8", %"access_ok.8"], [null, %"access_fail.8"]
  %".120" = icmp uge i32 5, 1
  %".121" = icmp ule i32 5, 5
  %".122" = and i1 %".120", %".121"
  br i1 %".122", label %"access_ok.9", label %"access_fail.9"
access_ok.9:
  %".124" = sub i32 5, 1
  %"elem_ptr.9" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.8", i32 0, i32 %".124"
  br label %"access_continue.9"
access_fail.9:
  %"out_of_bounds_err_str_ptr.9" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".126" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.9")
  call void @"llvm.trap"()
  br label %"access_continue.9"
access_continue.9:
  %"final_elem_ptr.9" = phi  i16* [%"elem_ptr.9", %"access_ok.9"], [null, %"access_fail.9"]
  %".129" = load i16, i16* %"final_elem_ptr.9"
  %".130" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".130"
  %".132" = getelementptr [4 x i8], [4 x i8]* %".130", i8 0, i8 0
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".132", i16 %".129")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".134" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".135" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".136" = icmp uge i32 1, 1
  %".137" = icmp ule i32 1, 5
  %".138" = and i1 %".136", %".137"
  br i1 %".138", label %"access_ok.10", label %"access_fail.10"
access_ok.10:
  %".140" = sub i32 1, 1
  %"elem_ptr.10" = getelementptr [5 x i16], [5 x i16]* %".135", i32 0, i32 %".140"
  br label %"access_continue.10"
access_fail.10:
  %"out_of_bounds_err_str_ptr.10" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".142" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.10")
  call void @"llvm.trap"()
  br label %"access_continue.10"
access_continue.10:
  %"final_elem_ptr.10" = phi  i16* [%"elem_ptr.10", %"access_ok.10"], [null, %"access_fail.10"]
  store i16 1, i16* %"final_elem_ptr.10"
  %".146" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".147" = icmp uge i32 5, 1
  %".148" = icmp ule i32 5, 5
  %".149" = and i1 %".147", %".148"
  br i1 %".149", label %"access_ok.11", label %"access_fail.11"
access_ok.11:
  %".151" = sub i32 5, 1
  %"elem_ptr.11" = getelementptr [5 x i16], [5 x i16]* %".146", i32 0, i32 %".151"
  br label %"access_continue.11"
access_fail.11:
  %"out_of_bounds_err_str_ptr.11" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".153" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.11")
  call void @"llvm.trap"()
  br label %"access_continue.11"
access_continue.11:
  %"final_elem_ptr.11" = phi  i16* [%"elem_ptr.11", %"access_ok.11"], [null, %"access_fail.11"]
  store i16 2, i16* %"final_elem_ptr.11"
  %".157" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".158" = icmp uge i32 1, 1
  %".159" = icmp ule i32 1, 3
  %".160" = and i1 %".158", %".159"
  br i1 %".160", label %"access_ok.12", label %"access_fail.12"
access_ok.12:
  %".162" = sub i32 1, 1
  %"elem_ptr.12" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".157", i32 0, i32 %".162"
  br label %"access_continue.12"
access_fail.12:
  %"out_of_bounds_err_str_ptr.12" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".164" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.12")
  call void @"llvm.trap"()
  br label %"access_continue.12"
access_continue.12:
  %"final_elem_ptr.12" = phi  [5 x i16]* [%"elem_ptr.12", %"access_ok.12"], [null, %"access_fail.12"]
  %".167" = icmp uge i32 1, 1
  %".168" = icmp ule i32 1, 5
  %".169" = and i1 %".167", %".168"
  br i1 %".169", label %"access_ok.13", label %"access_fail.13"
access_ok.13:
  %".171" = sub i32 1, 1
  %"elem_ptr.13" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.12", i32 0, i32 %".171"
  br label %"access_continue.13"
access_fail.13:
  %"out_of_bounds_err_str_ptr.13" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".173" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.13")
  call void @"llvm.trap"()
  br label %"access_continue.13"
access_continue.13:
  %"final_elem_ptr.13" = phi  i16* [%"elem_ptr.13", %"access_ok.13"], [null, %"access_fail.13"]
  %".176" = load i16, i16* %"final_elem_ptr.13"
  %".177" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".177"
  %".179" = getelementptr [4 x i8], [4 x i8]* %".177", i8 0, i8 0
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".179", i16 %".176")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".181" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".182" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".183" = icmp uge i32 1, 1
  %".184" = icmp ule i32 1, 3
  %".185" = and i1 %".183", %".184"
  br i1 %".185", label %"access_ok.14", label %"access_fail.14"
access_ok.14:
  %".187" = sub i32 1, 1
  %"elem_ptr.14" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".182", i32 0, i32 %".187"
  br label %"access_continue.14"
access_fail.14:
  %"out_of_bounds_err_str_ptr.14" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".189" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.14")
  call void @"llvm.trap"()
  br label %"access_continue.14"
access_continue.14:
  %"final_elem_ptr.14" = phi  [5 x i16]* [%"elem_ptr.14", %"access_ok.14"], [null, %"access_fail.14"]
  %".192" = icmp uge i32 5, 1
  %".193" = icmp ule i32 5, 5
  %".194" = and i1 %".192", %".193"
  br i1 %".194", label %"access_ok.15", label %"access_fail.15"
access_ok.15:
  %".196" = sub i32 5, 1
  %"elem_ptr.15" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.14", i32 0, i32 %".196"
  br label %"access_continue.15"
access_fail.15:
  %"out_of_bounds_err_str_ptr.15" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".198" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.15")
  call void @"llvm.trap"()
  br label %"access_continue.15"
access_continue.15:
  %"final_elem_ptr.15" = phi  i16* [%"elem_ptr.15", %"access_ok.15"], [null, %"access_fail.15"]
  %".201" = load i16, i16* %"final_elem_ptr.15"
  %".202" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".202"
  %".204" = getelementptr [4 x i8], [4 x i8]* %".202", i8 0, i8 0
  %".205" = call i32 (i8*, ...) @"printf"(i8* %".204", i16 %".201")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".206" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".207" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  store [15 x i8] c"Bob\00\00\00\00\00\00\00\00\00\00\00\00", [15 x i8]* %".207"
  %".209" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  store i8 77, i8* %".209"
  %".211" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  store i16 22, i16* %".211"
  %".213" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  store float 0x3fff851ec0000000, float* %".213"
  %".215" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 4
  store float 0x4050600000000000, float* %".215"
  %".217" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  store i1 1, i1* %".217"
  %".219" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  call void @"FillPhoneNumber"([11 x i16]* %".219", i16 4)
  %".221" = alloca [255 x i8]
  store [255 x i8] c"Name: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".221"
  %".223" = getelementptr [255 x i8], [255 x i8]* %".221", i8 0, i8 0
  %".224" = call i32 (i8*, ...) @"printf"(i8* %".223")
  %".225" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 0
  %".226" = load [15 x i8], [15 x i8]* %".225"
  %".227" = alloca [15 x i8]
  store [15 x i8] %".226", [15 x i8]* %".227"
  %".229" = getelementptr [15 x i8], [15 x i8]* %".227", i8 0, i8 0
  %".230" = call i32 (i8*, ...) @"printf"(i8* %".229")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".231" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".232" = alloca [255 x i8]
  store [255 x i8] c"Sex: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".232"
  %".234" = getelementptr [255 x i8], [255 x i8]* %".232", i8 0, i8 0
  %".235" = call i32 (i8*, ...) @"printf"(i8* %".234")
  %".236" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 1
  %".237" = load i8, i8* %".236"
  %".238" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".238"
  %".240" = getelementptr [3 x i8], [3 x i8]* %".238", i8 0, i8 0
  %".241" = call i32 (i8*, ...) @"printf"(i8* %".240", i8 %".237")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".242" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".243" = alloca [255 x i8]
  store [255 x i8] c"Age: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".243"
  %".245" = getelementptr [255 x i8], [255 x i8]* %".243", i8 0, i8 0
  %".246" = call i32 (i8*, ...) @"printf"(i8* %".245")
  %".247" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 2
  %".248" = load i16, i16* %".247"
  %".249" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".249"
  %".251" = getelementptr [4 x i8], [4 x i8]* %".249", i8 0, i8 0
  %".252" = call i32 (i8*, ...) @"printf"(i8* %".251", i16 %".248")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".253" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".254" = alloca [255 x i8]
  store [255 x i8] c"Height: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".254"
  %".256" = getelementptr [255 x i8], [255 x i8]* %".254", i8 0, i8 0
  %".257" = call i32 (i8*, ...) @"printf"(i8* %".256")
  %".258" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".259" = load float, float* %".258"
  %".260" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".260"
  %".262" = getelementptr [3 x i8], [3 x i8]* %".260", i8 0, i8 0
  %".263" = call i32 (i8*, ...) @"printf"(i8* %".262", float %".259")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".264" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".265" = alloca [255 x i8]
  store [255 x i8] c"Weight: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".265"
  %".267" = getelementptr [255 x i8], [255 x i8]* %".265", i8 0, i8 0
  %".268" = call i32 (i8*, ...) @"printf"(i8* %".267")
  %".269" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".270" = load float, float* %".269"
  %".271" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".271"
  %".273" = getelementptr [3 x i8], [3 x i8]* %".271", i8 0, i8 0
  %".274" = call i32 (i8*, ...) @"printf"(i8* %".273", float %".270")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".275" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".276" = alloca [255 x i8]
  store [255 x i8] c"Is Student: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".276"
  %".278" = getelementptr [255 x i8], [255 x i8]* %".276", i8 0, i8 0
  %".279" = call i32 (i8*, ...) @"printf"(i8* %".278")
  %".280" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 5
  %".281" = load i1, i1* %".280"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".282" = select  i1 %".281", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".283" = call i32 (i8*, ...) @"printf"(i8* %".282")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".284" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".285" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 6
  %".286" = load [11 x i16], [11 x i16]* %".285"
  call void @"PrintPhoneNumber"([11 x i16] %".286")
  %".288" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  call void @"PrintAddress"([3 x [50 x i8]]* %".288")
  %".290" = alloca [255 x i8]
  store [255 x i8] c"\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".290"
  %".292" = getelementptr [255 x i8], [255 x i8]* %".290", i8 0, i8 0
  %".293" = call i32 (i8*, ...) @"printf"(i8* %".292")
  %".294" = alloca [255 x i8]
  store [255 x i8] c"Name: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".294"
  %".296" = getelementptr [255 x i8], [255 x i8]* %".294", i8 0, i8 0
  %".297" = call i32 (i8*, ...) @"printf"(i8* %".296")
  %".298" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  %".299" = load [15 x i8], [15 x i8]* %".298"
  %".300" = alloca [15 x i8]
  store [15 x i8] %".299", [15 x i8]* %".300"
  %".302" = getelementptr [15 x i8], [15 x i8]* %".300", i8 0, i8 0
  %".303" = call i32 (i8*, ...) @"printf"(i8* %".302")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".304" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".305" = alloca [255 x i8]
  store [255 x i8] c"Sex: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".305"
  %".307" = getelementptr [255 x i8], [255 x i8]* %".305", i8 0, i8 0
  %".308" = call i32 (i8*, ...) @"printf"(i8* %".307")
  %".309" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  %".310" = load i8, i8* %".309"
  %".311" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".311"
  %".313" = getelementptr [3 x i8], [3 x i8]* %".311", i8 0, i8 0
  %".314" = call i32 (i8*, ...) @"printf"(i8* %".313", i8 %".310")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".315" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".316" = alloca [255 x i8]
  store [255 x i8] c"Age: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".316"
  %".318" = getelementptr [255 x i8], [255 x i8]* %".316", i8 0, i8 0
  %".319" = call i32 (i8*, ...) @"printf"(i8* %".318")
  %".320" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  %".321" = load i16, i16* %".320"
  %".322" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".322"
  %".324" = getelementptr [4 x i8], [4 x i8]* %".322", i8 0, i8 0
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".324", i16 %".321")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".326" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".327" = alloca [255 x i8]
  store [255 x i8] c"Height: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".327"
  %".329" = getelementptr [255 x i8], [255 x i8]* %".327", i8 0, i8 0
  %".330" = call i32 (i8*, ...) @"printf"(i8* %".329")
  %".331" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".332" = load float, float* %".331"
  %".333" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".333"
  %".335" = getelementptr [3 x i8], [3 x i8]* %".333", i8 0, i8 0
  %".336" = call i32 (i8*, ...) @"printf"(i8* %".335", float %".332")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".337" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".338" = alloca [255 x i8]
  store [255 x i8] c"Weight: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".338"
  %".340" = getelementptr [255 x i8], [255 x i8]* %".338", i8 0, i8 0
  %".341" = call i32 (i8*, ...) @"printf"(i8* %".340")
  %".342" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".343" = load float, float* %".342"
  %".344" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".344"
  %".346" = getelementptr [3 x i8], [3 x i8]* %".344", i8 0, i8 0
  %".347" = call i32 (i8*, ...) @"printf"(i8* %".346", float %".343")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".348" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".349" = alloca [255 x i8]
  store [255 x i8] c"Is Student: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".349"
  %".351" = getelementptr [255 x i8], [255 x i8]* %".349", i8 0, i8 0
  %".352" = call i32 (i8*, ...) @"printf"(i8* %".351")
  %".353" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  %".354" = load i1, i1* %".353"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".355" = select  i1 %".354", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".356" = call i32 (i8*, ...) @"printf"(i8* %".355")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".357" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".358" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  %".359" = load [11 x i16], [11 x i16]* %".358"
  call void @"PrintPhoneNumber"([11 x i16] %".359")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define void @"FillPhoneNumber"([11 x i16]* %"phone", i16 %"startNumber")
{
entry:
  %"startNumber.1" = alloca i16
  store i16 %"startNumber", i16* %"startNumber.1"
  %"i" = alloca i16
  store i16 1, i16* %"i"
  br label %"for_cond"
for_cond:
  %".7" = load i16, i16* %"i"
  %".8" = icmp sle i16 %".7", 11
  br i1 %".8", label %"for_body", label %"for_exit"
for_body:
  %".10" = load i16, i16* %"i"
  %".11" = icmp uge i16 %".10", 1
  %".12" = icmp ule i16 %".10", 11
  %".13" = and i1 %".11", %".12"
  br i1 %".13", label %"access_ok", label %"access_fail"
for_exit:
  ret void
access_ok:
  %".15" = sub i16 %".10", 1
  %"elem_ptr" = getelementptr [11 x i16], [11 x i16]* %"phone", i32 0, i16 %".15"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".17" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".20" = load i16, i16* %"startNumber.1"
  %".21" = srem i16 %".20", 10
  store i16 %".21", i16* %"final_elem_ptr"
  %".23" = load i16, i16* %"startNumber.1"
  %".24" = add i16 %".23", 1
  store i16 %".24", i16* %"startNumber.1"
  %".26" = add i16 %".7", 1
  store i16 %".26", i16* %"i"
  br label %"for_cond"
}

declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()

define void @"PrintPhoneNumber"([11 x i16] %"phone")
{
entry:
  %"phone.1" = alloca [11 x i16]
  store [11 x i16] %"phone", [11 x i16]* %"phone.1"
  %"i" = alloca i16
  %".4" = alloca [255 x i8]
  store [255 x i8] c"Phone number: +\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".4"
  %".6" = getelementptr [255 x i8], [255 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  store i16 1, i16* %"i"
  br label %"for_cond"
for_cond:
  %".10" = load i16, i16* %"i"
  %".11" = icmp sle i16 %".10", 11
  br i1 %".11", label %"for_body", label %"for_exit"
for_body:
  %".13" = load i16, i16* %"i"
  %".14" = icmp uge i16 %".13", 1
  %".15" = icmp ule i16 %".13", 11
  %".16" = and i1 %".14", %".15"
  br i1 %".16", label %"access_ok", label %"access_fail"
for_exit:
  %".31" = alloca [255 x i8]
  store [255 x i8] c"\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".31"
  %".33" = getelementptr [255 x i8], [255 x i8]* %".31", i8 0, i8 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33")
  ret void
access_ok:
  %".18" = sub i16 %".13", 1
  %"elem_ptr" = getelementptr [11 x i16], [11 x i16]* %"phone.1", i32 0, i16 %".18"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".20" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".23" = load i16, i16* %"final_elem_ptr"
  %".24" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".24"
  %".26" = getelementptr [4 x i8], [4 x i8]* %".24", i8 0, i8 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i16 %".23")
  %".28" = add i16 %".10", 1
  store i16 %".28", i16* %"i"
  br label %"for_cond"
}

define void @"PrintAddress"([3 x [50 x i8]]* %"address")
{
entry:
  %"i" = alloca i16
  %".3" = icmp uge i32 1, 1
  %".4" = icmp ule i32 1, 3
  %".5" = and i1 %".3", %".4"
  br i1 %".5", label %"access_ok", label %"access_fail"
access_ok:
  %".7" = sub i32 1, 1
  %"elem_ptr" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i32 %".7"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".9" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  [50 x i8]* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".12" = load [50 x i8], [50 x i8]* %"final_elem_ptr"
  %".13" = alloca [50 x i8]
  store [50 x i8] %".12", [50 x i8]* %".13"
  %".15" = getelementptr [50 x i8], [50 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %".17" = alloca [255 x i8]
  store [255 x i8] c", \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".17"
  %".19" = getelementptr [255 x i8], [255 x i8]* %".17", i8 0, i8 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  %".21" = icmp uge i32 2, 1
  %".22" = icmp ule i32 2, 3
  %".23" = and i1 %".21", %".22"
  br i1 %".23", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".25" = sub i32 2, 1
  %"elem_ptr.1" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i32 %".25"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".27" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  [50 x i8]* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".30" = load [50 x i8], [50 x i8]* %"final_elem_ptr.1"
  %".31" = alloca [50 x i8]
  store [50 x i8] %".30", [50 x i8]* %".31"
  %".33" = getelementptr [50 x i8], [50 x i8]* %".31", i8 0, i8 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33")
  %".35" = alloca [255 x i8]
  store [255 x i8] c", \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".35"
  %".37" = getelementptr [255 x i8], [255 x i8]* %".35", i8 0, i8 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37")
  %".39" = icmp uge i32 3, 1
  %".40" = icmp ule i32 3, 3
  %".41" = and i1 %".39", %".40"
  br i1 %".41", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".43" = sub i32 3, 1
  %"elem_ptr.2" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i32 %".43"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".45" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  [50 x i8]* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".48" = load [50 x i8], [50 x i8]* %"final_elem_ptr.2"
  %".49" = alloca [50 x i8]
  store [50 x i8] %".48", [50 x i8]* %".49"
  %".51" = getelementptr [50 x i8], [50 x i8]* %".49", i8 0, i8 0
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51")
  %".53" = alloca [255 x i8]
  store [255 x i8] c"\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".53"
  %".55" = getelementptr [255 x i8], [255 x i8]* %".53", i8 0, i8 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55")
  ret void
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]