; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TVector3" = type {float, float, float}
define void @"main"()
{
entry:
  %"A" = alloca float
  %"B" = alloca float
  %"C" = alloca float
  %"D" = alloca float
  %"P0" = alloca %"TVector3"
  %"d" = alloca %"TVector3"
  %"t" = alloca float
  %"intersection" = alloca %"TVector3"
  %"denominator" = alloca float
  %"numerator" = alloca float
  %".2" = sitofp i8 1 to float
  store float %".2", float* %"A"
  %".4" = sitofp i8 2 to float
  store float %".4", float* %"B"
  %".6" = sitofp i8 3 to float
  store float %".6", float* %"C"
  %".8" = sub i8 0, 6
  %".9" = sitofp i8 %".8" to float
  store float %".9", float* %"D"
  %".11" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".12" = sitofp i8 1 to float
  store float %".12", float* %".11"
  %".14" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".15" = sitofp i8 1 to float
  store float %".15", float* %".14"
  %".17" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".18" = sitofp i8 1 to float
  store float %".18", float* %".17"
  %".20" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".21" = sitofp i8 1 to float
  store float %".21", float* %".20"
  %".23" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".24" = sitofp i8 1 to float
  store float %".24", float* %".23"
  %".26" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".27" = sitofp i8 1 to float
  store float %".27", float* %".26"
  %".29" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".30" = load float, float* %"A"
  %".31" = load float, float* %".29"
  %".32" = fmul float %".30", %".31"
  %".33" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".34" = load float, float* %"B"
  %".35" = load float, float* %".33"
  %".36" = fmul float %".34", %".35"
  %".37" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".38" = load float, float* %"C"
  %".39" = load float, float* %".37"
  %".40" = fmul float %".38", %".39"
  %".41" = load float, float* %"D"
  %".42" = fadd float %".40", %".41"
  %".43" = fadd float %".36", %".42"
  %".44" = fadd float %".32", %".43"
  %".45" = fsub float              0x0, %".44"
  store float %".45", float* %"numerator"
  %".47" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".48" = load float, float* %"A"
  %".49" = load float, float* %".47"
  %".50" = fmul float %".48", %".49"
  %".51" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".52" = load float, float* %"B"
  %".53" = load float, float* %".51"
  %".54" = fmul float %".52", %".53"
  %".55" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".56" = load float, float* %"C"
  %".57" = load float, float* %".55"
  %".58" = fmul float %".56", %".57"
  %".59" = fadd float %".54", %".58"
  %".60" = fadd float %".50", %".59"
  store float %".60", float* %"denominator"
  %".62" = load float, float* %"denominator"
  %".63" = sitofp i8 0 to float
  %".64" = fcmp oeq float %".62", %".63"
  br i1 %".64", label %"then", label %"else"
then:
  %".66" = load float, float* %"numerator"
  %".67" = sitofp i8 0 to float
  %".68" = fcmp oeq float %".66", %".67"
  br i1 %".68", label %"then.1", label %"else.1"
else:
  %".83" = load float, float* %"numerator"
  %".84" = load float, float* %"denominator"
  %".85" = fdiv float %".83", %".84"
  store float %".85", float* %"t"
  %".87" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".88" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".89" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".90" = load float, float* %"t"
  %".91" = load float, float* %".89"
  %".92" = fmul float %".90", %".91"
  %".93" = load float, float* %".88"
  %".94" = fadd float %".93", %".92"
  store float %".94", float* %".87"
  %".96" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".97" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".98" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".99" = load float, float* %"t"
  %".100" = load float, float* %".98"
  %".101" = fmul float %".99", %".100"
  %".102" = load float, float* %".97"
  %".103" = fadd float %".102", %".101"
  store float %".103", float* %".96"
  %".105" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".106" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".107" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".108" = load float, float* %"t"
  %".109" = load float, float* %".107"
  %".110" = fmul float %".108", %".109"
  %".111" = load float, float* %".106"
  %".112" = fadd float %".111", %".110"
  store float %".112", float* %".105"
  %".114" = alloca [21 x i8]
  store [21 x i8] c"Intersection point:\0a\00", [21 x i8]* %".114"
  %".116" = getelementptr [21 x i8], [21 x i8]* %".114", i8 0, i8 0
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".116")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".119" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".120" = load float, float* %".119"
  %".121" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".121"
  %".123" = getelementptr [3 x i8], [3 x i8]* %".121", i8 0, i8 0
  %".124" = call i32 (i8*, ...) @"printf"(i8* %".123", float %".120")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".125" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".126" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".127" = load float, float* %".126"
  %".128" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".128"
  %".130" = getelementptr [3 x i8], [3 x i8]* %".128", i8 0, i8 0
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".130", float %".127")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".132" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".133" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".134" = load float, float* %".133"
  %".135" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".135"
  %".137" = getelementptr [3 x i8], [3 x i8]* %".135", i8 0, i8 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %".137", float %".134")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".139" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  br label %"end"
end:
  ret void
then.1:
  %".70" = alloca [6 x i8]
  store [6 x i8] c"Legit\00", [6 x i8]* %".70"
  %".72" = getelementptr [6 x i8], [6 x i8]* %".70", i8 0, i8 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  br label %"end.1"
else.1:
  %".76" = alloca [13 x i8]
  store [13 x i8] c"Is parrallel\00", [13 x i8]* %".76"
  %".78" = getelementptr [13 x i8], [13 x i8]* %".76", i8 0, i8 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".78")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".80" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  br label %"end.1"
end.1:
  br label %"end"
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]