@echo off
title Windows 시스템 파일 복구 스크립트
echo ================================
echo DISM 및 SFC 검사 시작
echo ================================
echo.

@echo off
:: 관리자 권한 확인
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 관리자 권한으로 재실행합니다...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo =====================================
echo DISM 검사 및 복구를 시작합니다...
echo =====================================
DISM.exe /Online /Cleanup-image /Restorehealth

if %errorlevel% neq 0 (
    echo.
    echo [WARNING] DISM 실행 중 오류가 발생했습니다.
    echo 로그를 확인하세요.
    echo.
)

echo.
echo =====================================
echo SFC 시스템 파일 검사를 시작합니다...
echo =====================================
sfc /scannow

echo.
echo =====================================
echo 모든 작업이 완료되었습니다.
echo 아무 키나 누르면 창이 닫힙니다.
echo =====================================
pause