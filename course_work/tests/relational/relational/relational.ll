; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"byteVar" = alloca i8
  %"floatVar" = alloca float
  %"resVar" = alloca i1
  %".2" = alloca [18 x i8]
  store [18 x i8] c"___Integer tests\0a\00", [18 x i8]* %".2"
  %".4" = getelementptr [18 x i8], [18 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".7" = sext i8 5 to i16
  store i16 %".7", i16* %"intVar"
  %".9" = load i16, i16* %"intVar"
  %".10" = load i16, i16* %"intVar"
  %".11" = icmp eq i16 %".9", %".10"
  store i1 %".11", i1* %"resVar"
  %".13" = alloca [18 x i8]
  store [18 x i8] c"intVar == intVar\0a\00", [18 x i8]* %".13"
  %".15" = getelementptr [18 x i8], [18 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".18" = load i1, i1* %"resVar"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".19" = select  i1 %".18", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".22" = load i16, i16* %"intVar"
  %".23" = sext i8 10 to i16
  %".24" = icmp eq i16 %".22", %".23"
  store i1 %".24", i1* %"resVar"
  %".26" = alloca [14 x i8]
  store [14 x i8] c"intVar == 10\0a\00", [14 x i8]* %".26"
  %".28" = getelementptr [14 x i8], [14 x i8]* %".26", i8 0, i8 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".31" = load i1, i1* %"resVar"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".32" = select  i1 %".31", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".35" = load i16, i16* %"intVar"
  %".36" = sext i8 10 to i16
  %".37" = icmp ne i16 %".35", %".36"
  store i1 %".37", i1* %"resVar"
  %".39" = alloca [14 x i8]
  store [14 x i8] c"intVar != 10\0a\00", [14 x i8]* %".39"
  %".41" = getelementptr [14 x i8], [14 x i8]* %".39", i8 0, i8 0
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".44" = load i1, i1* %"resVar"
  %"true_value_str_ptr.2" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.2" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".45" = select  i1 %".44", i8* %"true_value_str_ptr.2", i8* %"false_value_str_ptr.2"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".47" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".48" = load i16, i16* %"intVar"
  %".49" = load i16, i16* %"intVar"
  %".50" = icmp sgt i16 %".48", %".49"
  store i1 %".50", i1* %"resVar"
  %".52" = alloca [17 x i8]
  store [17 x i8] c"intVar > intVar\0a\00", [17 x i8]* %".52"
  %".54" = getelementptr [17 x i8], [17 x i8]* %".52", i8 0, i8 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".57" = load i1, i1* %"resVar"
  %"true_value_str_ptr.3" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.3" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".58" = select  i1 %".57", i8* %"true_value_str_ptr.3", i8* %"false_value_str_ptr.3"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".60" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".61" = load i16, i16* %"intVar"
  %".62" = load i16, i16* %"intVar"
  %".63" = icmp slt i16 %".61", %".62"
  store i1 %".63", i1* %"resVar"
  %".65" = alloca [17 x i8]
  store [17 x i8] c"intVar < intVar\0a\00", [17 x i8]* %".65"
  %".67" = getelementptr [17 x i8], [17 x i8]* %".65", i8 0, i8 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".70" = load i1, i1* %"resVar"
  %"true_value_str_ptr.4" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.4" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".71" = select  i1 %".70", i8* %"true_value_str_ptr.4", i8* %"false_value_str_ptr.4"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".71")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".74" = load i16, i16* %"intVar"
  %".75" = load i16, i16* %"intVar"
  %".76" = icmp sge i16 %".74", %".75"
  store i1 %".76", i1* %"resVar"
  %".78" = alloca [18 x i8]
  store [18 x i8] c"intVar >= intVar\0a\00", [18 x i8]* %".78"
  %".80" = getelementptr [18 x i8], [18 x i8]* %".78", i8 0, i8 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".80")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".82" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".83" = load i1, i1* %"resVar"
  %"true_value_str_ptr.5" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.5" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".84" = select  i1 %".83", i8* %"true_value_str_ptr.5", i8* %"false_value_str_ptr.5"
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".84")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".87" = load i16, i16* %"intVar"
  %".88" = load i16, i16* %"intVar"
  %".89" = icmp sle i16 %".87", %".88"
  store i1 %".89", i1* %"resVar"
  %".91" = alloca [18 x i8]
  store [18 x i8] c"intVar <= intVar\0a\00", [18 x i8]* %".91"
  %".93" = getelementptr [18 x i8], [18 x i8]* %".91", i8 0, i8 0
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".93")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".95" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".96" = load i1, i1* %"resVar"
  %"true_value_str_ptr.6" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.6" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".97" = select  i1 %".96", i8* %"true_value_str_ptr.6", i8* %"false_value_str_ptr.6"
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".97")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".100" = alloca [16 x i8]
  store [16 x i8] c"___Bytes tests\0a\00", [16 x i8]* %".100"
  %".102" = getelementptr [16 x i8], [16 x i8]* %".100", i8 0, i8 0
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".102")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".104" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  store i8 200, i8* %"byteVar"
  %".106" = load i8, i8* %"byteVar"
  %".107" = load i8, i8* %"byteVar"
  %".108" = icmp eq i8 %".106", %".107"
  store i1 %".108", i1* %"resVar"
  %".110" = alloca [20 x i8]
  store [20 x i8] c"byteVar == byteVar\0a\00", [20 x i8]* %".110"
  %".112" = getelementptr [20 x i8], [20 x i8]* %".110", i8 0, i8 0
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".112")
  %"end_line_str_ptr.16" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".114" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.16")
  %".115" = load i1, i1* %"resVar"
  %"true_value_str_ptr.7" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.7" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".116" = select  i1 %".115", i8* %"true_value_str_ptr.7", i8* %"false_value_str_ptr.7"
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".116")
  %"end_line_str_ptr.17" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.17")
  %".119" = load i8, i8* %"byteVar"
  %".120" = icmp eq i8 %".119", 10
  store i1 %".120", i1* %"resVar"
  %".122" = alloca [15 x i8]
  store [15 x i8] c"byteVar == 10\0a\00", [15 x i8]* %".122"
  %".124" = getelementptr [15 x i8], [15 x i8]* %".122", i8 0, i8 0
  %".125" = call i32 (i8*, ...) @"printf"(i8* %".124")
  %"end_line_str_ptr.18" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".126" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.18")
  %".127" = load i1, i1* %"resVar"
  %"true_value_str_ptr.8" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.8" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".128" = select  i1 %".127", i8* %"true_value_str_ptr.8", i8* %"false_value_str_ptr.8"
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".128")
  %"end_line_str_ptr.19" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".130" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.19")
  %".131" = load i8, i8* %"byteVar"
  %".132" = icmp ne i8 %".131", 10
  store i1 %".132", i1* %"resVar"
  %".134" = alloca [15 x i8]
  store [15 x i8] c"byteVar != 10\0a\00", [15 x i8]* %".134"
  %".136" = getelementptr [15 x i8], [15 x i8]* %".134", i8 0, i8 0
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136")
  %"end_line_str_ptr.20" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.20")
  %".139" = load i1, i1* %"resVar"
  %"true_value_str_ptr.9" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.9" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".140" = select  i1 %".139", i8* %"true_value_str_ptr.9", i8* %"false_value_str_ptr.9"
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".140")
  %"end_line_str_ptr.21" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".142" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.21")
  %".143" = load i8, i8* %"byteVar"
  %".144" = load i8, i8* %"byteVar"
  %".145" = icmp ugt i8 %".143", %".144"
  store i1 %".145", i1* %"resVar"
  %".147" = alloca [19 x i8]
  store [19 x i8] c"byteVar > byteVar\0a\00", [19 x i8]* %".147"
  %".149" = getelementptr [19 x i8], [19 x i8]* %".147", i8 0, i8 0
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".149")
  %"end_line_str_ptr.22" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".151" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.22")
  %".152" = load i1, i1* %"resVar"
  %"true_value_str_ptr.10" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.10" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".153" = select  i1 %".152", i8* %"true_value_str_ptr.10", i8* %"false_value_str_ptr.10"
  %".154" = call i32 (i8*, ...) @"printf"(i8* %".153")
  %"end_line_str_ptr.23" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".155" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.23")
  %".156" = load i8, i8* %"byteVar"
  %".157" = load i8, i8* %"byteVar"
  %".158" = icmp ult i8 %".156", %".157"
  store i1 %".158", i1* %"resVar"
  %".160" = alloca [19 x i8]
  store [19 x i8] c"byteVar < byteVar\0a\00", [19 x i8]* %".160"
  %".162" = getelementptr [19 x i8], [19 x i8]* %".160", i8 0, i8 0
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".162")
  %"end_line_str_ptr.24" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".164" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.24")
  %".165" = load i1, i1* %"resVar"
  %"true_value_str_ptr.11" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.11" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".166" = select  i1 %".165", i8* %"true_value_str_ptr.11", i8* %"false_value_str_ptr.11"
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".166")
  %"end_line_str_ptr.25" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".168" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.25")
  %".169" = load i8, i8* %"byteVar"
  %".170" = load i8, i8* %"byteVar"
  %".171" = icmp uge i8 %".169", %".170"
  store i1 %".171", i1* %"resVar"
  %".173" = alloca [20 x i8]
  store [20 x i8] c"byteVar >= byteVar\0a\00", [20 x i8]* %".173"
  %".175" = getelementptr [20 x i8], [20 x i8]* %".173", i8 0, i8 0
  %".176" = call i32 (i8*, ...) @"printf"(i8* %".175")
  %"end_line_str_ptr.26" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".177" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.26")
  %".178" = load i1, i1* %"resVar"
  %"true_value_str_ptr.12" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.12" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".179" = select  i1 %".178", i8* %"true_value_str_ptr.12", i8* %"false_value_str_ptr.12"
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".179")
  %"end_line_str_ptr.27" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".181" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.27")
  %".182" = load i8, i8* %"byteVar"
  %".183" = load i8, i8* %"byteVar"
  %".184" = icmp ule i8 %".182", %".183"
  store i1 %".184", i1* %"resVar"
  %".186" = alloca [20 x i8]
  store [20 x i8] c"byteVar <= byteVar\0a\00", [20 x i8]* %".186"
  %".188" = getelementptr [20 x i8], [20 x i8]* %".186", i8 0, i8 0
  %".189" = call i32 (i8*, ...) @"printf"(i8* %".188")
  %"end_line_str_ptr.28" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".190" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.28")
  %".191" = load i1, i1* %"resVar"
  %"true_value_str_ptr.13" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.13" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".192" = select  i1 %".191", i8* %"true_value_str_ptr.13", i8* %"false_value_str_ptr.13"
  %".193" = call i32 (i8*, ...) @"printf"(i8* %".192")
  %"end_line_str_ptr.29" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".194" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.29")
  %".195" = alloca [16 x i8]
  store [16 x i8] c"___Float tests\0a\00", [16 x i8]* %".195"
  %".197" = getelementptr [16 x i8], [16 x i8]* %".195", i8 0, i8 0
  %".198" = call i32 (i8*, ...) @"printf"(i8* %".197")
  %"end_line_str_ptr.30" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".199" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.30")
  store float 0x4034032620000000, float* %"floatVar"
  %".201" = load float, float* %"floatVar"
  %".202" = load float, float* %"floatVar"
  %".203" = fcmp oeq float %".201", %".202"
  store i1 %".203", i1* %"resVar"
  %".205" = alloca [22 x i8]
  store [22 x i8] c"floatVar == floatVar\0a\00", [22 x i8]* %".205"
  %".207" = getelementptr [22 x i8], [22 x i8]* %".205", i8 0, i8 0
  %".208" = call i32 (i8*, ...) @"printf"(i8* %".207")
  %"end_line_str_ptr.31" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".209" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.31")
  %".210" = load i1, i1* %"resVar"
  %"true_value_str_ptr.14" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.14" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".211" = select  i1 %".210", i8* %"true_value_str_ptr.14", i8* %"false_value_str_ptr.14"
  %".212" = call i32 (i8*, ...) @"printf"(i8* %".211")
  %"end_line_str_ptr.32" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".213" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.32")
  %".214" = load float, float* %"floatVar"
  %".215" = fcmp oeq float %".214", 0x4024800000000000
  store i1 %".215", i1* %"resVar"
  %".217" = alloca [19 x i8]
  store [19 x i8] c"floatVar == 10.25\0a\00", [19 x i8]* %".217"
  %".219" = getelementptr [19 x i8], [19 x i8]* %".217", i8 0, i8 0
  %".220" = call i32 (i8*, ...) @"printf"(i8* %".219")
  %"end_line_str_ptr.33" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".221" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.33")
  %".222" = load i1, i1* %"resVar"
  %"true_value_str_ptr.15" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.15" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".223" = select  i1 %".222", i8* %"true_value_str_ptr.15", i8* %"false_value_str_ptr.15"
  %".224" = call i32 (i8*, ...) @"printf"(i8* %".223")
  %"end_line_str_ptr.34" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".225" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.34")
  %".226" = load float, float* %"floatVar"
  %".227" = fcmp one float %".226", 0x4024800000000000
  store i1 %".227", i1* %"resVar"
  %".229" = alloca [19 x i8]
  store [19 x i8] c"floatVar != 10.25\0a\00", [19 x i8]* %".229"
  %".231" = getelementptr [19 x i8], [19 x i8]* %".229", i8 0, i8 0
  %".232" = call i32 (i8*, ...) @"printf"(i8* %".231")
  %"end_line_str_ptr.35" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".233" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.35")
  %".234" = load i1, i1* %"resVar"
  %"true_value_str_ptr.16" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.16" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".235" = select  i1 %".234", i8* %"true_value_str_ptr.16", i8* %"false_value_str_ptr.16"
  %".236" = call i32 (i8*, ...) @"printf"(i8* %".235")
  %"end_line_str_ptr.36" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".237" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.36")
  %".238" = load float, float* %"floatVar"
  %".239" = load float, float* %"floatVar"
  %".240" = fcmp ogt float %".238", %".239"
  store i1 %".240", i1* %"resVar"
  %".242" = alloca [21 x i8]
  store [21 x i8] c"floatVar > floatVar\0a\00", [21 x i8]* %".242"
  %".244" = getelementptr [21 x i8], [21 x i8]* %".242", i8 0, i8 0
  %".245" = call i32 (i8*, ...) @"printf"(i8* %".244")
  %"end_line_str_ptr.37" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".246" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.37")
  %".247" = load i1, i1* %"resVar"
  %"true_value_str_ptr.17" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.17" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".248" = select  i1 %".247", i8* %"true_value_str_ptr.17", i8* %"false_value_str_ptr.17"
  %".249" = call i32 (i8*, ...) @"printf"(i8* %".248")
  %"end_line_str_ptr.38" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".250" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.38")
  %".251" = load float, float* %"floatVar"
  %".252" = load float, float* %"floatVar"
  %".253" = fcmp olt float %".251", %".252"
  store i1 %".253", i1* %"resVar"
  %".255" = alloca [21 x i8]
  store [21 x i8] c"floatVar < floatVar\0a\00", [21 x i8]* %".255"
  %".257" = getelementptr [21 x i8], [21 x i8]* %".255", i8 0, i8 0
  %".258" = call i32 (i8*, ...) @"printf"(i8* %".257")
  %"end_line_str_ptr.39" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".259" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.39")
  %".260" = load i1, i1* %"resVar"
  %"true_value_str_ptr.18" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.18" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".261" = select  i1 %".260", i8* %"true_value_str_ptr.18", i8* %"false_value_str_ptr.18"
  %".262" = call i32 (i8*, ...) @"printf"(i8* %".261")
  %"end_line_str_ptr.40" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".263" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.40")
  %".264" = load float, float* %"floatVar"
  %".265" = load float, float* %"floatVar"
  %".266" = fcmp oge float %".264", %".265"
  store i1 %".266", i1* %"resVar"
  %".268" = alloca [22 x i8]
  store [22 x i8] c"floatVar >= floatVar\0a\00", [22 x i8]* %".268"
  %".270" = getelementptr [22 x i8], [22 x i8]* %".268", i8 0, i8 0
  %".271" = call i32 (i8*, ...) @"printf"(i8* %".270")
  %"end_line_str_ptr.41" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".272" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.41")
  %".273" = load i1, i1* %"resVar"
  %"true_value_str_ptr.19" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.19" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".274" = select  i1 %".273", i8* %"true_value_str_ptr.19", i8* %"false_value_str_ptr.19"
  %".275" = call i32 (i8*, ...) @"printf"(i8* %".274")
  %"end_line_str_ptr.42" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".276" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.42")
  %".277" = load float, float* %"floatVar"
  %".278" = load float, float* %"floatVar"
  %".279" = fcmp ole float %".277", %".278"
  store i1 %".279", i1* %"resVar"
  %".281" = alloca [22 x i8]
  store [22 x i8] c"floatVar <= floatVar\0a\00", [22 x i8]* %".281"
  %".283" = getelementptr [22 x i8], [22 x i8]* %".281", i8 0, i8 0
  %".284" = call i32 (i8*, ...) @"printf"(i8* %".283")
  %"end_line_str_ptr.43" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".285" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.43")
  %".286" = load i1, i1* %"resVar"
  %"true_value_str_ptr.20" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.20" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".287" = select  i1 %".286", i8* %"true_value_str_ptr.20", i8* %"false_value_str_ptr.20"
  %".288" = call i32 (i8*, ...) @"printf"(i8* %".287")
  %"end_line_str_ptr.44" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".289" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.44")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]