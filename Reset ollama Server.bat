@echo off
:: ===================================================
::  [winnat 서비스 재시작 스크립트] - 관리자 권한 자동 요청
:: ===================================================

:: 스크립트가 관리자 권한으로 실행되었는지 확인합니다.
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    :: 관리자 권한이 없으면, VBScript를 사용하여 'runas'로 스크립트를 재실행하고 UAC 창을 띄웁니다.
    echo WScript.CreateObject("Shell.Application").ShellExecute "%~s0", "", "", "runas", 1 > "%TEMP%\elevate.vbs"
    cscript //nologo "%TEMP%\elevate.vbs"
    del "%TEMP%\elevate.vbs"
    exit /b
)

:: ===================================================
:: 관리자 권한 확인 성공. 핵심 명령 실행
:: ===================================================

echo.
echo ---------------------------------------------------
echo     [winnat 서비스 재시작 시작]
echo ---------------------------------------------------
echo.

:: 1. winnat 서비스 중지
echo. [1/2] winnat 서비스 중지 시도...
net stop winnat
if %ERRORLEVEL% NEQ 0 (
    echo [경고] winnat 서비스 중지 실패 (이미 중지되었을 수 있음). 계속 진행합니다.
)

:: 2. winnat 서비스 시작
echo. [2/2] winnat 서비스 시작 시도...
net start winnat
if %ERRORLEVEL% NEQ 0 (
    echo [오류] winnat 서비스 시작에 실패했습니다. (추가 확인 필요)
)

echo.
echo ---------------------------------------------------
echo     [winnat 서비스 재시작 완료]
echo ---------------------------------------------------
echo.
pause