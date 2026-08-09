@echo off
:: 관리자 권한 체크
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 관리자 권한이 필요합니다. 관리자 권한으로 다시 실행합니다...
    powershell -command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Github CLI 설치 중...
winget install --id GitHub.cli --source winget --silent --accept-package-agreements --accept-source-agreements
echo 설치 완료!

pause
