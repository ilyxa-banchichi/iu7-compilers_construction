; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TUniversity" = type {[255 x i8], i1}
%"TPerson" = type {[255 x i8], i16, float, float, i1, %"TUniversity"}
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
  store float 0x3ff0000000000000, float* %"A"
  store float 0x4000000000000000, float* %"B"
  store float 0x4008000000000000, float* %"C"
  %".5" = fsub float              0x0, 0x4018000000000000
  store float %".5", float* %"D"
  %".7" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  store float 0x3ff0000000000000, float* %".7"
  %".9" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  store float 0x3ff0000000000000, float* %".9"
  %".11" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  store float 0x3ff0000000000000, float* %".11"
  %".13" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  store float 0x3ff0000000000000, float* %".13"
  %".15" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  store float 0x3ff0000000000000, float* %".15"
  %".17" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  store float 0x3ff0000000000000, float* %".17"
  %".19" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".20" = load float, float* %"A"
  %".21" = load float, float* %".19"
  %".22" = fmul float %".20", %".21"
  %".23" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".24" = load float, float* %"B"
  %".25" = load float, float* %".23"
  %".26" = fmul float %".24", %".25"
  %".27" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".28" = load float, float* %"C"
  %".29" = load float, float* %".27"
  %".30" = fmul float %".28", %".29"
  %".31" = load float, float* %"D"
  %".32" = fadd float %".30", %".31"
  %".33" = fadd float %".26", %".32"
  %".34" = fadd float %".22", %".33"
  %".35" = fsub float              0x0, %".34"
  store float %".35", float* %"numerator"
  %".37" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".38" = load float, float* %"A"
  %".39" = load float, float* %".37"
  %".40" = fmul float %".38", %".39"
  %".41" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".42" = load float, float* %"B"
  %".43" = load float, float* %".41"
  %".44" = fmul float %".42", %".43"
  %".45" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".46" = load float, float* %"C"
  %".47" = load float, float* %".45"
  %".48" = fmul float %".46", %".47"
  %".49" = fadd float %".44", %".48"
  %".50" = fadd float %".40", %".49"
  store float %".50", float* %"denominator"
  %".52" = load float, float* %"denominator"
  %".53" = fcmp oeq float %".52",              0x0
  br i1 %".53", label %"then", label %"else"
then:
  %".55" = load float, float* %"numerator"
  %".56" = fcmp oeq float %".55",              0x0
  br i1 %".56", label %"then.1", label %"else.1"
else:
  %".69" = load float, float* %"numerator"
  %".70" = load float, float* %"denominator"
  %".71" = fdiv float %".69", %".70"
  store float %".71", float* %"t"
  %".73" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".74" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".75" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".76" = load float, float* %"t"
  %".77" = load float, float* %".75"
  %".78" = fmul float %".76", %".77"
  %".79" = load float, float* %".74"
  %".80" = fadd float %".79", %".78"
  store float %".80", float* %".73"
  %".82" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".83" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".84" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".85" = load float, float* %"t"
  %".86" = load float, float* %".84"
  %".87" = fmul float %".85", %".86"
  %".88" = load float, float* %".83"
  %".89" = fadd float %".88", %".87"
  store float %".89", float* %".82"
  %".91" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".92" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".93" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".94" = load float, float* %"t"
  %".95" = load float, float* %".93"
  %".96" = fmul float %".94", %".95"
  %".97" = load float, float* %".92"
  %".98" = fadd float %".97", %".96"
  store float %".98", float* %".91"
  %".100" = alloca [255 x i8]
  store [255 x i8] c"Intersection point:\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".100"
  %".102" = getelementptr [255 x i8], [255 x i8]* %".100", i8 0, i8 0
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".102")
  %".104" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 0
  %".105" = load float, float* %".104"
  %".106" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".106"
  %".108" = getelementptr [4 x i8], [4 x i8]* %".106", i8 0, i8 0
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", float %".105")
  %".110" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".111" = load float, float* %".110"
  %".112" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".112"
  %".114" = getelementptr [4 x i8], [4 x i8]* %".112", i8 0, i8 0
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".114", float %".111")
  %".116" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".117" = load float, float* %".116"
  %".118" = alloca [4 x i8]
  store [4 x i8] c"%f\0a\00", [4 x i8]* %".118"
  %".120" = getelementptr [4 x i8], [4 x i8]* %".118", i8 0, i8 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120", float %".117")
  br label %"end"
end:
  ret void
then.1:
  %".58" = alloca [255 x i8]
  store [255 x i8] c"Legit\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".58"
  %".60" = getelementptr [255 x i8], [255 x i8]* %".58", i8 0, i8 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60")
  br label %"end.1"
else.1:
  %".63" = alloca [255 x i8]
  store [255 x i8] c"Is parrallel\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [255 x i8]* %".63"
  %".65" = getelementptr [255 x i8], [255 x i8]* %".63", i8 0, i8 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".65")
  br label %"end.1"
end.1:
  br label %"end"
}

declare i32 @"printf"(i8* %".1", ...)
