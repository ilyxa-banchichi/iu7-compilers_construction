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
  store i16 -99, i16* %"final_elem_ptr.3"
  %".62" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".63" = icmp uge i8 5, 1
  %".64" = icmp ule i8 5, 5
  %".65" = and i1 %".63", %".64"
  br i1 %".65", label %"access_ok.4", label %"access_fail.4"
access_ok.4:
  %".67" = sub i8 5, 1
  %"elem_ptr.4" = getelementptr [5 x i16], [5 x i16]* %".62", i32 0, i8 %".67"
  br label %"access_continue.4"
access_fail.4:
  %"out_of_bounds_err_str_ptr.4" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".69" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.4")
  call void @"llvm.trap"()
  br label %"access_continue.4"
access_continue.4:
  %"final_elem_ptr.4" = phi  i16* [%"elem_ptr.4", %"access_ok.4"], [null, %"access_fail.4"]
  %".72" = sext i8 99 to i16
  store i16 %".72", i16* %"final_elem_ptr.4"
  %".74" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".75" = icmp uge i8 1, 1
  %".76" = icmp ule i8 1, 3
  %".77" = and i1 %".75", %".76"
  br i1 %".77", label %"access_ok.5", label %"access_fail.5"
access_ok.5:
  %".79" = sub i8 1, 1
  %"elem_ptr.5" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".74", i32 0, i8 %".79"
  br label %"access_continue.5"
access_fail.5:
  %"out_of_bounds_err_str_ptr.5" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".81" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.5")
  call void @"llvm.trap"()
  br label %"access_continue.5"
access_continue.5:
  %"final_elem_ptr.5" = phi  [5 x i16]* [%"elem_ptr.5", %"access_ok.5"], [null, %"access_fail.5"]
  %".84" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".85" = load [5 x i16], [5 x i16]* %".84"
  store [5 x i16] %".85", [5 x i16]* %"final_elem_ptr.5"
  %".87" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".88" = icmp uge i8 1, 1
  %".89" = icmp ule i8 1, 3
  %".90" = and i1 %".88", %".89"
  br i1 %".90", label %"access_ok.6", label %"access_fail.6"
access_ok.6:
  %".92" = sub i8 1, 1
  %"elem_ptr.6" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".87", i32 0, i8 %".92"
  br label %"access_continue.6"
access_fail.6:
  %"out_of_bounds_err_str_ptr.6" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".94" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.6")
  call void @"llvm.trap"()
  br label %"access_continue.6"
access_continue.6:
  %"final_elem_ptr.6" = phi  [5 x i16]* [%"elem_ptr.6", %"access_ok.6"], [null, %"access_fail.6"]
  %".97" = icmp uge i8 1, 1
  %".98" = icmp ule i8 1, 5
  %".99" = and i1 %".97", %".98"
  br i1 %".99", label %"access_ok.7", label %"access_fail.7"
access_ok.7:
  %".101" = sub i8 1, 1
  %"elem_ptr.7" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.6", i32 0, i8 %".101"
  br label %"access_continue.7"
access_fail.7:
  %"out_of_bounds_err_str_ptr.7" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".103" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.7")
  call void @"llvm.trap"()
  br label %"access_continue.7"
access_continue.7:
  %"final_elem_ptr.7" = phi  i16* [%"elem_ptr.7", %"access_ok.7"], [null, %"access_fail.7"]
  %".106" = load i16, i16* %"final_elem_ptr.7"
  %".107" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".107"
  %".109" = getelementptr [4 x i8], [4 x i8]* %".107", i8 0, i8 0
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".109", i16 %".106")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".112" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".113" = icmp uge i8 1, 1
  %".114" = icmp ule i8 1, 3
  %".115" = and i1 %".113", %".114"
  br i1 %".115", label %"access_ok.8", label %"access_fail.8"
access_ok.8:
  %".117" = sub i8 1, 1
  %"elem_ptr.8" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".112", i32 0, i8 %".117"
  br label %"access_continue.8"
