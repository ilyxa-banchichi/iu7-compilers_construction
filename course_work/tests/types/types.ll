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
  %".9" = sub i16 0, 32768
  store i16 %".9", i16* %"intVar"
  %".11" = load i16, i16* %"intVar"
  %".12" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".12"
  %".14" = getelementptr [4 x i8], [4 x i8]* %".12", i8 0, i8 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i16 %".11")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".17" = sext i8 7 to i16
  store i16 %".17", i16* %"intVar"
  %".19" = load i16, i16* %"intVar"
  %".20" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".20"
  %".22" = getelementptr [4 x i8], [4 x i8]* %".20", i8 0, i8 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i16 %".19")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  store i32 2147483647, i32* %"longintVar"
  %".26" = load i32, i32* %"longintVar"
  %".27" = alloca [3 x i8]
  store [3 x i8] c"%d\00", [3 x i8]* %".27"
  %".29" = getelementptr [3 x i8], [3 x i8]* %".27", i8 0, i8 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".26")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".32" = sub i32 0, 2147483648
  store i32 %".32", i32* %"longintVar"
  %".34" = load i32, i32* %"longintVar"
  %".35" = alloca [3 x i8]
  store [3 x i8] c"%d\00", [3 x i8]* %".35"
  %".37" = getelementptr [3 x i8], [3 x i8]* %".35", i8 0, i8 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".34")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".39" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  store i8 255, i8* %"byteVar"
  %".41" = load i8, i8* %"byteVar"
  %".42" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".42"
  %".44" = getelementptr [5 x i8], [5 x i8]* %".42", i8 0, i8 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", i8 %".41")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  store float 0x3ff028f5c0000000, float* %"floatVar"
  %".48" = load float, float* %"floatVar"
  %".49" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".49"
  %".51" = getelementptr [3 x i8], [3 x i8]* %".49", i8 0, i8 0
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51", float %".48")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".54" = sitofp i8 5 to float
  store float %".54", float* %"floatVar"
  %".56" = load float, float* %"floatVar"
  %".57" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".57"
  %".59" = getelementptr [3 x i8], [3 x i8]* %".57", i8 0, i8 0
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59", float %".56")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".62" = fpext float 0x406ea3f360000000 to double
  store double %".62", double* %"doubleVar"
  %".64" = load double, double* %"doubleVar"
  %".65" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".65"
  %".67" = getelementptr [3 x i8], [3 x i8]* %".65", i8 0, i8 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67", double %".64")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  store i1 1, i1* %"booleanVar"
  %".71" = load i1, i1* %"booleanVar"
  %"true_value_str_ptr" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".72" = select  i1 %".71", i8* %"true_value_str_ptr", i8* %"false_value_str_ptr"
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  store i1 0, i1* %"booleanVar"
  %".76" = load i1, i1* %"booleanVar"
  %"true_value_str_ptr.1" = getelementptr inbounds [5 x i8], [5 x i8]* @"true_value_str", i32 0, i32 0
  %"false_value_str_ptr.1" = getelementptr inbounds [6 x i8], [6 x i8]* @"false_value_str", i32 0, i32 0
  %".77" = select  i1 %".76", i8* %"true_value_str_ptr.1", i8* %"false_value_str_ptr.1"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".77")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  store [255 x i8] c"B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".81" = load [255 x i8], [255 x i8]* %"strVar"
  %".82" = alloca [255 x i8]
  store [255 x i8] %".81", [255 x i8]* %".82"
  %".84" = getelementptr [255 x i8], [255 x i8]* %".82", i8 0, i8 0
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".84")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  store [255 x i8] c"Hello world\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".88" = load [255 x i8], [255 x i8]* %"strVar"
  %".89" = alloca [255 x i8]
  store [255 x i8] %".88", [255 x i8]* %".89"
  %".91" = getelementptr [255 x i8], [255 x i8]* %".89", i8 0, i8 0
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".91")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".93" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  store [255 x i8] c"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\00", [255 x i8]* %"strVar"
  %".95" = load [255 x i8], [255 x i8]* %"strVar"
  %".96" = alloca [255 x i8]
  store [255 x i8] %".95", [255 x i8]* %".96"
  %".98" = getelementptr [255 x i8], [255 x i8]* %".96", i8 0, i8 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".98")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".100" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  store i8 90, i8* %"charVar"
  %".102" = load i8, i8* %"charVar"
  %".103" = alloca [3 x i8]
  store [3 x i8] c"%c\00", [3 x i8]* %".103"
  %".105" = getelementptr [3 x i8], [3 x i8]* %".103", i8 0, i8 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", i8 %".102")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".107" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
@"true_value_str" = internal constant [5 x i8] [i8 116, i8 114, i8 117, i8 101, i8 0]
@"false_value_str" = internal constant [6 x i8] [i8 102, i8 97, i8 108, i8 115, i8 101, i8 0]