; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

%"TNode" = type {%"TNode"*, i16}
%"PNode" = type {%"TNode"*}
define void @"main"()
{
entry:
  %"head" = alloca %"TNode"*
  %"current" = alloca %"TNode"*
  %"temp" = alloca %"TNode"*
  %"i" = alloca i16
  %"ttt" = alloca %"PNode"
  %".2" = getelementptr inbounds %"TNode", %"TNode"* null, i32 1
  %".3" = ptrtoint %"TNode"* %".2" to i64
  %".4" = call i8* @"malloc"(i64 %".3")
  %".5" = bitcast i8* %".4" to %"TNode"*
  store %"TNode"* %".5", %"TNode"** %"head"
  %".7" = load %"TNode"*, %"TNode"** %"head"
  %".8" = getelementptr %"TNode", %"TNode"* %".7", i32 0, i32 1
  %".9" = sext i8 0 to i16
  store i16 %".9", i16* %".8"
  %".11" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".11", %"TNode"** %"current"
  %".13" = sext i8 1 to i16
  store i16 %".13", i16* %"i"
  br label %"for_cond"
for_cond:
  %".16" = load i16, i16* %"i"
  %".17" = icmp sle i16 %".16", 10
  br i1 %".17", label %"for_body", label %"for_exit"
for_body:
  %".19" = load %"TNode"*, %"TNode"** %"current"
  %".20" = getelementptr %"TNode", %"TNode"* %".19", i32 0, i32 0
  %".21" = getelementptr inbounds %"TNode", %"TNode"* null, i32 1
  %".22" = ptrtoint %"TNode"* %".21" to i64
  %".23" = call i8* @"malloc"(i64 %".22")
  %".24" = bitcast i8* %".23" to %"TNode"*
  store %"TNode"* %".24", %"TNode"** %".20"
  %".26" = load %"TNode"*, %"TNode"** %"current"
  %".27" = getelementptr %"TNode", %"TNode"* %".26", i32 0, i32 0
  %".28" = load %"TNode"*, %"TNode"** %".27"
  %".29" = getelementptr %"TNode", %"TNode"* %".28", i32 0, i32 0
  store %"TNode"* null, %"TNode"** %".29"
  %".31" = load %"TNode"*, %"TNode"** %"current"
  %".32" = getelementptr %"TNode", %"TNode"* %".31", i32 0, i32 0
  %".33" = load %"TNode"*, %"TNode"** %".32"
  %".34" = getelementptr %"TNode", %"TNode"* %".33", i32 0, i32 1
  %".35" = load i16, i16* %"i"
  store i16 %".35", i16* %".34"
  %".37" = load %"TNode"*, %"TNode"** %"current"
  %".38" = getelementptr %"TNode", %"TNode"* %".37", i32 0, i32 0
  %".39" = load %"TNode"*, %"TNode"** %".38"
  store %"TNode"* %".39", %"TNode"** %"current"
  %".41" = add i16 %".16", 1
  store i16 %".41", i16* %"i"
  br label %"for_cond"
for_exit:
  %".44" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".44", %"TNode"** %"current"
  br label %"while_cond"
while_cond:
  %".47" = load %"TNode"*, %"TNode"** %"current"
  %".48" = icmp ne %"TNode"* %".47", null
  br i1 %".48", label %"while_body", label %"while_exit"
while_body:
  %".50" = getelementptr %"PNode", %"PNode"* %"ttt", i32 0, i32 0
  %".51" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".51", %"TNode"** %".50"
  call void @"printNode"(%"PNode"* %"ttt")
  %".54" = load %"TNode"*, %"TNode"** %"current"
  %".55" = getelementptr %"TNode", %"TNode"* %".54", i32 0, i32 0
  %".56" = load %"TNode"*, %"TNode"** %".55"
  store %"TNode"* %".56", %"TNode"** %"current"
  br label %"while_cond"
while_exit:
  %".59" = getelementptr %"PNode", %"PNode"* %"ttt", i32 0, i32 0
  %".60" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".60", %"TNode"** %".59"
  call void @"reverse"(%"PNode"* %"ttt")
  %".63" = getelementptr %"PNode", %"PNode"* %"ttt", i32 0, i32 0
  %".64" = load %"TNode"*, %"TNode"** %".63"
  store %"TNode"* %".64", %"TNode"** %"head"
  %".66" = alloca [17 x i8]
  store [17 x i8] c"___Reserved_____\00", [17 x i8]* %".66"
  %".68" = getelementptr [17 x i8], [17 x i8]* %".66", i8 0, i8 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".70" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  %".71" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".71", %"TNode"** %"current"
  br label %"while_cond.1"
while_cond.1:
  %".74" = load %"TNode"*, %"TNode"** %"current"
  %".75" = icmp ne %"TNode"* %".74", null
  br i1 %".75", label %"while_body.1", label %"while_exit.1"
while_body.1:
  %".77" = getelementptr %"PNode", %"PNode"* %"ttt", i32 0, i32 0
  %".78" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".78", %"TNode"** %".77"
  call void @"printNode"(%"PNode"* %"ttt")
  %".81" = load %"TNode"*, %"TNode"** %"current"
  %".82" = getelementptr %"TNode", %"TNode"* %".81", i32 0, i32 0
  %".83" = load %"TNode"*, %"TNode"** %".82"
  store %"TNode"* %".83", %"TNode"** %"current"
  br label %"while_cond.1"
while_exit.1:
  %".86" = load %"TNode"*, %"TNode"** %"head"
  store %"TNode"* %".86", %"TNode"** %"current"
  br label %"while_cond.2"
while_cond.2:
  %".89" = load %"TNode"*, %"TNode"** %"current"
  %".90" = icmp ne %"TNode"* %".89", null
  br i1 %".90", label %"while_body.2", label %"while_exit.2"
while_body.2:
  %".92" = load %"TNode"*, %"TNode"** %"current"
  %".93" = getelementptr %"TNode", %"TNode"* %".92", i32 0, i32 0
  %".94" = load %"TNode"*, %"TNode"** %".93"
  store %"TNode"* %".94", %"TNode"** %"temp"
  %".96" = getelementptr inbounds %"TNode", %"TNode"* null, i32 1
  %".97" = ptrtoint %"TNode"* %".96" to i64
  %".98" = call i8* @"malloc"(i64 %".97")
  %".99" = bitcast i8* %".98" to %"TNode"*
  store %"TNode"* %".99", %"TNode"** %"current"
  %".101" = load %"TNode"*, %"TNode"** %"temp"
  store %"TNode"* %".101", %"TNode"** %"current"
  br label %"while_cond.2"
while_exit.2:
  ret void
}

