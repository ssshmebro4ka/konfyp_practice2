@echo off
setlocal

set SRC_DIR=src
set OUT_DIR=out
set MAIN_CLASS=Main
set CONFIG=%1
if "%CONFIG%"=="" set CONFIG=config.json

echo Компиляция...
if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

dir /s /b "%SRC_DIR%\*.java" > sources.txt
javac -encoding UTF-8 -d "%OUT_DIR%" @sources.txt
if errorlevel 1 (
    echo Ошибка компиляции.
    del sources.txt
    exit /b 1
)
del sources.txt

echo Запуск...
java -cp "%OUT_DIR%" %MAIN_CLASS% %CONFIG%

endlocal