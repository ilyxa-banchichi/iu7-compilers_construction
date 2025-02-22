; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

define void @"main"()
{
entry:
  %"x" = alloca i32
  %"y" = alloca i32
  %"z" = alloca i32
  %"res" = alloca i32
  %"neg" = alloca i32
  store i32 10, i32* %"x"
  %".3" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".3"
  %".5" = getelementptr [4 x i8], [4 x i8]* %".3", i8 0, i8 0
  %".6" = load i32, i32* %"x"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".6")
  store i32 20, i32* %"y"
  %".9" = add i32 30, 40
  store i32 %".9", i32* %"z"
  %".11" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".11"
  %".13" = getelementptr [4 x i8], [4 x i8]* %".11", i8 0, i8 0
  %".14" = load i32, i32* %"z"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".14")
  %".16" = load i32, i32* %"x"
  %".17" = add i32 %".16", 100
  store i32 %".17", i32* %"res"
  %".19" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".19"
  %".21" = getelementptr [4 x i8], [4 x i8]* %".19", i8 0, i8 0
  %".22" = load i32, i32* %"res"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".22")
  %".24" = load i32, i32* %"res"
  %".25" = load i32, i32* %"z"
  %".26" = sub i32 %".24", %".25"
  store i32 %".26", i32* %"res"
  %".28" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".28"
  %".30" = getelementptr [4 x i8], [4 x i8]* %".28", i8 0, i8 0
  %".31" = load i32, i32* %"res"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".31")
  %".33" = load i32, i32* %"res"
  %".34" = load i32, i32* %"y"
  %".35" = or i32 %".33", %".34"
  store i32 %".35", i32* %"res"
  %".37" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".37"
  %".39" = getelementptr [4 x i8], [4 x i8]* %".37", i8 0, i8 0
  %".40" = load i32, i32* %"res"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".40")
  %".42" = sub i32 0, 1
  store i32 %".42", i32* %"neg"
  %".44" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".44"
  %".46" = getelementptr [4 x i8], [4 x i8]* %".44", i8 0, i8 0
  %".47" = load i32, i32* %"neg"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".47")
  %".49" = load i32, i32* %"res"
  %".50" = load i32, i32* %"neg"
  %".51" = mul i32 %".49", %".50"
  store i32 %".51", i32* %"res"
  %".53" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".53"
  %".55" = getelementptr [4 x i8], [4 x i8]* %".53", i8 0, i8 0
  %".56" = load i32, i32* %"res"
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".56")
  %".58" = load i32, i32* %"res"
  %".59" = add i32 10, %".58"
  store i32 %".59", i32* %"res"
  %".61" = alloca [4 x i8]
  store [4 x i8] c"%d\0a\00", [4 x i8]* %".61"
  %".63" = getelementptr [4 x i8], [4 x i8]* %".61", i8 0, i8 0
  %".64" = load i32, i32* %"res"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".64")
  ret void
}
