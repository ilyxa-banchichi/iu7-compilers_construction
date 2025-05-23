; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"longintVar" = alloca i32
  %"byteVar" = alloca i8
  %"floatVar" = alloca float
  %"doubleVar" = alloca double
  %"booleanVar" = alloca i1
  %"strVar" = alloca [255 x i8]
  %"charVar" = alloca i8
  store i16 32767, i16* %"intVar"
  %".3" = load i16, i16* %"intVar"
  %".4" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".4"
  %".6" = getelementptr [4 x i8], [4 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i16 %".3")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  store i16 -32768, i16* %"intVar"
  %".10" = load i16, i16* %"intVar"
  %".11" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".11"
  %".13" = getelementptr [4 x i8], [4 x i8]* %".11", i8 0, i8 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i16 %".10")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".16" = sext i8 7 to i16
  store i16 %".16", i16* %"intVar"
  %".18" = load i16, i16* %"intVar"
  %".19" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".19"
  %".21" = getelementptr [4 x i8], [4 x i8]* %".19", i8 0, i8 0
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i16 %".18")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  store i32 2147483647, i32* %"longintVar"
  %".25" = load i32, i32* %"longintVar"
  %".26" = alloca [3 x i8]
  store [3 x i8] c"%d\00", [3 x i8]* %".26"
  %".28" = getelementptr [3 x i8], [3 x i8]* %".26", i8 0, i8 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".25")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  store i32 -2147483648, i32* %"longintVar"
  %".32" = load i32, i32* %"longintVar"
  %".33" = alloca [3 x i8]
  store [3 x i8] c"%d\00", [3 x i8]* %".33"
  %".35" = getelementptr [3 x i8], [3 x i8]* %".33", i8 0, i8 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".32")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  store i8 255, i8* %"byteVar"
  %".39" = load i8, i8* %"byteVar"
  %".40" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".40"
  %".42" = getelementptr [5 x i8], [5 x i8]* %".40", i8 0, i8 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i8 %".39")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  store float 0x3ff028f5c0000000, float* %"floatVar"
  %".46" = load float, float* %"floatVar"
  %".47" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".47"
  %".49" = getelementptr [3 x i8], [3 x i8]* %".47", i8 0, i8 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".49", float %".46")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".52" = sitofp i8 5 to float
  store float %".52", float* %"floatVar"
  %".54" = load float, float* %"floatVar"
  %".55" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".55"
  %".57" = getelementptr [3 x i8], [3 x i8]* %".55", i8 0, i8 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", float %".54")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".60" = fpext float 0x406ea3f360000000 to double
  store double %".60", double* %"doubleVar"
  %".62" = load double, double* %"doubleVar"
  %".63" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".63"
  %".65" = getelementptr [3 x i8], [3 x i8]* %".63", i8 0, i8 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".65", double %".62")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  store i1 1, i1* %"booleanVar"
  %".69" = load i1, i1* %"booleanVar"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".70" = select  i1 %".69", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".72" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  store i1 0, i1* %"booleanVar"
  %".74" = load i1, i1* %"booleanVar"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".75" = select  i1 %".74", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".75")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".77" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  store [255 x i8] c"B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".79" = load [255 x i8], [255 x i8]* %"strVar"
  %".80" = alloca [255 x i8]
  store [255 x i8] %".79", [255 x i8]* %".80"
  %".82" = getelementptr [255 x i8], [255 x i8]* %".80", i8 0, i8 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".84" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  store [255 x i8] c"Hello world\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".86" = load [255 x i8], [255 x i8]* %"strVar"
  %".87" = alloca [255 x i8]
  store [255 x i8] %".86", [255 x i8]* %".87"
  %".89" = getelementptr [255 x i8], [255 x i8]* %".87", i8 0, i8 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".89")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  store [255 x i8] c"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\00", [255 x i8]* %"strVar"
  %".93" = load [255 x i8], [255 x i8]* %"strVar"
  %".94" = alloca [255 x i8]
  store [255 x i8] %".93", [255 x i8]* %".94"
  %".96" = getelementptr [255 x i8], [255 x i8]* %".94", i8 0, i8 0
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".96")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".98" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  store i8 90, i8* %"charVar"
  %".100" = load i8, i8* %"charVar"
  %".101" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".101"
  %".103" = getelementptr [3 x i8], [3 x i8]* %".101", i8 0, i8 0
  %".104" = call i32 (i8*, ...) @"printf"(i8* %".103", i8 %".100")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]