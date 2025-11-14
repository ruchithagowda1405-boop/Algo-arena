@echo off
setlocal enabledelayedexpansion

REM Navigate to project directory
cd /d "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"

REM Disable Hardhat analytics
set HARDHAT_DISABLE_ANALYTICS=true

echo.
echo ========================================
echo Starting Hardhat Blockchain Node...
echo ========================================
echo.
echo Waiting for node to start on port 8545...
echo.

REM Start Hardhat node without telemetry
call npm run hardhat:node -- --no-analytics

if errorlevel 1 (
    echo.
    echo ERROR: Hardhat node failed to start!
    echo.
    pause
    exit /b 1
)
