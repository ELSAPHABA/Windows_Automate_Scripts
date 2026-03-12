@echo off
setlocal

REM Samsung QuickShare registry patch (Task Scheduler background version)

reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "BaseBoardManufacturer" /t REG_SZ /d "samsung" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "BaseBoardProduct" /t REG_SZ /d "NT930XDY" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "SystemManufacturer" /t REG_SZ /d "samsung" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\SYSTEM\BIOS" /v "SystemProductName" /t REG_SZ /d "NT930XDY-A51A" /f >nul 2>&1

exit /b