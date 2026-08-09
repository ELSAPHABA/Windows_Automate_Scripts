@echo off
title AWS Tools Install (Admin)

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
echo [Admin Mode] Starting AWS Tools Update...
echo ==========================================

:: 1. AWS CLI v2 Install
echo [1/2] Installing AWS CLI v2...
msiexec.exe /i "https://awscli.amazonaws.com/AWSCLIV2.msi" /qn /norestart

:: 2. AWS CDK CLI Install
echo [2/2] Installing AWS CDK CLI...
call npm install -g aws-cdk

echo ==========================================
echo All Install have been completed!
echo ==========================================
pause