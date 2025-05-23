; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"byteVar" = alloca i8
  %".2" = alloca [18 x i8]
  store [18 x i8] c"___Integer tests\0a\00", [18 x i8]* %".2"
  %".4" = getelementptr [18 x i8], [18 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".7" = sext i8 101 to i16
  store i16 %".7", i16* %"intVar"
  %".9" = load i16, i16* %"intVar"
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i16 %".9")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".15" = alloca [13 x i8]
  store [13 x i8] c"intVar or 2\0a\00", [13 x i8]* %".15"
  %".17" = getelementptr [13 x i8], [13 x i8]* %".15", i8 0, i8 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".20" = load i16, i16* %"intVar"
  %".21" = sext i8 2 to i16
  %".22" = or i16 %".20", %".21"
  store i16 %".22", i16* %"intVar"
  %".24" = load i16, i16* %"intVar"
  %".25" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".25"
  %".27" = getelementptr [4 x i8], [4 x i8]* %".25", i8 0, i8 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i16 %".24")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".30" = alloca [15 x i8]
  store [15 x i8] c"intVar and 83\0a\00", [15 x i8]* %".30"
  %".32" = getelementptr [15 x i8], [15 x i8]* %".30", i8 0, i8 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".35" = load i16, i16* %"intVar"
  %".36" = sext i8 83 to i16
  %".37" = and i16 %".35", %".36"
  store i16 %".37", i16* %"intVar"
  %".39" = load i16, i16* %"intVar"
  %".40" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".40"
  %".42" = getelementptr [4 x i8], [4 x i8]* %".40", i8 0, i8 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i16 %".39")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".45" = alloca [14 x i8]
  store [14 x i8] c"intVar shl 2\0a\00", [14 x i8]* %".45"
  %".47" = getelementptr [14 x i8], [14 x i8]* %".45", i8 0, i8 0
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".50" = load i16, i16* %"intVar"
  %".51" = sext i8 2 to i16
  %".52" = shl i16 %".50", %".51"
  store i16 %".52", i16* %"intVar"
  %".54" = load i16, i16* %"intVar"
  %".55" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".55"
  %".57" = getelementptr [4 x i8], [4 x i8]* %".55", i8 0, i8 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", i16 %".54")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".60" = alloca [14 x i8]
  store [14 x i8] c"intVar shr 2\0a\00", [14 x i8]* %".60"
  %".62" = getelementptr [14 x i8], [14 x i8]* %".60", i8 0, i8 0
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".62")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".65" = load i16, i16* %"intVar"
  %".66" = sext i8 2 to i16
  %".67" = lshr i16 %".65", %".66"
  store i16 %".67", i16* %"intVar"
  %".69" = load i16, i16* %"intVar"
  %".70" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".70"
  %".72" = getelementptr [4 x i8], [4 x i8]* %".70", i8 0, i8 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72", i16 %".69")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".75" = alloca [12 x i8]
  store [12 x i8] c"not intVar\0a\00", [12 x i8]* %".75"
  %".77" = getelementptr [12 x i8], [12 x i8]* %".75", i8 0, i8 0
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".77")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".80" = load i16, i16* %"intVar"
  store i16 %".80", i16* %"intVar"
  %".82" = load i16, i16* %"intVar"
  %".83" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".83"
  %".85" = getelementptr [4 x i8], [4 x i8]* %".83", i8 0, i8 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".85", i16 %".82")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".87" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".88" = alloca [30 x i8]
  store [30 x i8] c"___Byte (unsigned int) tests\0a\00", [30 x i8]* %".88"
  %".90" = getelementptr [30 x i8], [30 x i8]* %".88", i8 0, i8 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %".90")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".92" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  store i8 101, i8* %"byteVar"
  %".94" = load i8, i8* %"byteVar"
  %".95" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".95"
  %".97" = getelementptr [5 x i8], [5 x i8]* %".95", i8 0, i8 0
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".97", i8 %".94")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".100" = alloca [14 x i8]
  store [14 x i8] c"byteVar or 2\0a\00", [14 x i8]* %".100"
  %".102" = getelementptr [14 x i8], [14 x i8]* %".100", i8 0, i8 0
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".102")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".104" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".105" = load i8, i8* %"byteVar"
  %".106" = or i8 %".105", 2
  store i8 %".106", i8* %"byteVar"
  %".108" = load i8, i8* %"byteVar"
  %".109" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".109"
  %".111" = getelementptr [5 x i8], [5 x i8]* %".109", i8 0, i8 0
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".111", i8 %".108")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".113" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".114" = alloca [16 x i8]
  store [16 x i8] c"byteVar and 83\0a\00", [16 x i8]* %".114"
  %".116" = getelementptr [16 x i8], [16 x i8]* %".114", i8 0, i8 0
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".116")
  %"end_line_str_ptr.16" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.16")
  %".119" = load i8, i8* %"byteVar"
  %".120" = and i8 %".119", 83
  store i8 %".120", i8* %"byteVar"
  %".122" = load i8, i8* %"byteVar"
  %".123" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".123"
  %".125" = getelementptr [5 x i8], [5 x i8]* %".123", i8 0, i8 0
  %".126" = call i32 (i8*, ...) @"printf"(i8* %".125", i8 %".122")
  %"end_line_str_ptr.17" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".127" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.17")
  %".128" = alloca [15 x i8]
  store [15 x i8] c"byteVar shl 1\0a\00", [15 x i8]* %".128"
  %".130" = getelementptr [15 x i8], [15 x i8]* %".128", i8 0, i8 0
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".130")
  %"end_line_str_ptr.18" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".132" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.18")
  %".133" = load i8, i8* %"byteVar"
  %".134" = shl i8 %".133", 1
  store i8 %".134", i8* %"byteVar"
  %".136" = load i8, i8* %"byteVar"
  %".137" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".137"
  %".139" = getelementptr [5 x i8], [5 x i8]* %".137", i8 0, i8 0
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".139", i8 %".136")
  %"end_line_str_ptr.19" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".141" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.19")
  %".142" = alloca [15 x i8]
  store [15 x i8] c"byteVar shr 2\0a\00", [15 x i8]* %".142"
  %".144" = getelementptr [15 x i8], [15 x i8]* %".142", i8 0, i8 0
  %".145" = call i32 (i8*, ...) @"printf"(i8* %".144")
  %"end_line_str_ptr.20" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".146" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.20")
  %".147" = load i8, i8* %"byteVar"
  %".148" = lshr i8 %".147", 1
  store i8 %".148", i8* %"byteVar"
  %".150" = load i8, i8* %"byteVar"
  %".151" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".151"
  %".153" = getelementptr [5 x i8], [5 x i8]* %".151", i8 0, i8 0
  %".154" = call i32 (i8*, ...) @"printf"(i8* %".153", i8 %".150")
  %"end_line_str_ptr.21" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".155" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.21")
  %".156" = alloca [13 x i8]
  store [13 x i8] c"not byteVar\0a\00", [13 x i8]* %".156"
  %".158" = getelementptr [13 x i8], [13 x i8]* %".156", i8 0, i8 0
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".158")
  %"end_line_str_ptr.22" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".160" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.22")
  %".161" = load i8, i8* %"byteVar"
  store i8 %".161", i8* %"byteVar"
  %".163" = load i8, i8* %"byteVar"
  %".164" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".164"
  %".166" = getelementptr [5 x i8], [5 x i8]* %".164", i8 0, i8 0
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".166", i8 %".163")
  %"end_line_str_ptr.23" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".168" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.23")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]