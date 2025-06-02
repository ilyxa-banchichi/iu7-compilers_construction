#!/bin/bash

COMPILE_MODE=false
RUN_MODE=false

while getopts "cr" opt; do
  case $opt in
    c)
      COMPILE_MODE=true
      ;;
    r)
      COMPILE_MODE=true
      RUN_MODE=true
      ;;
    *)
      echo "Использование: $0 [-c] [-r] <имя_файла>"
      exit 1
      ;;
  esac
done

shift $((OPTIND -1))

if [ $# -lt 1 ]; then
  echo "Использование: $0 [-c] [-r] <имя_файла>"
  exit 1
fi

FILENAME="$1"
dirpath=$(dirname "$FILENAME")
basename_only=$(basename "$FILENAME")
filename_no_ext="${basename_only%.*}"
outdir="${dirpath}/${filename_no_ext}"

mkdir -p "$outdir"

if [ "$COMPILE_MODE" = true ]; then
  python3 code_generator.py "$FILENAME" "$outdir"
  TARGET_TRIPLE=$(clang -v 2>&1 | grep ^Target: | awk '{print $2}')

  if [ -z "$TARGET_TRIPLE" ]; then
    echo "Could not determine target triple"
    exit 1
  fi

  echo "Using target triple: $TARGET_TRIPLE"

  llc -O3 -mtriple="$TARGET_TRIPLE" "$outdir/$filename_no_ext.ll" -o "$outdir/$filename_no_ext.s"
  if [ $? -ne 0 ]; then
    echo "llc failed"
    exit 1
  fi

  mkdir -p "$outdir/bin"
  clang "$outdir/$filename_no_ext.s" -o "$outdir/bin/$filename_no_ext"
  if [ $? -ne 0 ]; then
    echo "clang failed"
    exit 1
  fi

  echo "Executable created: ./$outdir/bin/$filename_no_ext"
  if [ "$RUN_MODE" = true ]; then
    ./"$outdir/bin/$filename_no_ext"
  fi
else
  python3 executor.py "$FILENAME" "$outdir"
fi

exit 0