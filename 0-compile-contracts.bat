@echo off
setlocal enabledelayedexpansion

REM Navigate to project directory
cd /d "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"

REM Set environment variable to disable analytics
set HARDHAT_DISABLE_ANALYTICS=true

REM Compile contracts
echo.
echo ========================================
echo Compiling Smart Contracts...
echo ========================================
echo.

call npm run hardhat:compile

if errorlevel 1 (
    echo.
    echo ERROR: Compilation failed!
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✓ Compilation SUCCESSFUL!
echo ========================================
echo.
echo Contracts compiled successfully.
echo Next step: Run 2-deploy-contracts.bat
echo.
pause
