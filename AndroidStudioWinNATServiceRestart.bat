@echo off
chcp 65001 >nul
title Windows NAT 서비스 재시작

:: 1. 관리자 권한 확인
:: 'net session' 명령은 관리자 권한이 없으면 에러를 반환합니다.
net session >nul 2>&1

:: 2. 권한 체크 후 분기
if %errorLevel% == 0 (
    goto :RunCommands
) else (
    echo 관리자 권한이 필요합니다. 권한을 요청하는 중...
    :: 관리자 권한으로 현재 배치 파일을 재실행
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit
)

:RunCommands
echo.
echo ==========================================
echo [1/2] Windows NAT 서비스를 중지합니다...
echo ==========================================
net stop winnat

echo.
echo ==========================================
echo [2/2] Windows NAT 서비스를 시작합니다...
echo ==========================================
net start winnat

echo.
echo ==========================================
echo 모든 작업이 완료되었습니다.
echo ==========================================
echo.
pause