; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"floatVar" = alloca float
  store float 0x40147e7d20000000, float* %"floatVar"
  store i16 5, i16* %"intVar"
  %".4" = alloca [255 x i8]
  store [255 x i8] c"intVar = 5\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".4"
  %".6" = getelementptr [255 x i8], [255 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = load i16, i16* %"intVar"
  %".9" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".9"
  %".11" = getelementptr [5 x i8], [5 x i8]* %".9", i8 0, i8 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i16 %".8")
  %".13" = alloca [255 x i8]
  store [255 x i8] c"Single line then intVar * 2\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".13"
  %".15" = getelementptr [255 x i8], [255 x i8]* %".13", i8 0, i8 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %".17" = load i16, i16* %"intVar"
  %".18" = load float, float* %"floatVar"
  %".19" = sitofp i16 %".17" to float
  %".20" = fcmp olt float %".19", %".18"
  br i1 %".20", label %"then", label %"else"
then:
  %".22" = load i16, i16* %"intVar"
  %".23" = mul i16 %".22", 2
  store i16 %".23", i16* %"intVar"
  br label %"end"
else:
  br label %"end"
end:
  %".27" = load i16, i16* %"intVar"
  %".28" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".28"
  %".30" = getelementptr [5 x i8], [5 x i8]* %".28", i8 0, i8 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i16 %".27")
  %".32" = alloca [255 x i8]
  store [255 x i8] c"Single line else intVar * 2\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".32"
  %".34" = getelementptr [255 x i8], [255 x i8]* %".32", i8 0, i8 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34")
  %".36" = load i16, i16* %"intVar"
  %".37" = load float, float* %"floatVar"
  %".38" = sitofp i16 %".36" to float
  %".39" = fcmp olt float %".38", %".37"
  br i1 %".39", label %"then.1", label %"else.1"
then.1:
  %".41" = load i16, i16* %"intVar"
  %".42" = mul i16 %".41", 5
  store i16 %".42", i16* %"intVar"
  br label %"end.1"
else.1:
  %".45" = load i16, i16* %"intVar"
  %".46" = mul i16 %".45", 2
  store i16 %".46", i16* %"intVar"
  br label %"end.1"
end.1:
  %".49" = load i16, i16* %"intVar"
  %".50" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".50"
  %".52" = getelementptr [5 x i8], [5 x i8]* %".50", i8 0, i8 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52", i16 %".49")
  %".54" = alloca [255 x i8]
  store [255 x i8] c"Multiline test\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".54"
  %".56" = getelementptr [255 x i8], [255 x i8]* %".54", i8 0, i8 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56")
  store float 0x4049400000000000, float* %"floatVar"
  %".59" = load i16, i16* %"intVar"
  %".60" = load float, float* %"floatVar"
  %".61" = sitofp i16 %".59" to float
  %".62" = fcmp olt float %".61", %".60"
  br i1 %".62", label %"then.2", label %"else.2"
then.2:
  %".64" = alloca [255 x i8]
  store [255 x i8] c"then\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".64"
  %".66" = getelementptr [255 x i8], [255 x i8]* %".64", i8 0, i8 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66")
  %".68" = load i16, i16* %"intVar"
  %".69" = mul i16 %".68", 5
  store i16 %".69", i16* %"intVar"
  br label %"end.2"
else.2:
  br label %"end.2"
end.2:
  %".73" = load i16, i16* %"intVar"
  %".74" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".74"
  %".76" = getelementptr [5 x i8], [5 x i8]* %".74", i8 0, i8 0
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".76", i16 %".73")
  %".78" = alloca [255 x i8]
  store [255 x i8] c"Multiline test\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".78"
  %".80" = getelementptr [255 x i8], [255 x i8]* %".78", i8 0, i8 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".80")
  %".82" = load i16, i16* %"intVar"
  %".83" = load float, float* %"floatVar"
  %".84" = sitofp i16 %".82" to float
  %".85" = fcmp olt float %".84", %".83"
  br i1 %".85", label %"then.3", label %"else.3"
then.3:
  %".87" = alloca [255 x i8]
  store [255 x i8] c"then\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".87"
  %".89" = getelementptr [255 x i8], [255 x i8]* %".87", i8 0, i8 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".89")
  %".91" = load i16, i16* %"intVar"
  %".92" = mul i16 %".91", 2
  store i16 %".92", i16* %"intVar"
  br label %"end.3"
else.3:
  %".95" = alloca [255 x i8]
  store [255 x i8] c"else\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".95"
  %".97" = getelementptr [255 x i8], [255 x i8]* %".95", i8 0, i8 0
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".97")
  %".99" = load i16, i16* %"intVar"
  %".100" = mul i16 %".99", 2
  store i16 %".100", i16* %"intVar"
  br label %"end.3"
end.3:
  %".103" = load i16, i16* %"intVar"
  %".104" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".104"
  %".106" = getelementptr [5 x i8], [5 x i8]* %".104", i8 0, i8 0
  %".107" = call i32 (i8*, ...) @"printf"(i8* %".106", i16 %".103")
  %".108" = alloca [255 x i8]
  store [255 x i8] c"then else singleline test\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".108"
  %".110" = getelementptr [255 x i8], [255 x i8]* %".108", i8 0, i8 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %".110")
  %".112" = load i16, i16* %"intVar"
  %".113" = icmp slt i16 %".112", 1000
  br i1 %".113", label %"then.4", label %"else.4"
then.4:
  %".115" = load i16, i16* %"intVar"
  %".116" = icmp slt i16 %".115", 1
  br i1 %".116", label %"then.5", label %"else.5"
