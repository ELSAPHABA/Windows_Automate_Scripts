@echo off

:: 1. 관리자 권한을 확인하고, 없으면 권한을 요청하여 다시 실행합니다.
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Administrator permissions are required. Attempting to elevate...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: 2. 현재 배치 파일이 있는 디렉토리로 이동합니다.
cd /d "%~dp0"

:: 3. 'start' 명령어로 새 PowerShell 7 창을 띄우고 gemini를 실행합니다.
:: -NoExit 옵션으로 gemini 실행 후에도 창이 닫히지 않도록 합니다.
echo Launching a new PowerShell 7 window and running 'gemini'...
start "PowerShell 7 - Gemini" pwsh -NoExit -Command "gemini"