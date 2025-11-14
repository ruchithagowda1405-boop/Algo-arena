@echo off
REM IdentityVault - Startup Script for Hardhat Node
REM Run this FIRST in Terminal 1

title IdentityVault - Hardhat Node
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault

echo.
echo ==========================================
echo  IdentityVault - Hardhat Local Blockchain
echo ==========================================
echo.
echo Starting Hardhat node on http://127.0.0.1:8545/
echo.
echo Keep this terminal open!
echo Open another terminal and run: setup-deploy.bat
echo.
pause

npm run hardhat:node

pause
