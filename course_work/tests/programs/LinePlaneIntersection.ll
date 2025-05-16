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
  %".8" = sitofp i16 -6 to float
  store float %".8", float* %"D"
  %".10" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".11" = sitofp i8 1 to float
  store float %".11", float* %".10"
  %".13" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".14" = sitofp i8 1 to float
  store float %".14", float* %".13"
  %".16" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".17" = sitofp i8 1 to float
  store float %".17", float* %".16"
  %".19" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".20" = sitofp i8 1 to float
  store float %".20", float* %".19"
  %".22" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".23" = sitofp i8 1 to float
  store float %".23", float* %".22"
  %".25" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".26" = sitofp i8 1 to float
  store float %".26", float* %".25"
  %".28" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".29" = load float, float* %"A"
  %".30" = load float, float* %".28"
  %".31" = fmul float %".29", %".30"
  %".32" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".33" = load float, float* %"B"
  %".34" = load float, float* %".32"
  %".35" = fmul float %".33", %".34"
  %".36" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".37" = load float, float* %"C"
  %".38" = load float, float* %".36"
  %".39" = fmul float %".37", %".38"
  %".40" = load float, float* %"D"
  %".41" = fadd float %".39", %".40"
  %".42" = fadd float %".35", %".41"
  %".43" = fadd float %".31", %".42"
  %".44" = fsub float              0x0, %".43"
  store float %".44", float* %"numerator"
  %".46" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".47" = load float, float* %"A"
  %".48" = load float, float* %".46"
  %".49" = fmul float %".47", %".48"
  %".50" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".51" = load float, float* %"B"
  %".52" = load float, float* %".50"
  %".53" = fmul float %".51", %".52"
  %".54" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".55" = load float, float* %"C"
  %".56" = load float, float* %".54"
  %".57" = fmul float %".55", %".56"
  %".58" = fadd float %".53", %".57"
  %".59" = fadd float %".49", %".58"
  store float %".59", float* %"denominator"
  %".61" = load float, float* %"denominator"
  %".62" = sitofp i8 0 to float
  %".63" = fcmp oeq float %".61", %".62"
  br i1 %".63", label %"then", label %"else"
then:
  %".65" = load float, float* %"numerator"
  %".66" = sitofp i8 0 to float
  %".67" = fcmp oeq float %".65", %".66"
  br i1 %".67", label %"then.1", label %"else.1"
else:
  %".82" = load float, float* %"numerator"
  %".83" = load float, float* %"denominator"
  %".84" = fdiv float %".82", %".83"
  store float %".84", float* %"t"
  %".86" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".87" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".88" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".89" = load float, float* %"t"
  %".90" = load float, float* %".88"
  %".91" = fmul float %".89", %".90"
  %".92" = load float, float* %".87"
  %".93" = fadd float %".92", %".91"
  store float %".93", float* %".86"
  %".95" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".96" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".97" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".98" = load float, float* %"t"
  %".99" = load float, float* %".97"
  %".100" = fmul float %".98", %".99"
  %".101" = load float, float* %".96"
  %".102" = fadd float %".101", %".100"
  store float %".102", float* %".95"
  %".104" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".105" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".106" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".107" = load float, float* %"t"
  %".108" = load float, float* %".106"
  %".109" = fmul float %".107", %".108"
  %".110" = load float, float* %".105"
  %".111" = fadd float %".110", %".109"
  store float %".111", float* %".104"
  %".113" = alloca [21 x i8]
  store [21 x i8] c"Intersection point:\0a\00", [21 x i8]* %".113"
  %".115" = getelementptr [21 x i8], [21 x i8]* %".113", i8 0, i8 0
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".115")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".117" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".118" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".119" = load float, float* %".118"
  %".120" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".120"
  %".122" = getelementptr [3 x i8], [3 x i8]* %".120", i8 0, i8 0
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".122", float %".119")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".124" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".125" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".126" = load float, float* %".125"
  %".127" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".127"
  %".129" = getelementptr [3 x i8], [3 x i8]* %".127", i8 0, i8 0
  %".130" = call i32 (i8*, ...) @"printf"(i8* %".129", float %".126")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".131" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".132" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".133" = load float, float* %".132"
  %".134" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".134"
  %".136" = getelementptr [3 x i8], [3 x i8]* %".134", i8 0, i8 0
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".136", float %".133")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  br label %"end"
end:
  ret void
then.1:
  %".69" = alloca [6 x i8]
  store [6 x i8] c"Legit\00", [6 x i8]* %".69"
  %".71" = getelementptr [6 x i8], [6 x i8]* %".69", i8 0, i8 0
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".71")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  br label %"end.1"
else.1:
  %".75" = alloca [13 x i8]
  store [13 x i8] c"Is parrallel\00", [13 x i8]* %".75"
  %".77" = getelementptr [13 x i8], [13 x i8]* %".75", i8 0, i8 0
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".77")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  br label %"end.1"
end.1:
  br label %"end"
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]