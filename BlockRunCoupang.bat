@echo off
:: 관리자 권한 체크
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 관리자 권한으로 실행해 주세요! (우클릭 - 관리자 권한으로 실행)
    pause
    exit /b
)

echo [1/3] Explorer 정책 설정 활성화 중...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d 1 /f

echo [2/3] 차단 목록에 coupang.exe 추가 중...
:: 이미 폴더가 있을 수 있으므로 오류 메시지는 무시하고 생성
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "coupang.exe" /f

echo [3/3] 설정을 적용하기 위해 Explorer를 재시작합니다...
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo === 모든 작업이 완료되었습니다! coupang.exe 실행이 차단되었습니다. ===
pause