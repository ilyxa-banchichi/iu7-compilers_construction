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
  %".7" = sext i8 30 to i16
  store i16 %".7", i16* %".6"
  %".9" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  store float 0x3ffc000000000000, float* %".9"
  %".11" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 4
  store float 0x404bd999a0000000, float* %".11"
  %".13" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 5
  store i1 0, i1* %".13"
  %".15" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 6
  %".16" = sext i8 7 to i16
  call void @"FillPhoneNumber"([11 x i16]* %".15", i16 %".16")
  %".18" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".19" = icmp uge i8 1, 1
  %".20" = icmp ule i8 1, 3
  %".21" = and i1 %".19", %".20"
  br i1 %".21", label %"access_ok", label %"access_fail"
access_ok:
  %".23" = sub i8 1, 1
  %"elem_ptr" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".18", i32 0, i8 %".23"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".25" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  [50 x i8]* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  store [50 x i8] c"Moscow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr"
  %".29" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".30" = icmp uge i8 2, 1
  %".31" = icmp ule i8 2, 3
  %".32" = and i1 %".30", %".31"
  br i1 %".32", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".34" = sub i8 2, 1
  %"elem_ptr.1" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".29", i32 0, i8 %".34"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".36" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  [50 x i8]* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  store [50 x i8] c"Bauman Street\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr.1"
  %".40" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  %".41" = icmp uge i8 3, 1
  %".42" = icmp ule i8 3, 3
  %".43" = and i1 %".41", %".42"
  br i1 %".43", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".45" = sub i8 3, 1
  %"elem_ptr.2" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %".40", i32 0, i8 %".45"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".47" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  [50 x i8]* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  store [50 x i8] c"House 50\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [50 x i8]* %"final_elem_ptr.2"
  %".51" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".52" = icmp uge i8 1, 1
  %".53" = icmp ule i8 1, 5
  %".54" = and i1 %".52", %".53"
  br i1 %".54", label %"access_ok.3", label %"access_fail.3"
access_ok.3:
  %".56" = sub i8 1, 1
  %"elem_ptr.3" = getelementptr [5 x i16], [5 x i16]* %".51", i32 0, i8 %".56"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".58" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  i16* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".61" = sub i8 0, 99
  %".62" = sext i8 %".61" to i16
  store i16 %".62", i16* %"final_elem_ptr.3"
  %".64" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".65" = icmp uge i8 5, 1
  %".66" = icmp ule i8 5, 5
  %".67" = and i1 %".65", %".66"
  br i1 %".67", label %"access_ok.4", label %"access_fail.4"
access_ok.4:
  %".69" = sub i8 5, 1
  %"elem_ptr.4" = getelementptr [5 x i16], [5 x i16]* %".64", i32 0, i8 %".69"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".71" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  i16* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".74" = sext i8 99 to i16
  store i16 %".74", i16* %"final_elem_ptr.4"
  %".76" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".77" = icmp uge i8 1, 1
  %".78" = icmp ule i8 1, 3
  %".79" = and i1 %".77", %".78"
  br i1 %".79", label %"access_ok.5", label %"access_fail.5"
access_ok.5:
  %".81" = sub i8 1, 1
  %"elem_ptr.5" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".76", i32 0, i8 %".81"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".83" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  [5 x i16]* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".86" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".87" = load [5 x i16], [5 x i16]* %".86"
  store [5 x i16] %".87", [5 x i16]* %"final_elem_ptr.5"
  %".89" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".90" = icmp uge i8 1, 1
  %".91" = icmp ule i8 1, 3
  %".92" = and i1 %".90", %".91"
  br i1 %".92", label %"access_ok.6", label %"access_fail.6"
access_ok.6:
  %".94" = sub i8 1, 1
  %"elem_ptr.6" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".89", i32 0, i8 %".94"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".96" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  [5 x i16]* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".99" = icmp uge i8 1, 1
  %".100" = icmp ule i8 1, 5
  %".101" = and i1 %".99", %".100"
  br i1 %".101", label %"access_ok.7", label %"access_fail.7"
