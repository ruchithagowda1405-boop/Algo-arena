@echo off
REM IdentityVault - Start Development Server
REM Run this THIRD in Terminal 3 (after deployment completes)

title IdentityVault - Dev Server
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault

echo.
echo ==========================================
echo  IdentityVault - Development Server
echo ==========================================
echo.
echo Starting Next.js dev server...
echo Visit: http://localhost:3000
echo.
echo Make sure:
echo - Hardhat node is running (Terminal 1)
echo - Contracts are deployed (Terminal 2)
echo.
timeout /t 3

npm run dev

pause
