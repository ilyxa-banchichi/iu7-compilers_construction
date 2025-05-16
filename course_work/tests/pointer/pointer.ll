; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TRec" = type {i16, float, float}
define void @"main"()
{
entry:
  %"vInt" = alloca i16
  %"pInt" = alloca i16*
  %"pPerson" = alloca %"TRec"*
  %"vPerson" = alloca %"TRec"
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
  store float 0x4034000000000000, float* %".37"
  %".39" = getelementptr %"TRec", %"TRec"* %"vPerson", i32 0, i32 2
  store float 0x403e000000000000, float* %".39"
  %".41" = load %"TRec"*, %"TRec"** %"pPerson"
  %".42" = getelementptr %"TRec", %"TRec"* %".41", i32 0, i32 2
  %".43" = load float, float* %".42"
  %".44" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".44"
  %".46" = getelementptr [3 x i8], [3 x i8]* %".44", i8 0, i8 0
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".46", float %".43")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".48" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".49" = load i16*, i16** %"pInt"
  %".50" = load i16, i16* %".49"
  %".51" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".51"
  %".53" = getelementptr [4 x i8], [4 x i8]* %".51", i8 0, i8 0
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53", i16 %".50")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]