access_ok.7:
  %".103" = sub i8 1, 1
  %"elem_ptr.7" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.6", i32 0, i8 %".103"
  br label %"access_continue.7"
access_fail.7:
  %"out_of_bounds_err_str_ptr.7" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".105" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.7")
  call void @"llvm.trap"()
  br label %"access_continue.7"
access_continue.7:
  %"final_elem_ptr.7" = phi  i16* [%"elem_ptr.7", %"access_ok.7"], [null, %"access_fail.7"]
  %".108" = load i16, i16* %"final_elem_ptr.7"
  %".109" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".109"
  %".111" = getelementptr [4 x i8], [4 x i8]* %".109", i8 0, i8 0
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".111", i16 %".108")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".113" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".114" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".115" = icmp uge i8 1, 1
  %".116" = icmp ule i8 1, 3
  %".117" = and i1 %".115", %".116"
  br i1 %".117", label %"access_ok.8", label %"access_fail.8"
access_ok.8:
  %".119" = sub i8 1, 1
  %"elem_ptr.8" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".114", i32 0, i8 %".119"
  br label %"access_continue.8"
access_fail.8:
  %"out_of_bounds_err_str_ptr.8" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".121" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.8")
  call void @"llvm.trap"()
  br label %"access_continue.8"
access_continue.8:
  %"final_elem_ptr.8" = phi  [5 x i16]* [%"elem_ptr.8", %"access_ok.8"], [null, %"access_fail.8"]
  %".124" = icmp uge i8 5, 1
  %".125" = icmp ule i8 5, 5
  %".126" = and i1 %".124", %".125"
  br i1 %".126", label %"access_ok.9", label %"access_fail.9"
access_ok.9:
  %".128" = sub i8 5, 1
  %"elem_ptr.9" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.8", i32 0, i8 %".128"
  br label %"access_continue.9"
access_fail.9:
  %"out_of_bounds_err_str_ptr.9" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".130" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.9")
  call void @"llvm.trap"()
  br label %"access_continue.9"
access_continue.9:
  %"final_elem_ptr.9" = phi  i16* [%"elem_ptr.9", %"access_ok.9"], [null, %"access_fail.9"]
  %".133" = load i16, i16* %"final_elem_ptr.9"
  %".134" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".134"
  %".136" = getelementptr [4 x i8], [4 x i8]* %".134", i8 0, i8 0
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", i16 %".133")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".139" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".140" = icmp uge i8 1, 1
  %".141" = icmp ule i8 1, 5
  %".142" = and i1 %".140", %".141"
  br i1 %".142", label %"access_ok.10", label %"access_fail.10"
access_ok.10:
  %".144" = sub i8 1, 1
  %"elem_ptr.10" = getelementptr [5 x i16], [5 x i16]* %".139", i32 0, i8 %".144"
  br label %"access_continue.10"
access_fail.10:
  %"out_of_bounds_err_str_ptr.10" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".146" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.10")
  call void @"llvm.trap"()
  br label %"access_continue.10"
access_continue.10:
  %"final_elem_ptr.10" = phi  i16* [%"elem_ptr.10", %"access_ok.10"], [null, %"access_fail.10"]
  %".149" = sext i8 1 to i16
  store i16 %".149", i16* %"final_elem_ptr.10"
  %".151" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".152" = icmp uge i8 5, 1
  %".153" = icmp ule i8 5, 5
  %".154" = and i1 %".152", %".153"
  br i1 %".154", label %"access_ok.11", label %"access_fail.11"
access_ok.11:
  %".156" = sub i8 5, 1
  %"elem_ptr.11" = getelementptr [5 x i16], [5 x i16]* %".151", i32 0, i8 %".156"
  br label %"access_continue.11"