access_fail.8:
  %"out_of_bounds_err_str_ptr.8" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".119" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.8")
  call void @"llvm.trap"()
  br label %"access_continue.8"
access_continue.8:
  %"final_elem_ptr.8" = phi  [5 x i16]* [%"elem_ptr.8", %"access_ok.8"], [null, %"access_fail.8"]
  %".122" = icmp uge i8 5, 1
  %".123" = icmp ule i8 5, 5
  %".124" = and i1 %".122", %".123"
  br i1 %".124", label %"access_ok.9", label %"access_fail.9"
access_ok.9:
  %".126" = sub i8 5, 1
  %"elem_ptr.9" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.8", i32 0, i8 %".126"
  br label %"access_continue.9"
access_fail.9:
  %"out_of_bounds_err_str_ptr.9" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".128" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.9")
  call void @"llvm.trap"()
  br label %"access_continue.9"
access_continue.9:
  %"final_elem_ptr.9" = phi  i16* [%"elem_ptr.9", %"access_ok.9"], [null, %"access_fail.9"]
  %".131" = load i16, i16* %"final_elem_ptr.9"
  %".132" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".132"
  %".134" = getelementptr [4 x i8], [4 x i8]* %".132", i8 0, i8 0
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".134", i16 %".131")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".136" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".137" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".138" = icmp uge i8 1, 1
  %".139" = icmp ule i8 1, 5
  %".140" = and i1 %".138", %".139"
  br i1 %".140", label %"access_ok.10", label %"access_fail.10"
access_ok.10:
  %".142" = sub i8 1, 1
  %"elem_ptr.10" = getelementptr [5 x i16], [5 x i16]* %".137", i32 0, i8 %".142"
  br label %"access_continue.10"
access_fail.10:
  %"out_of_bounds_err_str_ptr.10" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".144" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.10")
  call void @"llvm.trap"()
  br label %"access_continue.10"
access_continue.10:
  %"final_elem_ptr.10" = phi  i16* [%"elem_ptr.10", %"access_ok.10"], [null, %"access_fail.10"]
  %".147" = sext i8 1 to i16
  store i16 %".147", i16* %"final_elem_ptr.10"
  %".149" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 9
  %".150" = icmp uge i8 5, 1
  %".151" = icmp ule i8 5, 5
  %".152" = and i1 %".150", %".151"
  br i1 %".152", label %"access_ok.11", label %"access_fail.11"
access_ok.11:
  %".154" = sub i8 5, 1
  %"elem_ptr.11" = getelementptr [5 x i16], [5 x i16]* %".149", i32 0, i8 %".154"
  br label %"access_continue.11"
access_fail.11:
  %"out_of_bounds_err_str_ptr.11" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".156" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.11")
  call void @"llvm.trap"()
  br label %"access_continue.11"
access_continue.11:
  %"final_elem_ptr.11" = phi  i16* [%"elem_ptr.11", %"access_ok.11"], [null, %"access_fail.11"]
  %".159" = sext i8 2 to i16
  store i16 %".159", i16* %"final_elem_ptr.11"
  %".161" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".162" = icmp uge i8 1, 1
  %".163" = icmp ule i8 1, 3
  %".164" = and i1 %".162", %".163"
  br i1 %".164", label %"access_ok.12", label %"access_fail.12"
access_ok.12:
  %".166" = sub i8 1, 1
  %"elem_ptr.12" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".161", i32 0, i8 %".166"
  br label %"access_continue.12"
access_fail.12:
  %"out_of_bounds_err_str_ptr.12" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".168" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.12")
  call void @"llvm.trap"()
  br label %"access_continue.12"
access_continue.12:
  %"final_elem_ptr.12" = phi  [5 x i16]* [%"elem_ptr.12", %"access_ok.12"], [null, %"access_fail.12"]
  %".171" = icmp uge i8 1, 1
  %".172" = icmp ule i8 1, 5
  %".173" = and i1 %".171", %".172"
  br i1 %".173", label %"access_ok.13", label %"access_fail.13"
