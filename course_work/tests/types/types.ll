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
  %".4" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".4"
  %".6" = getelementptr [5 x i8], [5 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i16 %".3")
  %".8" = sub i16 0, 32768
  store i16 %".8", i16* %"intVar"
  %".10" = load i16, i16* %"intVar"
  %".11" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".11"
  %".13" = getelementptr [5 x i8], [5 x i8]* %".11", i8 0, i8 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i16 %".10")
  store i16 7, i16* %"intVar"
  %".16" = load i16, i16* %"intVar"
  %".17" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".17"
  %".19" = getelementptr [5 x i8], [5 x i8]* %".17", i8 0, i8 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i16 %".16")
  store i32 2147483647, i32* %"longintVar"
  %".22" = load i32, i32* %"longintVar"
  %".23" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".23"
  %".25" = getelementptr [4 x i8], [4 x i8]* %".23", i8 0, i8 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".22")
  %".27" = sub i32 0, 2147483648
  store i32 %".27", i32* %"longintVar"
  %".29" = load i32, i32* %"longintVar"
  %".30" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".30"
  %".32" = getelementptr [4 x i8], [4 x i8]* %".30", i8 0, i8 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".29")
  store i8 255, i8* %"byteVar"
  %".35" = load i8, i8* %"byteVar"
  %".36" = alloca [6 x i8]
  store [6 x i8] c"%hhu\0a\00", [6 x i8]* %".36"
  %".38" = getelementptr [6 x i8], [6 x i8]* %".36", i8 0, i8 0
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", i8 %".35")
  store float 0x3ff028f5c0000000, float* %"floatVar"
  %".41" = load float, float* %"floatVar"
  %".42" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".42"
  %".44" = getelementptr [4 x i8], [4 x i8]* %".42", i8 0, i8 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44", float %".41")
  store float 0x4014000000000000, float* %"floatVar"
  %".47" = load float, float* %"floatVar"
  %".48" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".48"
  %".50" = getelementptr [4 x i8], [4 x i8]* %".48", i8 0, i8 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", float %".47")
  store double 0x406ea3f35ba6e72c, double* %"doubleVar"
  %".53" = load double, double* %"doubleVar"
  %".54" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".54"
  %".56" = getelementptr [4 x i8], [4 x i8]* %".54", i8 0, i8 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", double %".53")
  store i1 1, i1* %"booleanVar"
  %".59" = load i1, i1* %"booleanVar"
  %".60" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".60"
  %".62" = getelementptr [4 x i8], [4 x i8]* %".60", i8 0, i8 0
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".62", i1 %".59")
  store i1 0, i1* %"booleanVar"
  %".65" = load i1, i1* %"booleanVar"
  %".66" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".66"
  %".68" = getelementptr [4 x i8], [4 x i8]* %".66", i8 0, i8 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68", i1 %".65")
  store [255 x i8] c"B\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".71" = load [255 x i8], [255 x i8]* %"strVar"
  %".72" = alloca [255 x i8]
  store [255 x i8] %".71", [255 x i8]* %".72"
  %".74" = getelementptr [255 x i8], [255 x i8]* %".72", i8 0, i8 0
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74")
  store [255 x i8] c"Hello world\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %"strVar"
  %".77" = load [255 x i8], [255 x i8]* %"strVar"
  %".78" = alloca [255 x i8]
  store [255 x i8] %".77", [255 x i8]* %".78"
  %".80" = getelementptr [255 x i8], [255 x i8]* %".78", i8 0, i8 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".80")
  store [255 x i8] c"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\0a\00", [255 x i8]* %"strVar"
  %".83" = load [255 x i8], [255 x i8]* %"strVar"
  %".84" = alloca [255 x i8]
  store [255 x i8] %".83", [255 x i8]* %".84"
  %".86" = getelementptr [255 x i8], [255 x i8]* %".84", i8 0, i8 0
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".86")
  store i8 90, i8* %"charVar"
  %".89" = load i8, i8* %"charVar"
  %".90" = alloca [4 x i8]
  store [4 x i8] c"%c\0a\00", [4 x i8]* %".90"
  %".92" = getelementptr [4 x i8], [4 x i8]* %".90", i8 0, i8 0
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".92", i8 %".89")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)