access_fail.11:
  %"out_of_bounds_err_str_ptr.11" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".158" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.11")
  call void @"llvm.trap"()
  br label %"access_continue.11"
access_continue.11:
  %"final_elem_ptr.11" = phi  i16* [%"elem_ptr.11", %"access_ok.11"], [null, %"access_fail.11"]
  %".161" = sext i8 2 to i16
  store i16 %".161", i16* %"final_elem_ptr.11"
  %".163" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".164" = icmp uge i8 1, 1
  %".165" = icmp ule i8 1, 3
  %".166" = and i1 %".164", %".165"
  br i1 %".166", label %"access_ok.12", label %"access_fail.12"
access_ok.12:
  %".168" = sub i8 1, 1
  %"elem_ptr.12" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".163", i32 0, i8 %".168"
  br label %"access_continue.12"
access_fail.12:
  %"out_of_bounds_err_str_ptr.12" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".170" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.12")
  call void @"llvm.trap"()
  br label %"access_continue.12"
access_continue.12:
  %"final_elem_ptr.12" = phi  [5 x i16]* [%"elem_ptr.12", %"access_ok.12"], [null, %"access_fail.12"]
  %".173" = icmp uge i8 1, 1
  %".174" = icmp ule i8 1, 5
  %".175" = and i1 %".173", %".174"
  br i1 %".175", label %"access_ok.13", label %"access_fail.13"
access_ok.13:
  %".177" = sub i8 1, 1
  %"elem_ptr.13" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.12", i32 0, i8 %".177"
  br label %"access_continue.13"
access_fail.13:
  %"out_of_bounds_err_str_ptr.13" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".179" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.13")
  call void @"llvm.trap"()
  br label %"access_continue.13"
access_continue.13:
  %"final_elem_ptr.13" = phi  i16* [%"elem_ptr.13", %"access_ok.13"], [null, %"access_fail.13"]
  %".182" = load i16, i16* %"final_elem_ptr.13"
  %".183" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".183"
  %".185" = getelementptr [4 x i8], [4 x i8]* %".183", i8 0, i8 0
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".185", i16 %".182")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".187" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".188" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".189" = icmp uge i8 1, 1
  %".190" = icmp ule i8 1, 3
  %".191" = and i1 %".189", %".190"
  br i1 %".191", label %"access_ok.14", label %"access_fail.14"
access_ok.14:
  %".193" = sub i8 1, 1
  %"elem_ptr.14" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".188", i32 0, i8 %".193"
  br label %"access_continue.14"
access_fail.14:
  %"out_of_bounds_err_str_ptr.14" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".195" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.14")
  call void @"llvm.trap"()
  br label %"access_continue.14"
access_continue.14:
  %"final_elem_ptr.14" = phi  [5 x i16]* [%"elem_ptr.14", %"access_ok.14"], [null, %"access_fail.14"]
  %".198" = icmp uge i8 5, 1
  %".199" = icmp ule i8 5, 5
  %".200" = and i1 %".198", %".199"
  br i1 %".200", label %"access_ok.15", label %"access_fail.15"
access_ok.15:
  %".202" = sub i8 5, 1
  %"elem_ptr.15" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.14", i32 0, i8 %".202"
  br label %"access_continue.15"
access_fail.15:
  %"out_of_bounds_err_str_ptr.15" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".204" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.15")
  call void @"llvm.trap"()
  br label %"access_continue.15"