access_ok.13:
  %".175" = sub i8 1, 1
  %"elem_ptr.13" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.12", i32 0, i8 %".175"
  br label %"access_continue.13"
access_fail.13:
  %"out_of_bounds_err_str_ptr.13" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".177" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.13")
  call void @"llvm.trap"()
  br label %"access_continue.13"
access_continue.13:
  %"final_elem_ptr.13" = phi  i16* [%"elem_ptr.13", %"access_ok.13"], [null, %"access_fail.13"]
  %".180" = load i16, i16* %"final_elem_ptr.13"
  %".181" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".181"
  %".183" = getelementptr [4 x i8], [4 x i8]* %".181", i8 0, i8 0
  %".184" = call i32 (i8*, ...) @"printf"(i8* %".183", i16 %".180")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".185" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".186" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 8
  %".187" = icmp uge i8 1, 1
  %".188" = icmp ule i8 1, 3
  %".189" = and i1 %".187", %".188"
  br i1 %".189", label %"access_ok.14", label %"access_fail.14"
access_ok.14:
  %".191" = sub i8 1, 1
  %"elem_ptr.14" = getelementptr [3 x [5 x i16]], [3 x [5 x i16]]* %".186", i32 0, i8 %".191"
  br label %"access_continue.14"
access_fail.14:
  %"out_of_bounds_err_str_ptr.14" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".193" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.14")
  call void @"llvm.trap"()
  br label %"access_continue.14"
access_continue.14:
  %"final_elem_ptr.14" = phi  [5 x i16]* [%"elem_ptr.14", %"access_ok.14"], [null, %"access_fail.14"]
  %".196" = icmp uge i8 5, 1
  %".197" = icmp ule i8 5, 5
  %".198" = and i1 %".196", %".197"
  br i1 %".198", label %"access_ok.15", label %"access_fail.15"
access_ok.15:
  %".200" = sub i8 5, 1
  %"elem_ptr.15" = getelementptr [5 x i16], [5 x i16]* %"final_elem_ptr.14", i32 0, i8 %".200"
  br label %"access_continue.15"
access_fail.15:
  %"out_of_bounds_err_str_ptr.15" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".202" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.15")
  call void @"llvm.trap"()
  br label %"access_continue.15"