declare i32 @"printf"(i8* %".1", ...)

declare i8* @"malloc"(i64 %".1")

declare void @"free"(i8* %".1")

define void @"printNode"(%"PNode"* %"node")
{
entry:
  %".3" = getelementptr %"PNode", %"PNode"* %"node", i32 0, i32 0
  %".4" = load %"TNode"*, %"TNode"** %".3"
  %".5" = getelementptr %"TNode", %"TNode"* %".4", i32 0, i32 1
  %".6" = load i16, i16* %".5"
  %".7" = alloca [4 x i8]
  store [4 x i8] c"%hd\00", [4 x i8]* %".7"
  %".9" = getelementptr [4 x i8], [4 x i8]* %".7", i8 0, i8 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i16 %".6")
  %"end_line_str_ptr" = getelementptr inbounds [2 x i8], [2 x i8]* @"end_line_str", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %"end_line_str_ptr")
  ret void
}

@"end_line_str" = internal constant [2 x i8] [i8 10, i8 0]
define void @"reverse"(%"PNode"* %"head")
{
entry:
  %"prev" = alloca %"TNode"*
  %"current" = alloca %"TNode"*
  %"next" = alloca %"TNode"*
  store %"TNode"* null, %"TNode"** %"prev"
  %".4" = getelementptr %"PNode", %"PNode"* %"head", i32 0, i32 0
  %".5" = load %"TNode"*, %"TNode"** %".4"
  store %"TNode"* %".5", %"TNode"** %"current"
  br label %"while_cond"
while_cond:
  %".8" = load %"TNode"*, %"TNode"** %"current"
  %".9" = icmp ne %"TNode"* %".8", null
  br i1 %".9", label %"while_body", label %"while_exit"
while_body:
  %".11" = load %"TNode"*, %"TNode"** %"current"
  %".12" = getelementptr %"TNode", %"TNode"* %".11", i32 0, i32 0
  %".13" = load %"TNode"*, %"TNode"** %".12"
  store %"TNode"* %".13", %"TNode"** %"next"
  %".15" = load %"TNode"*, %"TNode"** %"current"
  %".16" = getelementptr %"TNode", %"TNode"* %".15", i32 0, i32 0
  %".17" = load %"TNode"*, %"TNode"** %"prev"
  store %"TNode"* %".17", %"TNode"** %".16"
  %".19" = load %"TNode"*, %"TNode"** %"current"
  store %"TNode"* %".19", %"TNode"** %"prev"
  %".21" = load %"TNode"*, %"TNode"** %"next"
  store %"TNode"* %".21", %"TNode"** %"current"
  br label %"while_cond"
while_exit:
  %".24" = getelementptr %"PNode", %"PNode"* %"head", i32 0, i32 0
  %".25" = load %"TNode"*, %"TNode"** %"prev"
  store %"TNode"* %".25", %"TNode"** %".24"
  ret void
}
