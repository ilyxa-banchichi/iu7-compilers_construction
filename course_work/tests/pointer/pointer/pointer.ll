; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TRec" = type {i16, float}
define void @"main"()
{
entry:
  %"vInt" = alloca i16
  %"arr" = alloca [10 x i16]
  %"str" = alloca [20 x i8]
  %"vPerson" = alloca %"TRec"
  %"pInt" = alloca i16*
  %"pChr" = alloca i8*
  %"pPerson" = alloca %"TRec"*
  %".2" = alloca i16*
  store i16* %"vInt", i16** %".2"
  %".4" = load i16*, i16** %".2"
  store i16* %".4", i16** %"pInt"
  %".6" = sext i8 5 to i16
  store i16 %".6", i16* %"vInt"
  %".8" = load i16*, i16** %"pInt"
  %".9" = load i16, i16* %".8"
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i16 %".9")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".15" = load i16*, i16** %"pInt"
  %".16" = sext i8 10 to i16
  store i16 %".16", i16* %".15"
  %".18" = load i16*, i16** %"pInt"
  %".19" = load i16, i16* %".18"
  %".20" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".20"
  %".22" = getelementptr [4 x i8], [4 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i16 %".19")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".25" = alloca %"TRec"*
  store %"TRec"* %"vPerson", %"TRec"** %".25"
  %".27" = load %"TRec"*, %"TRec"** %".25"
  store %"TRec"* %".27", %"TRec"** %"pPerson"
  %".29" = getelementptr %"TRec", %"TRec"* %"vPerson", i32 0, i32 0
  %".30" = alloca i16*
  store i16* %".29", i16** %".30"
  %".32" = load i16*, i16** %".30"
  store i16* %".32", i16** %"pInt"
  %".34" = getelementptr %"TRec", %"TRec"* %"vPerson", i32 0, i32 0
  %".35" = sext i8 10 to i16
  store i16 %".35", i16* %".34"
  %".37" = getelementptr %"TRec", %"TRec"* %"vPerson", i32 0, i32 1
  store float 0x403e000000000000, float* %".37"
  %".39" = load %"TRec"*, %"TRec"** %"pPerson"
  %".40" = getelementptr %"TRec", %"TRec"* %".39", i32 0, i32 1
  %".41" = load float, float* %".40"
  %".42" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".42"
  %".44" = getelementptr [3 x i8], [3 x i8]* %".42", i8 0, i8 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", float %".41")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".47" = load i16*, i16** %"pInt"
  %".48" = load i16, i16* %".47"
  %".49" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".49"
  %".51" = getelementptr [4 x i8], [4 x i8]* %".49", i8 0, i8 0
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51", i16 %".48")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".54" = icmp uge i8 1, 1
  %".55" = icmp ule i8 1, 10
  %".56" = and i1 %".54", %".55"
  br i1 %".56", label %"access_ok", label %"access_fail"
access_ok:
  %".58" = sub i8 1, 1
  %"elem_ptr" = getelementptr [10 x i16], [10 x i16]* %"arr", i32 0, i8 %".58"
  br label %"access_continue"
access_fail:
  %"out_of_bounds_err_str_ptr" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".60" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr")
  call void @"llvm.trap"()
  br label %"access_continue"
access_continue:
  %"final_elem_ptr" = phi  i16* [%"elem_ptr", %"access_ok"], [null, %"access_fail"]
  %".63" = sext i8 99 to i16
  store i16 %".63", i16* %"final_elem_ptr"
  %".65" = icmp uge i8 1, 1
  %".66" = icmp ule i8 1, 10
  %".67" = and i1 %".65", %".66"
  br i1 %".67", label %"access_ok.1", label %"access_fail.1"
access_ok.1:
  %".69" = sub i8 1, 1
  %"elem_ptr.1" = getelementptr [10 x i16], [10 x i16]* %"arr", i32 0, i8 %".69"
  br label %"access_continue.1"
access_fail.1:
  %"out_of_bounds_err_str_ptr.1" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".71" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.1")
  call void @"llvm.trap"()
  br label %"access_continue.1"
