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
  %".2" = alloca [18 x i8]
  store [18 x i8] c"___Integer tests\0a\00", [18 x i8]* %".2"
  %".4" = getelementptr [18 x i8], [18 x i8]* %".2", i8 0, i8 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".7" = sext i8 101 to i16
  store i16 %".7", i16* %"intVar"
  %".9" = load i16, i16* %"intVar"
  %".10" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".10"
  %".12" = getelementptr [4 x i8], [4 x i8]* %".10", i8 0, i8 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i16 %".9")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".15" = alloca [12 x i8]
  store [12 x i8] c"intVar + 2\0a\00", [12 x i8]* %".15"
  %".17" = getelementptr [12 x i8], [12 x i8]* %".15", i8 0, i8 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".20" = load i16, i16* %"intVar"
  %".21" = sext i8 2 to i16
  %".22" = add i16 %".20", %".21"
  store i16 %".22", i16* %"intVar"
  %".24" = load i16, i16* %"intVar"
  %".25" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".25"
  %".27" = getelementptr [4 x i8], [4 x i8]* %".25", i8 0, i8 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i16 %".24")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".30" = alloca [12 x i8]
  store [12 x i8] c"intVar - 1\0a\00", [12 x i8]* %".30"
  %".32" = getelementptr [12 x i8], [12 x i8]* %".30", i8 0, i8 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".35" = load i16, i16* %"intVar"
  %".36" = sext i8 1 to i16
  %".37" = sub i16 %".35", %".36"
  store i16 %".37", i16* %"intVar"
  %".39" = load i16, i16* %"intVar"
  %".40" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".40"
  %".42" = getelementptr [4 x i8], [4 x i8]* %".40", i8 0, i8 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i16 %".39")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".45" = alloca [13 x i8]
  store [13 x i8] c"intVar * 22\0a\00", [13 x i8]* %".45"
  %".47" = getelementptr [13 x i8], [13 x i8]* %".45", i8 0, i8 0
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  %".50" = load i16, i16* %"intVar"
  %".51" = sext i8 22 to i16
  %".52" = mul i16 %".50", %".51"
  store i16 %".52", i16* %"intVar"
  %".54" = load i16, i16* %"intVar"
  %".55" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".55"
  %".57" = getelementptr [4 x i8], [4 x i8]* %".55", i8 0, i8 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", i16 %".54")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".60" = alloca [13 x i8]
  store [13 x i8] c"intVar / 13\0a\00", [13 x i8]* %".60"
  %".62" = getelementptr [13 x i8], [13 x i8]* %".60", i8 0, i8 0
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".62")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".65" = load i16, i16* %"intVar"
  %".66" = sext i8 13 to i16
  %".67" = sitofp i16 %".65" to float
  %".68" = sitofp i16 %".66" to float
  %".69" = fdiv float %".67", %".68"
  store float %".69", float* %"floatVar"
  %".71" = load float, float* %"floatVar"
  %".72" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".72"
  %".74" = getelementptr [3 x i8], [3 x i8]* %".72", i8 0, i8 0
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", float %".71")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".76" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".77" = alloca [15 x i8]
  store [15 x i8] c"intVar div 13\0a\00", [15 x i8]* %".77"
  %".79" = getelementptr [15 x i8], [15 x i8]* %".77", i8 0, i8 0
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".79")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".81" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".82" = load i16, i16* %"intVar"
  %".83" = sext i8 13 to i16
  %".84" = sdiv i16 %".82", %".83"
  store i16 %".84", i16* %"intVar"
  %".86" = load i16, i16* %"intVar"
  %".87" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".87"
  %".89" = getelementptr [4 x i8], [4 x i8]* %".87", i8 0, i8 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".89", i16 %".86")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".92" = alloca [15 x i8]
  store [15 x i8] c"intVar mod 13\0a\00", [15 x i8]* %".92"
  %".94" = getelementptr [15 x i8], [15 x i8]* %".92", i8 0, i8 0
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".94")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".97" = load i16, i16* %"intVar"
  %".98" = sext i8 13 to i16
  %".99" = srem i16 %".97", %".98"
  store i16 %".99", i16* %"intVar"
  %".101" = load i16, i16* %"intVar"
  %".102" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".102"
  %".104" = getelementptr [4 x i8], [4 x i8]* %".102", i8 0, i8 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104", i16 %".101")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".107" = alloca [16 x i8]
  store [16 x i8] c"___Float tests\0a\00", [16 x i8]* %".107"
  %".109" = getelementptr [16 x i8], [16 x i8]* %".107", i8 0, i8 0
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".109")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".112" = sitofp i8 101 to float
  store float %".112", float* %"floatVar"
  %".114" = load float, float* %"floatVar"
  %".115" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".115"
  %".117" = getelementptr [3 x i8], [3 x i8]* %".115", i8 0, i8 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %".117", float %".114")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".119" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".120" = alloca [14 x i8]
  store [14 x i8] c"floatVar + 2\0a\00", [14 x i8]* %".120"
  %".122" = getelementptr [14 x i8], [14 x i8]* %".120", i8 0, i8 0
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".122")
  %"end_line_str_ptr.16" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".124" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.16")
  %".125" = load float, float* %"floatVar"
  %".126" = sitofp i8 2 to float
  %".127" = fadd float %".125", %".126"
  store float %".127", float* %"floatVar"
  %".129" = load float, float* %"floatVar"
  %".130" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".130"
  %".132" = getelementptr [3 x i8], [3 x i8]* %".130", i8 0, i8 0
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".132", float %".129")
  %"end_line_str_ptr.17" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".134" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.17")
  %".135" = alloca [14 x i8]
  store [14 x i8] c"floatVar - 1\0a\00", [14 x i8]* %".135"
  %".137" = getelementptr [14 x i8], [14 x i8]* %".135", i8 0, i8 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %".137")
  %"end_line_str_ptr.18" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".139" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.18")
  %".140" = load float, float* %"floatVar"
  %".141" = sitofp i8 1 to float
  %".142" = fsub float %".140", %".141"
  store float %".142", float* %"floatVar"
  %".144" = load float, float* %"floatVar"
  %".145" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".145"
  %".147" = getelementptr [3 x i8], [3 x i8]* %".145", i8 0, i8 0
  %".148" = call i32 (i8*, ...) @"printf"(i8* %".147", float %".144")
  %"end_line_str_ptr.19" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".149" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.19")
  %".150" = alloca [15 x i8]
  store [15 x i8] c"floatVar * 22\0a\00", [15 x i8]* %".150"
  %".152" = getelementptr [15 x i8], [15 x i8]* %".150", i8 0, i8 0
  %".153" = call i32 (i8*, ...) @"printf"(i8* %".152")
  %"end_line_str_ptr.20" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".154" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.20")
  %".155" = load float, float* %"floatVar"
  %".156" = sitofp i8 22 to float
  %".157" = fmul float %".155", %".156"
  store float %".157", float* %"floatVar"
  %".159" = load float, float* %"floatVar"
  %".160" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".160"
  %".162" = getelementptr [3 x i8], [3 x i8]* %".160", i8 0, i8 0
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".162", float %".159")
  %"end_line_str_ptr.21" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".164" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.21")
  %".165" = alloca [15 x i8]
  store [15 x i8] c"floatVar / 13\0a\00", [15 x i8]* %".165"
  %".167" = getelementptr [15 x i8], [15 x i8]* %".165", i8 0, i8 0
  %".168" = call i32 (i8*, ...) @"printf"(i8* %".167")
  %"end_line_str_ptr.22" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".169" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.22")
  %".170" = load float, float* %"floatVar"
  %".171" = sitofp i8 13 to float
  %".172" = fdiv float %".170", %".171"
  store float %".172", float* %"floatVar"
  %".174" = load float, float* %"floatVar"
  %".175" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".175"
  %".177" = getelementptr [3 x i8], [3 x i8]* %".175", i8 0, i8 0
  %".178" = call i32 (i8*, ...) @"printf"(i8* %".177", float %".174")
  %"end_line_str_ptr.23" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".179" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.23")
  %".180" = alloca [30 x i8]
  store [30 x i8] c"___Byte (unsigned int) tests\0a\00", [30 x i8]* %".180"
  %".182" = getelementptr [30 x i8], [30 x i8]* %".180", i8 0, i8 0
  %".183" = call i32 (i8*, ...) @"printf"(i8* %".182")
  %"end_line_str_ptr.24" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".184" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.24")
  store i8 101, i8* %"byteVar"
  %".186" = load i8, i8* %"byteVar"
  %".187" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".187"
  %".189" = getelementptr [5 x i8], [5 x i8]* %".187", i8 0, i8 0
  %".190" = call i32 (i8*, ...) @"printf"(i8* %".189", i8 %".186")
  %"end_line_str_ptr.25" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".191" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.25")
  %".192" = alloca [12 x i8]
  store [12 x i8] c"intVar + 2\0a\00", [12 x i8]* %".192"
  %".194" = getelementptr [12 x i8], [12 x i8]* %".192", i8 0, i8 0
  %".195" = call i32 (i8*, ...) @"printf"(i8* %".194")
  %"end_line_str_ptr.26" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".196" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.26")
  %".197" = load i8, i8* %"byteVar"
  %".198" = add i8 %".197", 2
  store i8 %".198", i8* %"byteVar"
  %".200" = load i8, i8* %"byteVar"
  %".201" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".201"
  %".203" = getelementptr [5 x i8], [5 x i8]* %".201", i8 0, i8 0
  %".204" = call i32 (i8*, ...) @"printf"(i8* %".203", i8 %".200")
  %"end_line_str_ptr.27" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".205" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.27")
  %".206" = alloca [13 x i8]
  store [13 x i8] c"byteVar - 1\0a\00", [13 x i8]* %".206"
  %".208" = getelementptr [13 x i8], [13 x i8]* %".206", i8 0, i8 0
  %".209" = call i32 (i8*, ...) @"printf"(i8* %".208")
  %"end_line_str_ptr.28" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".210" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.28")
  %".211" = load i8, i8* %"byteVar"
  %".212" = sub i8 %".211", 1
  store i8 %".212", i8* %"byteVar"
  %".214" = load i8, i8* %"byteVar"
  %".215" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".215"
  %".217" = getelementptr [5 x i8], [5 x i8]* %".215", i8 0, i8 0
  %".218" = call i32 (i8*, ...) @"printf"(i8* %".217", i8 %".214")
  %"end_line_str_ptr.29" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".219" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.29")
  %".220" = alloca [13 x i8]
  store [13 x i8] c"byteVar * 2\0a\00", [13 x i8]* %".220"
  %".222" = getelementptr [13 x i8], [13 x i8]* %".220", i8 0, i8 0
  %".223" = call i32 (i8*, ...) @"printf"(i8* %".222")
  %"end_line_str_ptr.30" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".224" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.30")
  %".225" = load i8, i8* %"byteVar"
  %".226" = mul i8 %".225", 2
  store i8 %".226", i8* %"byteVar"
  %".228" = load i8, i8* %"byteVar"
  %".229" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".229"
  %".231" = getelementptr [5 x i8], [5 x i8]* %".229", i8 0, i8 0
  %".232" = call i32 (i8*, ...) @"printf"(i8* %".231", i8 %".228")
  %"end_line_str_ptr.31" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".233" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.31")
  %".234" = alloca [14 x i8]
  store [14 x i8] c"byteVar / 13\0a\00", [14 x i8]* %".234"
  %".236" = getelementptr [14 x i8], [14 x i8]* %".234", i8 0, i8 0
  %".237" = call i32 (i8*, ...) @"printf"(i8* %".236")
  %"end_line_str_ptr.32" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".238" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.32")
  %".239" = load i8, i8* %"byteVar"
  %".240" = uitofp i8 %".239" to float
  %".241" = uitofp i8 13 to float
  %".242" = fdiv float %".240", %".241"
  store float %".242", float* %"floatVar"
  %".244" = load float, float* %"floatVar"
  %".245" = alloca [3 x i8]
  store [3 x i8] c"%f\00", [3 x i8]* %".245"
  %".247" = getelementptr [3 x i8], [3 x i8]* %".245", i8 0, i8 0
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".247", float %".244")
  %"end_line_str_ptr.33" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".249" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.33")
  %".250" = alloca [16 x i8]
  store [16 x i8] c"byteVar div 13\0a\00", [16 x i8]* %".250"
  %".252" = getelementptr [16 x i8], [16 x i8]* %".250", i8 0, i8 0
  %".253" = call i32 (i8*, ...) @"printf"(i8* %".252")
  %"end_line_str_ptr.34" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".254" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.34")
  %".255" = load i8, i8* %"byteVar"
  %".256" = udiv i8 %".255", 13
  store i8 %".256", i8* %"byteVar"
  %".258" = load i8, i8* %"byteVar"
  %".259" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".259"
  %".261" = getelementptr [5 x i8], [5 x i8]* %".259", i8 0, i8 0
  %".262" = call i32 (i8*, ...) @"printf"(i8* %".261", i8 %".258")
  %"end_line_str_ptr.35" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".263" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.35")
  %".264" = alloca [16 x i8]
  store [16 x i8] c"byteVar mod 13\0a\00", [16 x i8]* %".264"
  %".266" = getelementptr [16 x i8], [16 x i8]* %".264", i8 0, i8 0
  %".267" = call i32 (i8*, ...) @"printf"(i8* %".266")
  %"end_line_str_ptr.36" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".268" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.36")
  %".269" = load i8, i8* %"byteVar"
  %".270" = urem i8 %".269", 13
  store i8 %".270", i8* %"byteVar"
  %".272" = load i8, i8* %"byteVar"
  %".273" = alloca [5 x i8]
  store [5 x i8] c"%hhu\00", [5 x i8]* %".273"
  %".275" = getelementptr [5 x i8], [5 x i8]* %".273", i8 0, i8 0
  %".276" = call i32 (i8*, ...) @"printf"(i8* %".275", i8 %".272")
  %"end_line_str_ptr.37" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".277" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.37")
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]