access_continue.15:
  %"final_elem_ptr.15" = phi  i16* [%"elem_ptr.15", %"access_ok.15"], [null, %"access_fail.15"]
  %".207" = load i16, i16* %"final_elem_ptr.15"
  %".208" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".208"
  %".210" = getelementptr [4 x i8], [4 x i8]* %".208", i8 0, i8 0
  %".211" = call i32 (i8*, ...) @"printf"(i8* %".210", i16 %".207")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".212" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".213" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  store [15 x i8] c"Bob\00\00\00\00\00\00\00\00\00\00\00\00", [15 x i8]* %".213"
  %".215" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  store i8 77, i8* %".215"
  %".217" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  %".218" = sext i8 22 to i16
  store i16 %".218", i16* %".217"
  %".220" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  store float 0x3fff851ec0000000, float* %".220"
  %".222" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 4
  store float 0x4050600000000000, float* %".222"
  %".224" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  store i1 1, i1* %".224"
  %".226" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  %".227" = sext i8 4 to i16
  call void @"FillPhoneNumber"([11 x i16]* %".226", i16 %".227")
  %".229" = alloca [255 x i8]
  store [255 x i8] c"Name: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".229"
  %".231" = getelementptr [255 x i8], [255 x i8]* %".229", i8 0, i8 0
  %".232" = call i32 (i8*, ...) @"printf"(i8* %".231")
  %".233" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 0
  %".234" = load [15 x i8], [15 x i8]* %".233"
  %".235" = alloca [15 x i8]
  store [15 x i8] %".234", [15 x i8]* %".235"
  %".237" = getelementptr [15 x i8], [15 x i8]* %".235", i8 0, i8 0
  %".238" = call i32 (i8*, ...) @"printf"(i8* %".237")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".239" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".240" = alloca [255 x i8]
  store [255 x i8] c"Sex: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".240"
  %".242" = getelementptr [255 x i8], [255 x i8]* %".240", i8 0, i8 0
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  %".244" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 1
  %".245" = load i8, i8* %".244"
  %".246" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".246"
  %".248" = getelementptr [3 x i8], [3 x i8]* %".246", i8 0, i8 0
  %".249" = call i32 (i8*, ...) @"printf"(i8* %".248", i8 %".245")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".250" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".251" = alloca [255 x i8]
  store [255 x i8] c"Age: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".251"
  %".253" = getelementptr [255 x i8], [255 x i8]* %".251", i8 0, i8 0
  %".254" = call i32 (i8*, ...) @"printf"(i8* %".253")
  %".255" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 2
  %".256" = load i16, i16* %".255"
  %".257" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".257"
  %".259" = getelementptr [4 x i8], [4 x i8]* %".257", i8 0, i8 0
  %".260" = call i32 (i8*, ...) @"printf"(i8* %".259", i16 %".256")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".261" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".262" = alloca [255 x i8]
  store [255 x i8] c"Height: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".262"
  %".264" = getelementptr [255 x i8], [255 x i8]* %".262", i8 0, i8 0
  %".265" = call i32 (i8*, ...) @"printf"(i8* %".264")
  %".266" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".267" = load float, float* %".266"
  %".268" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".268"
  %".270" = getelementptr [3 x i8], [3 x i8]* %".268", i8 0, i8 0
  %".271" = call i32 (i8*, ...) @"printf"(i8* %".270", float %".267")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".272" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".273" = alloca [255 x i8]
  store [255 x i8] c"Weight: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".273"
  %".275" = getelementptr [255 x i8], [255 x i8]* %".273", i8 0, i8 0
  %".276" = call i32 (i8*, ...) @"printf"(i8* %".275")
  %".277" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".278" = load float, float* %".277"
  %".279" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".279"
  %".281" = getelementptr [3 x i8], [3 x i8]* %".279", i8 0, i8 0
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281", float %".278")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".283" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".284" = alloca [255 x i8]
  store [255 x i8] c"Is Student: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".284"
  %".286" = getelementptr [255 x i8], [255 x i8]* %".284", i8 0, i8 0
  %".287" = call i32 (i8*, ...) @"printf"(i8* %".286")
  %".288" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 5
  %".289" = load i1, i1* %".288"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".290" = select  i1 %".289", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".291" = call i32 (i8*, ...) @"printf"(i8* %".290")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".292" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".293" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 6
  %".294" = load [11 x i16], [11 x i16]* %".293"
  call void @"PrintPhoneNumber"([11 x i16] %".294")
  %".296" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  call void @"PrintAddress"([3 x [50 x i8]]* %".296")
  %".298" = alloca [255 x i8]
  store [255 x i8] c"\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".298"
  %".300" = getelementptr [255 x i8], [255 x i8]* %".298", i8 0, i8 0
  %".301" = call i32 (i8*, ...) @"printf"(i8* %".300")
  %".302" = alloca [255 x i8]
  store [255 x i8] c"Name: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".302"
  %".304" = getelementptr [255 x i8], [255 x i8]* %".302", i8 0, i8 0
  %".305" = call i32 (i8*, ...) @"printf"(i8* %".304")
  %".306" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  %".307" = load [15 x i8], [15 x i8]* %".306"
  %".308" = alloca [15 x i8]
  store [15 x i8] %".307", [15 x i8]* %".308"
  %".310" = getelementptr [15 x i8], [15 x i8]* %".308", i8 0, i8 0
  %".311" = call i32 (i8*, ...) @"printf"(i8* %".310")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".312" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".313" = alloca [255 x i8]
  store [255 x i8] c"Sex: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".313"
  %".315" = getelementptr [255 x i8], [255 x i8]* %".313", i8 0, i8 0
  %".316" = call i32 (i8*, ...) @"printf"(i8* %".315")
  %".317" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  %".318" = load i8, i8* %".317"
  %".319" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".319"
  %".321" = getelementptr [3 x i8], [3 x i8]* %".319", i8 0, i8 0
  %".322" = call i32 (i8*, ...) @"printf"(i8* %".321", i8 %".318")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".323" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".324" = alloca [255 x i8]
  store [255 x i8] c"Age: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".324"
  %".326" = getelementptr [255 x i8], [255 x i8]* %".324", i8 0, i8 0
  %".327" = call i32 (i8*, ...) @"printf"(i8* %".326")
  %".328" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  %".329" = load i16, i16* %".328"
  %".330" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".330"
  %".332" = getelementptr [4 x i8], [4 x i8]* %".330", i8 0, i8 0
  %".333" = call i32 (i8*, ...) @"printf"(i8* %".332", i16 %".329")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".334" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".335" = alloca [255 x i8]
  store [255 x i8] c"Height: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".335"
  %".337" = getelementptr [255 x i8], [255 x i8]* %".335", i8 0, i8 0
  %".338" = call i32 (i8*, ...) @"printf"(i8* %".337")
  %".339" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".340" = load float, float* %".339"
  %".341" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".341"
  %".343" = getelementptr [3 x i8], [3 x i8]* %".341", i8 0, i8 0
  %".344" = call i32 (i8*, ...) @"printf"(i8* %".343", float %".340")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".345" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".346" = alloca [255 x i8]
  store [255 x i8] c"Weight: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".346"
  %".348" = getelementptr [255 x i8], [255 x i8]* %".346", i8 0, i8 0
  %".349" = call i32 (i8*, ...) @"printf"(i8* %".348")
  %".350" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".351" = load float, float* %".350"
  %".352" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".352"
  %".354" = getelementptr [3 x i8], [3 x i8]* %".352", i8 0, i8 0
  %".355" = call i32 (i8*, ...) @"printf"(i8* %".354", float %".351")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".356" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".357" = alloca [255 x i8]
  store [255 x i8] c"Is Student: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".357"
  %".359" = getelementptr [255 x i8], [255 x i8]* %".357", i8 0, i8 0
  %".360" = call i32 (i8*, ...) @"printf"(i8* %".359")
  %".361" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  %".362" = load i1, i1* %".361"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".363" = select  i1 %".362", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".364" = call i32 (i8*, ...) @"printf"(i8* %".363")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".365" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".366" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  %".367" = load [11 x i16], [11 x i16]* %".366"
  call void @"PrintPhoneNumber"([11 x i16] %".367")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

