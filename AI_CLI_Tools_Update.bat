@echo off
title AI CLI Tools Update (Admin)

:: Check for Admin Privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%cd%"
    CD /D "%~dp0"

:: --- Start Updates ---
echo ==========================================
echo [Admin Mode] Starting AI CLI Tools Update...
echo ==========================================

:: 1. Gemini CLI Update
echo [1/3] Updating @google/gemini-cli...
call npm update -g @google/gemini-cli

:: 2. OpenAI Codex Update
echo [2/3] Updating @openai/codex...
call npm update -g @openai/codex

:: 3. GitHub Copilot Update
echo [3/3] Updating @github/copilot...
call npm update -g @github/copilot

echo ==========================================
echo All updates have been completed!
echo ==========================================
pause