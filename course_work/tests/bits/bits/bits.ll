; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"byteVar" = alloca i8
  %".2" = alloca [17 x i8]
  store [17 x i8] c"___Integer tests\00", [17 x i8]* %".2"
  %".4" = getelementptr [17 x i8], [17 x i8]* %".2", i8 0, i8 0
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
  %".15" = alloca [12 x i8]
  store [12 x i8] c"intVar or 2\00", [12 x i8]* %".15"
  %".17" = getelementptr [12 x i8], [12 x i8]* %".15", i8 0, i8 0
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
  %".30" = alloca [14 x i8]
  store [14 x i8] c"intVar and 83\00", [14 x i8]* %".30"
  %".32" = getelementptr [14 x i8], [14 x i8]* %".30", i8 0, i8 0
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
  %".45" = alloca [13 x i8]
  store [13 x i8] c"intVar shl 2\00", [13 x i8]* %".45"
  %".47" = getelementptr [13 x i8], [13 x i8]* %".45", i8 0, i8 0
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
  %".60" = alloca [13 x i8]
  store [13 x i8] c"intVar shr 2\00", [13 x i8]* %".60"
  %".62" = getelementptr [13 x i8], [13 x i8]* %".60", i8 0, i8 0
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
  %".75" = alloca [11 x i8]
  store [11 x i8] c"not intVar\00", [11 x i8]* %".75"
  %".77" = getelementptr [11 x i8], [11 x i8]* %".75", i8 0, i8 0
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
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]