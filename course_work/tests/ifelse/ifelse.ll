; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"floatVar" = alloca float
  store float 0x40147e7d20000000, float* %"floatVar"
  %".3" = sext i8 5 to i16
  store i16 %".3", i16* %"intVar"
  %".5" = alloca [12 x i8]
  store [12 x i8] c"intVar = 5\0a\00", [12 x i8]* %".5"
  %".7" = getelementptr [12 x i8], [12 x i8]* %".5", i8 0, i8 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".10" = load i16, i16* %"intVar"
  %".11" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".11"
  %".13" = getelementptr [4 x i8], [4 x i8]* %".11", i8 0, i8 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i16 %".10")
  %"end_line_str_ptr.1" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.1")
  %".16" = alloca [29 x i8]
  store [29 x i8] c"Single line then intVar * 2\0a\00", [29 x i8]* %".16"
  %".18" = getelementptr [29 x i8], [29 x i8]* %".16", i8 0, i8 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %"end_line_str_ptr.2" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.2")
  %".21" = load i16, i16* %"intVar"
  %".22" = load float, float* %"floatVar"
  %".23" = sitofp i16 %".21" to float
  %".24" = fcmp olt float %".23", %".22"
  br i1 %".24", label %"then", label %"else"
then:
  %".26" = load i16, i16* %"intVar"
  %".27" = sext i8 2 to i16
  %".28" = mul i16 %".26", %".27"
  store i16 %".28", i16* %"intVar"
  br label %"end"
else:
  br label %"end"
end:
  %".32" = load i16, i16* %"intVar"
  %".33" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".33"
  %".35" = getelementptr [4 x i8], [4 x i8]* %".33", i8 0, i8 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", i16 %".32")
  %"end_line_str_ptr.3" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.3")
  %".38" = alloca [29 x i8]
  store [29 x i8] c"Single line else intVar * 2\0a\00", [29 x i8]* %".38"
  %".40" = getelementptr [29 x i8], [29 x i8]* %".38", i8 0, i8 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %"end_line_str_ptr.4" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".42" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.4")
  %".43" = load i16, i16* %"intVar"
  %".44" = load float, float* %"floatVar"
  %".45" = sitofp i16 %".43" to float
  %".46" = fcmp olt float %".45", %".44"
  br i1 %".46", label %"then.1", label %"else.1"
then.1:
  %".48" = load i16, i16* %"intVar"
  %".49" = sext i8 5 to i16
  %".50" = mul i16 %".48", %".49"
  store i16 %".50", i16* %"intVar"
  br label %"end.1"
else.1:
  %".53" = load i16, i16* %"intVar"
  %".54" = sext i8 2 to i16
  %".55" = mul i16 %".53", %".54"
  store i16 %".55", i16* %"intVar"
  br label %"end.1"
end.1:
  %".58" = load i16, i16* %"intVar"
  %".59" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".59"
  %".61" = getelementptr [4 x i8], [4 x i8]* %".59", i8 0, i8 0
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".61", i16 %".58")
  %"end_line_str_ptr.5" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".63" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.5")
  %".64" = alloca [16 x i8]
  store [16 x i8] c"Multiline test\0a\00", [16 x i8]* %".64"
  %".66" = getelementptr [16 x i8], [16 x i8]* %".64", i8 0, i8 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66")
  %"end_line_str_ptr.6" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.6")
  store float 0x4049400000000000, float* %"floatVar"
  %".70" = load i16, i16* %"intVar"
  %".71" = load float, float* %"floatVar"
  %".72" = sitofp i16 %".70" to float
  %".73" = fcmp olt float %".72", %".71"
  br i1 %".73", label %"then.2", label %"else.2"
then.2:
  %".75" = alloca [6 x i8]
  store [6 x i8] c"then\0a\00", [6 x i8]* %".75"
  %".77" = getelementptr [6 x i8], [6 x i8]* %".75", i8 0, i8 0
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".77")
  %"end_line_str_ptr.7" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".79" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.7")
  %".80" = load i16, i16* %"intVar"
  %".81" = sext i8 5 to i16
  %".82" = mul i16 %".80", %".81"
  store i16 %".82", i16* %"intVar"
  br label %"end.2"
else.2:
  br label %"end.2"
