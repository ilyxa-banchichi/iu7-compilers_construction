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
  %".4" = alloca [6 x i8]
  store [6 x i8] c"%hd \0a\00", [6 x i8]* %".4"
  %".6" = getelementptr [6 x i8], [6 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i16 %".3")
  %".8" = load i16, i16* %"intVar"
  %".9" = sub i16 %".8", 32000.0
  store i16 %".9", i16* %"intVar"
  %".11" = load i16, i16* %"intVar"
  %".12" = alloca [6 x i8]
  store [6 x i8] c"%hd \0a\00", [6 x i8]* %".12"
  %".14" = getelementptr [6 x i8], [6 x i8]* %".12", i8 0, i8 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i16 %".11")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)
