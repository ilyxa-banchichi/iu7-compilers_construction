#!/bin/bash

# Указываем путь к JAR-файлу ANTLR
ANTLR_JAR="utils/antlr-4.13.2-complete.jar"

# Проверяем, существует ли JAR-файл
if [[ ! -f "$ANTLR_JAR" ]]; then
    echo "Ошибка: JAR-файл ANTLR не найден по пути $ANTLR_JAR"
    exit 1
fi

# Запускаем генерацию парсера для Python3
java -jar "$ANTLR_JAR" -Dlanguage=Python3 -visitor Pascal.g4

# Проверяем успешность выполнения
if [[ $? -eq 0 ]]; then
    echo "Генерация завершена успешно!"
else
    echo "Ошибка при генерации парсера."
    exit 1
fi