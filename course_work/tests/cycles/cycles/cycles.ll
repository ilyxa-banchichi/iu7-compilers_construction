; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"i" = alloca i16
  %"n" = alloca i16
  %"f" = alloca float
  %".2" = sext i8 10 to i16
  store i16 %".2", i16* %"n"
  %".4" = sitofp i8 1 to float
  store float %".4", float* %"f"
  %".6" = alloca [16 x i8]
  store [16 x i8] c"Start for 1 to \00", [16 x i8]* %".6"
  %".8" = getelementptr [16 x i8], [16 x i8]* %".6", i8 0, i8 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  %".10" = load i16, i16* %"n"
  %".11" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".11"
  %".13" = getelementptr [4 x i8], [4 x i8]* %".11", i8 0, i8 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i16 %".10")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".16" = sext i8 1 to i16
  store i16 %".16", i16* %"i"
  br label %"for_cond"
for_cond:
  %".19" = load i16, i16* %"i"
  %".20" = load i16, i16* %"n"
  %".21" = icmp sle i16 %".19", %".20"
  br i1 %".21", label %"for_body", label %"for_exit"
for_body:
  %".23" = load i16, i16* %"i"
  %".24" = sext i8 2 to i16
  %".25" = srem i16 %".23", %".24"
  %".26" = sext i8 0 to i16
  %".27" = icmp eq i16 %".25", %".26"
  br i1 %".27", label %"then", label %"else"
for_exit:
  %".54" = sitofp i8 0 to float
  store float %".54", float* %"f"
  %".56" = sext i8 1 to i16
  store i16 %".56", i16* %"i"
  br label %"while_cond"
then:
  %".29" = load float, float* %"f"
  %".30" = load i16, i16* %"i"
  %".31" = sitofp i16 %".30" to float
  %".32" = fmul float %".29", %".31"
  store float %".32", float* %"f"
  br label %"end"
else:
  %".35" = load float, float* %"f"
  %".36" = load i16, i16* %"i"
  %".37" = sitofp i16 %".36" to float
  %".38" = fdiv float %".35", %".37"
  store float %".38", float* %"f"
  br label %"end"
end:
  %".41" = alloca [5 x i8]
  store [5 x i8] c"f = \00", [5 x i8]* %".41"
  %".43" = getelementptr [5 x i8], [5 x i8]* %".41", i8 0, i8 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".43")
  %".45" = load float, float* %"f"
  %".46" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".46"
  %".48" = getelementptr [3 x i8], [3 x i8]* %".46", i8 0, i8 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", float %".45")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".51" = add i16 %".19", 1
  store i16 %".51", i16* %"i"
  br label %"for_cond"
while_cond:
  %".59" = load float, float* %"f"
  %".60" = sitofp i8 100 to float
  %".61" = fcmp olt float %".59", %".60"
  br i1 %".61", label %"while_body", label %"while_exit"
while_body:
  %".63" = load i16, i16* %"i"
  %".64" = sext i8 2 to i16
  %".65" = mul i16 %".63", %".64"
  store i16 %".65", i16* %"i"
  %".67" = load float, float* %"f"
  %".68" = load i16, i16* %"i"
  %".69" = sitofp i16 %".68" to float
  %".70" = fadd float %".67", %".69"
  store float %".70", float* %"f"
  %".72" = alloca [5 x i8]
  store [5 x i8] c"i = \00", [5 x i8]* %".72"
  %".74" = getelementptr [5 x i8], [5 x i8]* %".72", i8 0, i8 0
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74")
  %".76" = load i16, i16* %"i"
  %".77" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".77"
  %".79" = getelementptr [4 x i8], [4 x i8]* %".77", i8 0, i8 0
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".79", i16 %".76")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  br label %"while_cond"
while_exit:
  %".83" = alloca [7 x i8]
  store [7 x i8] c"Sum = \00", [7 x i8]* %".83"
  %".85" = getelementptr [7 x i8], [7 x i8]* %".83", i8 0, i8 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".85")
  %".87" = load float, float* %"f"
  %".88" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".88"
  %".90" = getelementptr [3 x i8], [3 x i8]* %".88", i8 0, i8 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %".90", float %".87")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".92" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".93" = alloca [14 x i8]
  store [14 x i8] c"Expect = 126\0a\00", [14 x i8]* %".93"
  %".95" = getelementptr [14 x i8], [14 x i8]* %".93", i8 0, i8 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".97" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]