else.4:
  %".123" = load i16, i16* %"intVar"
  %".124" = icmp slt i16 %".123", 1
  br i1 %".124", label %"then.6", label %"else.6"
end.4:
  %".133" = load i16, i16* %"intVar"
  %".134" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".134"
  %".136" = getelementptr [5 x i8], [5 x i8]* %".134", i8 0, i8 0
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", i16 %".133")
  %".138" = alloca [255 x i8]
  store [255 x i8] c"else then singleline test\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".138"
  %".140" = getelementptr [255 x i8], [255 x i8]* %".138", i8 0, i8 0
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".140")
  %".142" = load i16, i16* %"intVar"
  %".143" = icmp slt i16 %".142", 0
  br i1 %".143", label %"then.7", label %"else.7"
then.5:
  store i16 10000, i16* %"intVar"
  br label %"end.5"
else.5:
  store i16 1, i16* %"intVar"
  br label %"end.5"
end.5:
  br label %"end.4"
then.6:
  %".126" = sub i16 0, 10000
  store i16 %".126", i16* %"intVar"
  br label %"end.6"
else.6:
  %".129" = sub i16 0, 5
  store i16 %".129", i16* %"intVar"
  br label %"end.6"
end.6:
  br label %"end.4"
then.7:
  %".145" = load i16, i16* %"intVar"
  %".146" = icmp slt i16 %".145", 1
  br i1 %".146", label %"then.8", label %"else.8"
else.7:
  %".153" = load i16, i16* %"intVar"
  %".154" = icmp eq i16 %".153", 1
  br i1 %".154", label %"then.9", label %"else.9"
end.7:
  %".163" = load i16, i16* %"intVar"
  %".164" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".164"
  %".166" = getelementptr [5 x i8], [5 x i8]* %".164", i8 0, i8 0
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".166", i16 %".163")
  %".168" = alloca [255 x i8]
  store [255 x i8] c"then else then multiline test\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".168"
  %".170" = getelementptr [255 x i8], [255 x i8]* %".168", i8 0, i8 0
  %".171" = call i32 (i8*, ...) @"printf"(i8* %".170")
  %".172" = load i16, i16* %"intVar"
  %".173" = icmp slt i16 %".172", 0
  br i1 %".173", label %"then.10", label %"else.10"
then.8:
  store i16 10000, i16* %"intVar"
  br label %"end.8"
else.8:
  store i16 1, i16* %"intVar"
  br label %"end.8"
end.8:
  br label %"end.7"
then.9:
  %".156" = sub i16 0, 10000
  store i16 %".156", i16* %"intVar"
  br label %"end.9"
else.9:
  %".159" = sub i16 0, 5
  store i16 %".159", i16* %"intVar"
  br label %"end.9"
end.9:
  br label %"end.7"
then.10:
  %".175" = alloca [255 x i8]
  store [255 x i8] c"then\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".175"
  %".177" = getelementptr [255 x i8], [255 x i8]* %".175", i8 0, i8 0
  %".178" = call i32 (i8*, ...) @"printf"(i8* %".177")
  %".179" = load i16, i16* %"intVar"
  %".180" = sub i16 0, 20000
  %".181" = icmp slt i16 %".179", %".180"
  br i1 %".181", label %"then.11", label %"else.11"
else.10:
  %".212" = load i16, i16* %"intVar"
  %".213" = icmp eq i16 %".212", 1
  br i1 %".213", label %"then.13", label %"else.13"
end.10:
  %".222" = load i16, i16* %"intVar"
  %".223" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".223"
  %".225" = getelementptr [5 x i8], [5 x i8]* %".223", i8 0, i8 0
  %".226" = call i32 (i8*, ...) @"printf"(i8* %".225", i16 %".222")
  ret void
then.11:
  %".183" = alloca [255 x i8]
  store [255 x i8] c"then\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".183"
  %".185" = getelementptr [255 x i8], [255 x i8]* %".183", i8 0, i8 0
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".185")
  store i16 10000, i16* %"intVar"
  br label %"end.11"
else.11:
  %".189" = alloca [255 x i8]
  store [255 x i8] c"else\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".189"
  %".191" = getelementptr [255 x i8], [255 x i8]* %".189", i8 0, i8 0
  %".192" = call i32 (i8*, ...) @"printf"(i8* %".191")
  %".193" = load i16, i16* %"intVar"
  %".194" = sub i16 0, 15000
  %".195" = icmp sgt i16 %".193", %".194"
  br i1 %".195", label %"then.12", label %"else.12"
end.11:
  br label %"end.10"
then.12:
  %".197" = alloca [255 x i8]
  store [255 x i8] c"then\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".197"
  %".199" = getelementptr [255 x i8], [255 x i8]* %".197", i8 0, i8 0
  %".200" = call i32 (i8*, ...) @"printf"(i8* %".199")
  store i16 1, i16* %"intVar"
  br label %"end.12"
else.12:
  %".203" = alloca [255 x i8]
  store [255 x i8] c"else\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".203"
  %".205" = getelementptr [255 x i8], [255 x i8]* %".203", i8 0, i8 0
  %".206" = call i32 (i8*, ...) @"printf"(i8* %".205")
  %".207" = sub i16 0, 1
  store i16 %".207", i16* %"intVar"
  br label %"end.12"
end.12:
  br label %"end.11"
then.13:
  %".215" = sub i16 0, 10000
  store i16 %".215", i16* %"intVar"
  br label %"end.13"
else.13:
  %".218" = sub i16 0, 5
  store i16 %".218", i16* %"intVar"
  br label %"end.13"
end.13:
  br label %"end.10"
}

declare i32 @"printf"(i8* %".1", ...)
