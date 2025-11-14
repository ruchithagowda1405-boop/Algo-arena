@echo off
cd /d "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"
echo Deploying Smart Contracts...
call npm run hardhat:deploy
pause