access_continue.1:
  %"final_elem_ptr.1" = phi  i16* [%"elem_ptr.1", %"access_ok.1"], [null, %"access_fail.1"]
  %".74" = alloca i16*
  store i16* %"final_elem_ptr.1", i16** %".74"
  %".76" = load i16*, i16** %".74"
  store i16* %".76", i16** %"pInt"
  %".78" = load i16*, i16** %"pInt"
  %".79" = load i16, i16* %".78"
  %".80" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".80"
  %".82" = getelementptr [4 x i8], [4 x i8]* %".80", i8 0, i8 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82", i16 %".79")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".84" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".85" = load i16*, i16** %"pInt"
  store i16 9999, i16* %".85"
  %".87" = icmp uge i8 1, 1
  %".88" = icmp ule i8 1, 10
  %".89" = and i1 %".87", %".88"
  br i1 %".89", label %"access_ok.2", label %"access_fail.2"
access_ok.2:
  %".91" = sub i8 1, 1
  %"elem_ptr.2" = getelementptr [10 x i16], [10 x i16]* %"arr", i32 0, i8 %".91"
  br label %"access_continue.2"
access_fail.2:
  %"out_of_bounds_err_str_ptr.2" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".93" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.2")
  call void @"llvm.trap"()
  br label %"access_continue.2"
access_continue.2:
  %"final_elem_ptr.2" = phi  i16* [%"elem_ptr.2", %"access_ok.2"], [null, %"access_fail.2"]
  %".96" = load i16, i16* %"final_elem_ptr.2"
  %".97" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".97"
  %".99" = getelementptr [4 x i8], [4 x i8]* %".97", i8 0, i8 0
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".99", i16 %".96")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".101" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  store [20 x i8] c"Hello world\00\00\00\00\00\00\00\00\00", [20 x i8]* %"str"
  %".103" = icmp uge i8 2, 1
  %".104" = icmp ule i8 2, 20
  %".105" = and i1 %".103", %".104"
  br i1 %".105", label %"access_ok.3", label %"access_fail.3"
access_ok.3:
  %".107" = sub i8 2, 1
  %"elem_ptr.3" = getelementptr [20 x i8], [20 x i8]* %"str", i32 0, i8 %".107"
  br label %"access_continue.3"
access_fail.3:
  %"out_of_bounds_err_str_ptr.3" = getelementptr inbounds [20 x i8], [20 x i8]* @"out_of_bounds_err_str", i32 0, i32 0
  %".109" = call i32 @"puts"(i8* %"out_of_bounds_err_str_ptr.3")
  call void @"llvm.trap"()
  br label %"access_continue.3"
access_continue.3:
  %"final_elem_ptr.3" = phi  i8* [%"elem_ptr.3", %"access_ok.3"], [null, %"access_fail.3"]
  %".112" = alloca i8*
  store i8* %"final_elem_ptr.3", i8** %".112"
  %".114" = load i8*, i8** %".112"
  store i8* %".114", i8** %"pChr"
  %".116" = load i8*, i8** %"pChr"
  %".117" = load i8, i8* %".116"
  %".118" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".118"
  %".120" = getelementptr [3 x i8], [3 x i8]* %".118", i8 0, i8 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120", i8 %".117")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".122" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".123" = load i8*, i8** %"pChr"
  store i8 74, i8* %".123"
  %".125" = load [20 x i8], [20 x i8]* %"str"
  %".126" = alloca [20 x i8]
  store [20 x i8] %".125", [20 x i8]* %".126"
  %".128" = getelementptr [20 x i8], [20 x i8]* %".126", i8 0, i8 0
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".128")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".130" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
declare i32 @"puts"(i8* %".1")

@"out_of_bounds_err_str" = internal constant [20 x i8] [i8 79, i8 117, i8 116, i8 32, i8 111, i8 102, i8 32, i8 98, i8 111, i8 117, i8 110, i8 100, i8 115, i8 32, i8 101, i8 114, i8 114, i8 111, i8 114, i8 0]
declare void @"llvm.trap"()
