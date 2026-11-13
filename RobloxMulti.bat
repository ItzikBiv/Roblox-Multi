@echo off
if not exist "%~dp0RobloxMulti.ps1" (
    echo ERROR: RobloxMulti.ps1 was not found next to this .bat file.
    echo Check the name is exactly RobloxMulti.ps1 and not RobloxMulti.ps1.txt
    pause
    exit /b
)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0RobloxMulti.ps1"
echo.
echo Script ended.
pause
