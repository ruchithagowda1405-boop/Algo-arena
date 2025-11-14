@echo off
REM IdentityVault - Deploy Smart Contracts
REM Run this SECOND in Terminal 2 (after hardhat node starts)

title IdentityVault - Deploy Contracts
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault

echo.
echo ==========================================
echo  IdentityVault - Smart Contract Deployment
echo ==========================================
echo.
echo Waiting for Hardhat node to be ready...
echo (Make sure you ran 1-start-hardhat.bat first!)
echo.
timeout /t 3

echo.
echo Deploying contracts...
npm run hardhat:deploy

echo.
echo ==========================================
echo CONTRACT ADDRESSES:
echo Copy these to .env.local
echo ==========================================
echo.

pause
