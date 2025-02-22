; ModuleID = ""
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %".2" = bitcast [2 x i8]* @"str" to i8*
  call void @"print"(i8* %".2")
  ret void
}

declare void @"print"(i8* %".1")

@"str" = global [2 x i8] [i8 53, i8 0]