; ModuleID = "pascal_program"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"main"()
{
entry:
  %"intVar" = alloca i16
  %"longintVar" = alloca i32
  %"byteVar" = alloca i8
  %"booleanVar" = alloca i1
  %"charVar" = alloca i8
  %"floatVar" = alloca float
  %"doubleVar" = alloca double
  ret void
}

declare i32 @"printf"(i8* %".1", ...)
