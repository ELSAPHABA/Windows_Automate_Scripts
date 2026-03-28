@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo [QuickShare] Automatically modifies the registry to enable Samsung QuickShare.
echo [QuickShare] https://github.com/dhlife09/QuickShare_forALL
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "BaseBoardManufacturer" /t REG_SZ /d "samsung" /f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "BaseBoardProduct" /t REG_SZ /d "NT930XDY" /f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "SystemManufacturer" /t REG_SZ /d "samsung" /f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "SystemProductName" /t REG_SZ /d "NT930XDY-A51A" /f
