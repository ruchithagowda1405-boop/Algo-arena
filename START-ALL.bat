@echo off
REM IdentityVault - Complete Startup Script
REM This runs all 3 steps in parallel

title IdentityVault - Complete Startup
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault

echo.
echo ==========================================
echo  IdentityVault - Complete Startup
echo ==========================================
echo.
echo This script will:
echo 1. Start Hardhat node
echo 2. Deploy contracts
echo 3. Start dev server
echo.
echo You will need 3 terminal windows.
echo Press any key to continue...
echo.

pause

echo.
echo Step 1: Starting Hardhat node...
start "Hardhat Node" cmd /k "1-start-hardhat.bat"

echo Step 2: Waiting 3 seconds...
timeout /t 3

echo Step 3: Deploying contracts...
start "Deploy Contracts" cmd /k "2-deploy-contracts.bat"

echo Step 4: Waiting 5 seconds...
timeout /t 5

echo Step 5: Starting dev server...
start "Dev Server" cmd /k "3-start-dev.bat"

echo.
echo ==========================================
echo All services started!
echo ==========================================
echo.
echo Terminal 1: Hardhat node (http://127.0.0.1:8545)
echo Terminal 2: Smart contract deployment
echo Terminal 3: Next.js dev server (http://localhost:3000)
echo.
echo Open browser: http://localhost:3000
echo.
pause
