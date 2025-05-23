#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Использование: $0 <имя_файла>"
  exit 1
fi

FILENAME="$1"

python3 executor.py "$FILENAME"