end.2:
  %".86" = load i16, i16* %"intVar"
  %".87" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".87"
  %".89" = getelementptr [4 x i8], [4 x i8]* %".87", i8 0, i8 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".89", i16 %".86")
  %"end_line_str_ptr.8" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.8")
  %".92" = alloca [16 x i8]
  store [16 x i8] c"Multiline test\0a\00", [16 x i8]* %".92"
  %".94" = getelementptr [16 x i8], [16 x i8]* %".92", i8 0, i8 0
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".94")
  %"end_line_str_ptr.9" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.9")
  %".97" = load i16, i16* %"intVar"
  %".98" = load float, float* %"floatVar"
  %".99" = sitofp i16 %".97" to float
  %".100" = fcmp olt float %".99", %".98"
  br i1 %".100", label %"then.3", label %"else.3"
then.3:
  %".102" = alloca [6 x i8]
  store [6 x i8] c"then\0a\00", [6 x i8]* %".102"
  %".104" = getelementptr [6 x i8], [6 x i8]* %".102", i8 0, i8 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104")
  %"end_line_str_ptr.10" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.10")
  %".107" = load i16, i16* %"intVar"
  %".108" = sext i8 2 to i16
  %".109" = mul i16 %".107", %".108"
  store i16 %".109", i16* %"intVar"
  br label %"end.3"
else.3:
  %".112" = alloca [6 x i8]
  store [6 x i8] c"else\0a\00", [6 x i8]* %".112"
  %".114" = getelementptr [6 x i8], [6 x i8]* %".112", i8 0, i8 0
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".114")
  %"end_line_str_ptr.11" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".116" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.11")
  %".117" = load i16, i16* %"intVar"
  %".118" = sext i8 2 to i16
  %".119" = mul i16 %".117", %".118"
  store i16 %".119", i16* %"intVar"
  br label %"end.3"
end.3:
  %".122" = load i16, i16* %"intVar"
  %".123" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".123"
  %".125" = getelementptr [4 x i8], [4 x i8]* %".123", i8 0, i8 0
  %".126" = call i32 (i8*, ...) @"printf"(i8* %".125", i16 %".122")
  %"end_line_str_ptr.12" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".127" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.12")
  %".128" = alloca [27 x i8]
  store [27 x i8] c"then else singleline test\0a\00", [27 x i8]* %".128"
  %".130" = getelementptr [27 x i8], [27 x i8]* %".128", i8 0, i8 0
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".130")
  %"end_line_str_ptr.13" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".132" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.13")
  %".133" = load i16, i16* %"intVar"
  %".134" = icmp slt i16 %".133", 1000
  br i1 %".134", label %"then.4", label %"else.4"
then.4:
  %".136" = load i16, i16* %"intVar"
  %".137" = sext i8 1 to i16
  %".138" = icmp slt i16 %".136", %".137"
  br i1 %".138", label %"then.5", label %"else.5"
else.4:
  %".146" = load i16, i16* %"intVar"
  %".147" = sext i8 1 to i16
  %".148" = icmp slt i16 %".146", %".147"
  br i1 %".148", label %"then.6", label %"else.6"
end.4:
  %".155" = load i16, i16* %"intVar"
  %".156" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".156"
  %".158" = getelementptr [4 x i8], [4 x i8]* %".156", i8 0, i8 0
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".158", i16 %".155")
  %"end_line_str_ptr.14" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".160" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.14")
  %".161" = alloca [27 x i8]
  store [27 x i8] c"else then singleline test\0a\00", [27 x i8]* %".161"
  %".163" = getelementptr [27 x i8], [27 x i8]* %".161", i8 0, i8 0
  %".164" = call i32 (i8*, ...) @"printf"(i8* %".163")
  %"end_line_str_ptr.15" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".165" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.15")
  %".166" = load i16, i16* %"intVar"
  %".167" = sext i8 0 to i16
  %".168" = icmp slt i16 %".166", %".167"
  br i1 %".168", label %"then.7", label %"else.7"
then.5:
  store i16 10000, i16* %"intVar"
  br label %"end.5"
else.5:
  %".142" = sext i8 1 to i16
  store i16 %".142", i16* %"intVar"
  br label %"end.5"
end.5:
  br label %"end.4"
then.6:
  store i16 -10000, i16* %"intVar"
  br label %"end.6"
else.6:
  store i16 -5, i16* %"intVar"
  br label %"end.6"
end.6:
  br label %"end.4"
then.7:
  %".170" = load i16, i16* %"intVar"
  %".171" = sext i8 1 to i16
  %".172" = icmp slt i16 %".170", %".171"
  br i1 %".172", label %"then.8", label %"else.8"
else.7:
  %".180" = load i16, i16* %"intVar"
  %".181" = sext i8 1 to i16
  %".182" = icmp eq i16 %".180", %".181"
  br i1 %".182", label %"then.9", label %"else.9"
