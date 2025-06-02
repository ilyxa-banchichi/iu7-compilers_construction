#!/bin/bash

ANTLR_JAR="utils/antlr-4.13.2-complete.jar"

if [[ ! -f "$ANTLR_JAR" ]]; then
    echo "Ошибка: JAR-файл ANTLR не найден по пути $ANTLR_JAR"
    exit 1
fi

java -jar "$ANTLR_JAR" -Dlanguage=Python3 -visitor Pascal.g4

if [[ $? -eq 0 ]]; then
    echo "Генерация завершена успешно!"
else
    echo "Ошибка при генерации парсера."
    exit 1
fi