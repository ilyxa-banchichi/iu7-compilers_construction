; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"i" = alloca i16
  %"n" = alloca i16
  %"f" = alloca float
  store i16 10, i16* %"n"
  store float 0x3ff0000000000000, float* %"f"
  %".4" = alloca [255 x i8]
  store [255 x i8] c"Start for 1 to \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".4"
  %".6" = getelementptr [255 x i8], [255 x i8]* %".4", i8 0, i8 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = load i16, i16* %"n"
  %".9" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".9"
  %".11" = getelementptr [5 x i8], [5 x i8]* %".9", i8 0, i8 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i16 %".8")
  %".13" = load i16, i16* %"n"
  store i16 1, i16* %"i"
  br label %"for_cond"
for_cond:
  %".16" = load i16, i16* %"i"
  %".17" = icmp sle i16 %".16", %".13"
  br i1 %".17", label %"for_body", label %"for_exit"
for_body:
  %".19" = load i16, i16* %"i"
  %".20" = srem i16 %".19", 2
  %".21" = icmp eq i16 %".20", 0
  br i1 %".21", label %"then", label %"else"
for_exit:
  store float              0x0, float* %"f"
  store i16 1, i16* %"i"
  br label %"while_cond"
then:
  %".23" = load float, float* %"f"
  %".24" = load i16, i16* %"i"
  %".25" = sitofp i16 %".24" to float
  %".26" = fmul float %".23", %".25"
  store float %".26", float* %"f"
  br label %"end"
else:
  %".29" = load float, float* %"f"
  %".30" = load i16, i16* %"i"
  %".31" = sitofp i16 %".30" to float
  %".32" = fdiv float %".29", %".31"
  store float %".32", float* %"f"
  br label %"end"
end:
  %".35" = alloca [255 x i8]
  store [255 x i8] c"f = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".35"
  %".37" = getelementptr [255 x i8], [255 x i8]* %".35", i8 0, i8 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37")
  %".39" = load float, float* %"f"
  %".40" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".40"
  %".42" = getelementptr [4 x i8], [4 x i8]* %".40", i8 0, i8 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", float %".39")
  %".44" = add i16 %".16", 1
  store i16 %".44", i16* %"i"
  br label %"for_cond"
while_cond:
  %".50" = load float, float* %"f"
  %".51" = fcmp olt float %".50", 0x4059000000000000
  br i1 %".51", label %"while_body", label %"while_exit"
while_body:
  %".53" = load i16, i16* %"i"
  %".54" = mul i16 %".53", 2
  store i16 %".54", i16* %"i"
  %".56" = load float, float* %"f"
  %".57" = load i16, i16* %"i"
  %".58" = sitofp i16 %".57" to float
  %".59" = fadd float %".56", %".58"
  store float %".59", float* %"f"
  %".61" = alloca [255 x i8]
  store [255 x i8] c"i = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".61"
  %".63" = getelementptr [255 x i8], [255 x i8]* %".61", i8 0, i8 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63")
  %".65" = load i16, i16* %"i"
  %".66" = alloca [5 x i8]
  store [5 x i8] c"%hd\0a\00", [5 x i8]* %".66"
  %".68" = getelementptr [5 x i8], [5 x i8]* %".66", i8 0, i8 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68", i16 %".65")
  br label %"while_cond"
while_exit:
  %".71" = alloca [255 x i8]
  store [255 x i8] c"Sum = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".71"
  %".73" = getelementptr [255 x i8], [255 x i8]* %".71", i8 0, i8 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73")
  %".75" = load float, float* %"f"
  %".76" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".76"
  %".78" = getelementptr [4 x i8], [4 x i8]* %".76", i8 0, i8 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".78", float %".75")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)