end.7:
  %".189" = load i16, i16* %"intVar"
  %".190" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".190"
  %".192" = getelementptr [4 x i8], [4 x i8]* %".190", i8 0, i8 0
  %".193" = call i32 (i8*, ...) @"printf"(i8* %".192", i16 %".189")
  %"end_line_str_ptr.16" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".194" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.16")
  %".195" = alloca [31 x i8]
  store [31 x i8] c"then else then multiline test\0a\00", [31 x i8]* %".195"
  %".197" = getelementptr [31 x i8], [31 x i8]* %".195", i8 0, i8 0
  %".198" = call i32 (i8*, ...) @"printf"(i8* %".197")
  %"end_line_str_ptr.17" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".199" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.17")
  %".200" = load i16, i16* %"intVar"
  %".201" = sext i8 0 to i16
  %".202" = icmp slt i16 %".200", %".201"
  br i1 %".202", label %"then.10", label %"else.10"
then.8:
  store i16 10000, i16* %"intVar"
  br label %"end.8"
else.8:
  %".176" = sext i8 1 to i16
  store i16 %".176", i16* %"intVar"
  br label %"end.8"
end.8:
  br label %"end.7"
then.9:
  store i16 -10000, i16* %"intVar"
  br label %"end.9"
else.9:
  store i16 -5, i16* %"intVar"
  br label %"end.9"
end.9:
  br label %"end.7"
then.10:
  %".204" = alloca [6 x i8]
  store [6 x i8] c"then\0a\00", [6 x i8]* %".204"
  %".206" = getelementptr [6 x i8], [6 x i8]* %".204", i8 0, i8 0
  %".207" = call i32 (i8*, ...) @"printf"(i8* %".206")
  %"end_line_str_ptr.18" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".208" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.18")
  %".209" = load i16, i16* %"intVar"
  %".210" = icmp slt i16 %".209", -20000
  br i1 %".210", label %"then.11", label %"else.11"
else.10:
  %".244" = load i16, i16* %"intVar"
  %".245" = sext i8 1 to i16
  %".246" = icmp eq i16 %".244", %".245"
  br i1 %".246", label %"then.13", label %"else.13"
end.10:
  %".253" = load i16, i16* %"intVar"
  %".254" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".254"
  %".256" = getelementptr [4 x i8], [4 x i8]* %".254", i8 0, i8 0
  %".257" = call i32 (i8*, ...) @"printf"(i8* %".256", i16 %".253")
  %"end_line_str_ptr.23" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".258" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.23")
  ret void
then.11:
  %".212" = alloca [6 x i8]
  store [6 x i8] c"then\0a\00", [6 x i8]* %".212"
  %".214" = getelementptr [6 x i8], [6 x i8]* %".212", i8 0, i8 0
  %".215" = call i32 (i8*, ...) @"printf"(i8* %".214")
  %"end_line_str_ptr.19" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".216" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.19")
  store i16 10000, i16* %"intVar"
  br label %"end.11"
else.11:
  %".219" = alloca [6 x i8]
  store [6 x i8] c"else\0a\00", [6 x i8]* %".219"
  %".221" = getelementptr [6 x i8], [6 x i8]* %".219", i8 0, i8 0
  %".222" = call i32 (i8*, ...) @"printf"(i8* %".221")
  %"end_line_str_ptr.20" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".223" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.20")
  %".224" = load i16, i16* %"intVar"
  %".225" = icmp sgt i16 %".224", -15000
  br i1 %".225", label %"then.12", label %"else.12"
end.11:
  br label %"end.10"
then.12:
  %".227" = alloca [6 x i8]
  store [6 x i8] c"then\0a\00", [6 x i8]* %".227"
  %".229" = getelementptr [6 x i8], [6 x i8]* %".227", i8 0, i8 0
  %".230" = call i32 (i8*, ...) @"printf"(i8* %".229")
  %"end_line_str_ptr.21" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".231" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.21")
  %".232" = sext i8 1 to i16
  store i16 %".232", i16* %"intVar"
  br label %"end.12"
else.12:
  %".235" = alloca [5 x i8]
  store [5 x i8] c"else\00", [5 x i8]* %".235"
  %".237" = getelementptr [5 x i8], [5 x i8]* %".235", i8 0, i8 0
  %".238" = call i32 (i8*, ...) @"printf"(i8* %".237")
  %"end_line_str_ptr.22" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".239" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr.22")
  store i16 -1, i16* %"intVar"
  br label %"end.12"
end.12:
  br label %"end.11"
then.13:
  store i16 -10000, i16* %"intVar"
  br label %"end.13"
else.13:
  store i16 -5, i16* %"intVar"
  br label %"end.13"
end.13:
  br label %"end.10"
}

declare i32 @"printf"(i8* %".1", ...)

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]