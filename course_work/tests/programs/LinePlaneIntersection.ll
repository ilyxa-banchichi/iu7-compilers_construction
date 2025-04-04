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
  %".19" = load float, float* %"A"
  %".20" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 0
  %".21" = load float, float* %".20"
  %".22" = fmul float %".19", %".21"
  %".23" = load float, float* %"B"
  %".24" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".25" = load float, float* %".24"
  %".26" = fmul float %".23", %".25"
  %".27" = load float, float* %"C"
  %".28" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".29" = load float, float* %".28"
  %".30" = fmul float %".27", %".29"
  %".31" = load float, float* %"D"
  %".32" = fadd float %".30", %".31"
  %".33" = fadd float %".26", %".32"
  %".34" = fadd float %".22", %".33"
  %".35" = fsub float              0x0, %".34"
  store float %".35", float* %"numerator"
  %".37" = load float, float* %"A"
  %".38" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".39" = load float, float* %".38"
  %".40" = fmul float %".37", %".39"
  %".41" = load float, float* %"B"
  %".42" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".43" = load float, float* %".42"
  %".44" = fmul float %".41", %".43"
  %".45" = load float, float* %"C"
  %".46" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".47" = load float, float* %".46"
  %".48" = fmul float %".45", %".47"
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
  %".75" = load float, float* %".74"
  %".76" = load float, float* %"t"
  %".77" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 0
  %".78" = load float, float* %".77"
  %".79" = fmul float %".76", %".78"
  %".80" = fadd float %".75", %".79"
  store float %".80", float* %".73"
  %".82" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 1
  %".83" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 1
  %".84" = load float, float* %".83"
  %".85" = load float, float* %"t"
  %".86" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 1
  %".87" = load float, float* %".86"
  %".88" = fmul float %".85", %".87"
  %".89" = fadd float %".84", %".88"
  store float %".89", float* %".82"
  %".91" = getelementptr %"TVector3", %"TVector3"* %"intersection", i32 0, i32 2
  %".92" = getelementptr %"TVector3", %"TVector3"* %"P0", i32 0, i32 2
  %".93" = load float, float* %".92"
  %".94" = load float, float* %"t"
  %".95" = getelementptr %"TVector3", %"TVector3"* %"d", i32 0, i32 2
  %".96" = load float, float* %".95"
  %".97" = fmul float %".94", %".96"
  %".98" = fadd float %".93", %".97"
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
