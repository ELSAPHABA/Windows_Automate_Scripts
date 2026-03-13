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
echo [Admin Mode] Starting AI CLI Tools Install...
echo ==========================================

:: 1. Gemini CLI Install
echo [1/4] Installing @google/gemini-cli...
call npm install -g @google/gemini-cli

:: 2. OpenAI Codex Install
echo [2/4] Installing @openai/codex...
call npm install -g @openai/codex

:: 3. GitHub Copilot CLI Install
echo [3/4] Installing @github/copilot...
call npm install -g @github/copilot

:: 4. Claude Code Install
echo [4/4] Installing Claude Code CLI...
call npm install -g @anthropic-ai/claude-code

echo ==========================================
echo All Installs have been completed!
echo ==========================================
pause