define void @"FillPhoneNumber"([11 x i16]* %"phone", i16 %"startNumber")
{
entry:
  %"startNumber.1" = alloca i16
  store i16 %"startNumber", i16* %"startNumber.1"
  %"i" = alloca i16
  %".5" = sext i8 1 to i16
  store i16 %".5", i16* %"i"
  br label %"for_cond"
for_cond:
  %".8" = load i16, i16* %"i"
  %".9" = icmp sle i16 %".8", 11
  br i1 %".9", label %"for_body", label %"for_exit"
for_body:
  %".11" = load i16, i16* %"i"
  %".12" = icmp uge i16 %".11", 1
  %".13" = icmp ule i16 %".11", 11
  %".14" = and i1 %".12", %".13"
  br i1 %".14", label %"access_ok", label %"access_fail"
for_exit:
  ret void
access_ok:
  %".16" = sub i16 %".11", 1
  %"elem_ptr" = getelementptr [11 x i16], [11 x i16]* %"phone", i32 0, i16 %".16"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".18" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".21" = load i16, i16* %"startNumber.1"
  %".22" = sext i8 10 to i16
  %".23" = srem i16 %".21", %".22"
  store i16 %".23", i16* %"final_elem_ptr"
  %".25" = load i16, i16* %"startNumber.1"
  %".26" = sext i8 1 to i16
  %".27" = add i16 %".25", %".26"
  store i16 %".27", i16* %"startNumber.1"
  %".29" = add i16 %".8", 1
  store i16 %".29", i16* %"i"
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
  %".8" = sext i8 1 to i16
  store i16 %".8", i16* %"i"
  br label %"for_cond"
for_cond:
  %".11" = load i16, i16* %"i"
  %".12" = icmp sle i16 %".11", 11
  br i1 %".12", label %"for_body", label %"for_exit"
for_body:
  %".14" = load i16, i16* %"i"
  %".15" = icmp uge i16 %".14", 1
  %".16" = icmp ule i16 %".14", 11
  %".17" = and i1 %".15", %".16"
  br i1 %".17", label %"access_ok", label %"access_fail"
for_exit:
  %".32" = alloca [255 x i8]
  store [255 x i8] c"\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".32"
  %".34" = getelementptr [255 x i8], [255 x i8]* %".32", i8 0, i8 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34")
  ret void
access_ok:
  %".19" = sub i16 %".14", 1
  %"elem_ptr" = getelementptr [11 x i16], [11 x i16]* %"phone.1", i32 0, i16 %".19"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".21" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".24" = load i16, i16* %"final_elem_ptr"
  %".25" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".25"
  %".27" = getelementptr [4 x i8], [4 x i8]* %".25", i8 0, i8 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i16 %".24")
  %".29" = add i16 %".11", 1
  store i16 %".29", i16* %"i"
  br label %"for_cond"
}

define void @"PrintAddress"([3 x [50 x i8]]* %"address")
{
entry:
  %"i" = alloca i16
  %".3" = icmp uge i8 1, 1
  %".4" = icmp ule i8 1, 3
  %".5" = and i1 %".3", %".4"
  br i1 %".5", label %"access_ok", label %"access_fail"
access_ok:
  %".7" = sub i8 1, 1
  %"elem_ptr" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i8 %".7"
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
  %".21" = icmp uge i8 2, 1
  %".22" = icmp ule i8 2, 3
  %".23" = and i1 %".21", %".22"
  br i1 %".23", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".25" = sub i8 2, 1
  %"elem_ptr.1" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i8 %".25"
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
  %".39" = icmp uge i8 3, 1
  %".40" = icmp ule i8 3, 3
  %".41" = and i1 %".39", %".40"
  br i1 %".41", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".43" = sub i8 3, 1
  %"elem_ptr.2" = getelementptr [3 x [50 x i8]], [3 x [50 x i8]]* %"address", i32 0, i8 %".43"
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