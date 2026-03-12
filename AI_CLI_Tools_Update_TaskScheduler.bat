@echo off
setlocal

:: =================================================================
:: [ Task Scheduler Settings Guide ]
:: 1. General > Security options: 
::    Select "Run whether user is logged on or not"
:: 2. General > Privileges: 
::    Check "Run with highest privileges" (To ensure Admin rights)
:: 3. Triggers: 
::    Select "At startup"
:: =================================================================

:: Set working directory to the script location
pushd "%~dp0"

:: Check for npm (If Task Scheduler fails, replace 'npm' with full path)
set NPM_CMD=npm

echo Starting AI CLI Tools Update...
echo ------------------------------------------

:: 1. Gemini CLI Update
echo [1/3] Updating @google/gemini-cli...
call %NPM_CMD% update -g @google/gemini-cli

:: 2. OpenAI Codex Update
echo [2/3] Updating @openai/codex...
call %NPM_CMD% update -g @openai/codex

:: 3. GitHub Copilot Update
echo [3/3] Updating @github/copilot...
call %NPM_CMD% update -g @github/copilot

echo ------------------------------------------
echo All updates completed!

popd
exit /B