access_continue.15:
  %"final_elem_ptr.15" = phi  i16* [%"elem_ptr.15", %"access_ok.15"], [null, %"access_fail.15"]
  %".205" = load i16, i16* %"final_elem_ptr.15"
  %".206" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".206"
  %".208" = getelementptr [4 x i8], [4 x i8]* %".206", i8 0, i8 0
  %".209" = call i32 (i8*, ...) @"printf"(i8* %".208", i16 %".205")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".210" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".211" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  store [15 x i8] c"Bob\00\00\00\00\00\00\00\00\00\00\00\00", [15 x i8]* %".211"
  %".213" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  store i8 77, i8* %".213"
  %".215" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  %".216" = sext i8 22 to i16
  store i16 %".216", i16* %".215"
  %".218" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  store float 0x3fff851ec0000000, float* %".218"
  %".220" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 4
  store float 0x4050600000000000, float* %".220"
  %".222" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  store i1 1, i1* %".222"
  %".224" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  %".225" = sext i8 4 to i16
  call void @"FillPhoneNumber"([11 x i16]* %".224", i16 %".225")
  %".227" = alloca [7 x i8]
  store [7 x i8] c"Name: \00", [7 x i8]* %".227"
  %".229" = getelementptr [7 x i8], [7 x i8]* %".227", i8 0, i8 0
  %".230" = call i32 (i8*, ...) @"printf"(i8* %".229")
  %".231" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 0
  %".232" = load [15 x i8], [15 x i8]* %".231"
  %".233" = alloca [15 x i8]
  store [15 x i8] %".232", [15 x i8]* %".233"
  %".235" = getelementptr [15 x i8], [15 x i8]* %".233", i8 0, i8 0
  %".236" = call i32 (i8*, ...) @"printf"(i8* %".235")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".237" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".238" = alloca [6 x i8]
  store [6 x i8] c"Sex: \00", [6 x i8]* %".238"
  %".240" = getelementptr [6 x i8], [6 x i8]* %".238", i8 0, i8 0
  %".241" = call i32 (i8*, ...) @"printf"(i8* %".240")
  %".242" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 1
  %".243" = load i8, i8* %".242"
  %".244" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".244"
  %".246" = getelementptr [3 x i8], [3 x i8]* %".244", i8 0, i8 0
  %".247" = call i32 (i8*, ...) @"printf"(i8* %".246", i8 %".243")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".248" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".249" = alloca [6 x i8]
  store [6 x i8] c"Age: \00", [6 x i8]* %".249"
  %".251" = getelementptr [6 x i8], [6 x i8]* %".249", i8 0, i8 0
  %".252" = call i32 (i8*, ...) @"printf"(i8* %".251")
  %".253" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 2
  %".254" = load i16, i16* %".253"
  %".255" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".255"
  %".257" = getelementptr [4 x i8], [4 x i8]* %".255", i8 0, i8 0
  %".258" = call i32 (i8*, ...) @"printf"(i8* %".257", i16 %".254")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".259" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".260" = alloca [9 x i8]
  store [9 x i8] c"Height: \00", [9 x i8]* %".260"
  %".262" = getelementptr [9 x i8], [9 x i8]* %".260", i8 0, i8 0
  %".263" = call i32 (i8*, ...) @"printf"(i8* %".262")
  %".264" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".265" = load float, float* %".264"
  %".266" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".266"
  %".268" = getelementptr [3 x i8], [3 x i8]* %".266", i8 0, i8 0
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".268", float %".265")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".270" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".271" = alloca [9 x i8]
  store [9 x i8] c"Weight: \00", [9 x i8]* %".271"
  %".273" = getelementptr [9 x i8], [9 x i8]* %".271", i8 0, i8 0
  %".274" = call i32 (i8*, ...) @"printf"(i8* %".273")
  %".275" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 3
  %".276" = load float, float* %".275"
  %".277" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".277"
  %".279" = getelementptr [3 x i8], [3 x i8]* %".277", i8 0, i8 0
  %".280" = call i32 (i8*, ...) @"printf"(i8* %".279", float %".276")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".281" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".282" = alloca [13 x i8]
  store [13 x i8] c"Is Student: \00", [13 x i8]* %".282"
  %".284" = getelementptr [13 x i8], [13 x i8]* %".282", i8 0, i8 0
  %".285" = call i32 (i8*, ...) @"printf"(i8* %".284")
  %".286" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 5
  %".287" = load i1, i1* %".286"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".288" = select  i1 %".287", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".289" = call i32 (i8*, ...) @"printf"(i8* %".288")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".290" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".291" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 6
  %".292" = load [11 x i16], [11 x i16]* %".291"
  call void @"PrintPhoneNumber"([11 x i16] %".292")
  %".294" = getelementptr %"TPerson", %"TPerson"* %"person", i32 0, i32 7
  call void @"PrintAddress"([3 x [50 x i8]]* %".294")
  %".296" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".296"
  %".298" = getelementptr [3 x i8], [3 x i8]* %".296", i8 0, i8 0
  %".299" = call i32 (i8*, ...) @"printf"(i8* %".298", i8 10)
  %".300" = alloca [7 x i8]
  store [7 x i8] c"Name: \00", [7 x i8]* %".300"
  %".302" = getelementptr [7 x i8], [7 x i8]* %".300", i8 0, i8 0
  %".303" = call i32 (i8*, ...) @"printf"(i8* %".302")
  %".304" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 0
  %".305" = load [15 x i8], [15 x i8]* %".304"
  %".306" = alloca [15 x i8]
  store [15 x i8] %".305", [15 x i8]* %".306"
  %".308" = getelementptr [15 x i8], [15 x i8]* %".306", i8 0, i8 0
  %".309" = call i32 (i8*, ...) @"printf"(i8* %".308")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".310" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".311" = alloca [6 x i8]
  store [6 x i8] c"Sex: \00", [6 x i8]* %".311"
  %".313" = getelementptr [6 x i8], [6 x i8]* %".311", i8 0, i8 0
  %".314" = call i32 (i8*, ...) @"printf"(i8* %".313")
  %".315" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 1
  %".316" = load i8, i8* %".315"
  %".317" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".317"
  %".319" = getelementptr [3 x i8], [3 x i8]* %".317", i8 0, i8 0
  %".320" = call i32 (i8*, ...) @"printf"(i8* %".319", i8 %".316")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".321" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".322" = alloca [6 x i8]
  store [6 x i8] c"Age: \00", [6 x i8]* %".322"
  %".324" = getelementptr [6 x i8], [6 x i8]* %".322", i8 0, i8 0
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".324")
  %".326" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 2
  %".327" = load i16, i16* %".326"
  %".328" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".328"
  %".330" = getelementptr [4 x i8], [4 x i8]* %".328", i8 0, i8 0
  %".331" = call i32 (i8*, ...) @"printf"(i8* %".330", i16 %".327")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".332" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".333" = alloca [9 x i8]
  store [9 x i8] c"Height: \00", [9 x i8]* %".333"
  %".335" = getelementptr [9 x i8], [9 x i8]* %".333", i8 0, i8 0
  %".336" = call i32 (i8*, ...) @"printf"(i8* %".335")
  %".337" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".338" = load float, float* %".337"
  %".339" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".339"
  %".341" = getelementptr [3 x i8], [3 x i8]* %".339", i8 0, i8 0
  %".342" = call i32 (i8*, ...) @"printf"(i8* %".341", float %".338")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".343" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".344" = alloca [9 x i8]
  store [9 x i8] c"Weight: \00", [9 x i8]* %".344"
  %".346" = getelementptr [9 x i8], [9 x i8]* %".344", i8 0, i8 0
  %".347" = call i32 (i8*, ...) @"printf"(i8* %".346")
  %".348" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 3
  %".349" = load float, float* %".348"
  %".350" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".350"
  %".352" = getelementptr [3 x i8], [3 x i8]* %".350", i8 0, i8 0
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352", float %".349")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".354" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".355" = alloca [13 x i8]
  store [13 x i8] c"Is Student: \00", [13 x i8]* %".355"
  %".357" = getelementptr [13 x i8], [13 x i8]* %".355", i8 0, i8 0
  %".358" = call i32 (i8*, ...) @"printf"(i8* %".357")
  %".359" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 5
  %".360" = load i1, i1* %".359"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".361" = select  i1 %".360", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".362" = call i32 (i8*, ...) @"printf"(i8* %".361")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".363" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".364" = getelementptr %"TPerson", %"TPerson"* %"person2", i32 0, i32 6
  %".365" = load [11 x i16], [11 x i16]* %".364"
  call void @"PrintPhoneNumber"([11 x i16] %".365")
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
  %".4" = alloca [16 x i8]
  store [16 x i8] c"Phone number: +\00", [16 x i8]* %".4"
  %".6" = getelementptr [16 x i8], [16 x i8]* %".4", i8 0, i8 0
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
  %".32" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".32"
  %".34" = getelementptr [3 x i8], [3 x i8]* %".32", i8 0, i8 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8 10)
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
  %".17" = alloca [3 x i8]
  store [3 x i8] c", \00", [3 x i8]* %".17"
  %".19" = getelementptr [3 x i8], [3 x i8]* %".17", i8 0, i8 0
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
  %".35" = alloca [3 x i8]
  store [3 x i8] c", \00", [3 x i8]* %".35"
  %".37" = getelementptr [3 x i8], [3 x i8]* %".35", i8 0, i8 0
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
  %".53" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".53"
  %".55" = getelementptr [3 x i8], [3 x i8]* %".53", i8 0, i8 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55", i8 10)
  ret void
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]