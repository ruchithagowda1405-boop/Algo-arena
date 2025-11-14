# 🚀 IdentityVault - Complete Setup & Troubleshooting Guide

## 📋 Prerequisites Check

Before starting, ensure you have:
- ✅ Node.js 18+ installed
- ✅ npm installed (comes with Node.js)
- ✅ MetaMask extension in Chrome/Firefox
- ✅ ~500MB disk space

Check installation:
```bash
node --version     # Should be v18+
npm --version      # Should be v8+
```

## 🔧 Step 1: Install Dependencies

Navigate to project directory and install:

```bash
cd "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"
npm install
```

If you get permission errors, try:
```bash
npm install --legacy-peer-deps
```

Expected output:
```
added 500+ packages in 2m
```

**Estimated time: 2-3 minutes**

## 📦 Step 2: Install Additional Packages

```bash
npm install -D tailwindcss-animate @types/node
```

## ✅ Step 3: Verify Installation

Check that critical packages are installed:

```bash
npm list ethers          # Should show ethers@6.10.0
npm list veramo          # Should show @veramo/core@5.6.0
npm list next            # Should show next@15.0.0
npm list hardhat         # Should show hardhat@2.19.0
```

## 🏗️ Step 4: Compile Smart Contracts

```bash
npm run hardhat:compile
```

Expected output:
```
✔ 2 contracts compiled successfully
```

## 🌐 Step 5: Start Hardhat Node (Terminal 1)

**This MUST be running before deploying contracts!**

```bash
npm run hardhat:node
```

Expected output:
```
Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/
Account #0: 0x1234... (1000 ETH)
```

**Keep this terminal open!**

## 📝 Step 6: Update Environment Variables

**In another terminal**, update `.env.local` with Hardhat account addresses.

Open `.env.local` and add (copy from hardhat:node output):

```env
# Blockchain Configuration
NEXT_PUBLIC_RPC_URL=http://localhost:8545
NEXT_PUBLIC_CHAIN_ID=31337

# IPFS/Pinata Configuration
NEXT_PUBLIC_PINATA_API_KEY=test_key_placeholder
NEXT_PUBLIC_PINATA_API_SECRET=test_secret_placeholder
NEXT_PUBLIC_PINATA_GATEWAY=https://gateway.pinata.cloud

# Smart Contract Addresses (update after deployment)
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x0000000000000000000000000000000000000000
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0x0000000000000000000000000000000000000000

# Veramo Configuration
VERAMO_SECRET_KEY=test_key_12345
```

## 🚀 Step 7: Deploy Smart Contracts (Terminal 2)

**After hardhat:node is running**, deploy contracts:

```bash
npm run hardhat:deploy
```

Expected output:
```
Deploying IdentityVault contracts...
✓ DIDRegistry deployed to: 0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
✓ VCRegistry deployed to: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

**Copy these addresses!**

Update `.env.local`:
```env
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

## 💻 Step 8: Start Dev Server (Terminal 3)

```bash
npm run dev
```

Expected output:
```
▲ Next.js 15.0.0
- Local: http://localhost:3000
- Environments: .env.local
```

## 🌍 Step 9: Open in Browser

Visit: **http://localhost:3000**

You should see:
- ✅ Landing page loads
- ✅ Hero section with features
- ✅ Responsive design
- ✅ No errors in console

## 🔗 Step 10: Connect MetaMask

1. Install MetaMask extension
2. Create/import wallet
3. Add Hardhat network manually:
   - Network Name: Hardhat
   - RPC URL: http://localhost:8545
   - Chain ID: 31337
   - Currency: ETH
4. Click "Connect Wallet" button on landing page
5. Select MetaMask
6. Approve connection

---

## 🐛 Troubleshooting

### Issue: "Cannot find module 'ethers'"
**Solution:**
```bash
npm install ethers@6.10.0
```

### Issue: "npm: command not found"
**Solution:**
- Reinstall Node.js from nodejs.org
- Restart terminal after installation

### Issue: "Port 3000 already in use"
**Solution:**
```bash
npm run dev -- -p 3001
```
Then visit http://localhost:3001

### Issue: "Hardhat node won't start"
**Solution:**
```bash
npm install -D hardhat @nomicfoundation/hardhat-toolbox
npm run hardhat:node
```

### Issue: "Contract deployment fails"
**Checklist:**
- ✅ Hardhat node running? (should see output)
- ✅ Contracts compile? (`npm run hardhat:compile`)
- ✅ No changes to contracts since last compile?

### Issue: "MetaMask won't connect"
**Checklist:**
- ✅ MetaMask installed?
- ✅ Hardhat network added to MetaMask?
- ✅ RPC URL is http://localhost:8545?
- ✅ Chain ID is 31337?

### Issue: "Tailwind styles not working"
**Solution:**
```bash
npm install -D tailwindcss-animate
npm run dev
# Restart dev server (Ctrl+C, then npm run dev)
```

### Issue: "Module not found" errors
**Solution:**
```bash
rm -r node_modules package-lock.json
npm install
```

---

## 📋 Running Checklist

Before declaring success, verify:

- [ ] npm install completes without errors
- [ ] npm run hardhat:compile succeeds
- [ ] npm run hardhat:node starts (shows accounts)
- [ ] npm run hardhat:deploy succeeds (shows contract addresses)
- [ ] npm run dev starts on port 3000
- [ ] Browser loads http://localhost:3000
- [ ] Landing page displays
- [ ] Styling looks correct
- [ ] Browser console has no errors
- [ ] MetaMask extension installed
- [ ] Can connect wallet (if clicking button)

---

## ✅ Success Indicators

Your setup is working if:

1. **Three terminals running:**
   - Terminal 1: Hardhat node (http://127.0.0.1:8545/)
   - Terminal 2: Shows contract addresses
   - Terminal 3: Next.js dev server (http://localhost:3000)

2. **Browser shows:**
   - Landing page with hero section
   - Feature cards
   - "Connect Wallet" button
   - Beautiful Tailwind styling

3. **No errors in:**
   - Terminal output
   - Browser console (F12)
   - Network tab

---

## 🎯 Quick Terminal Setup

**If you want all 3 commands ready, create these files:**

### setup-hardhat.bat
```batch
@echo off
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault
npm run hardhat:node
pause
```

### setup-deploy.bat
```batch
@echo off
timeout /t 5
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault
npm run hardhat:deploy
pause
```

### setup-dev.bat
```batch
@echo off
timeout /t 10
cd /d c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault
npm run dev
pause
```

**Then run all 3 in order:**
1. setup-hardhat.bat (Terminal 1)
2. setup-deploy.bat (Terminal 2)
3. setup-dev.bat (Terminal 3)

---

## 📞 Still Having Issues?

1. Check **QUICK_REFERENCE.md** for commands
2. Check **SETUP_GUIDE.md** for detailed steps
3. Read error messages carefully
4. Check browser console (F12 → Console tab)
5. Check terminal output for specific errors

---

## 🎉 What's Next?

Once everything is running:

1. Explore the landing page
2. Try connecting MetaMask
3. Read ARCHITECTURE.md to understand the system
4. Start Phase 2: Component Development
5. Build dashboard pages

---

**Status: Follow steps 1-10 in order!**
**Estimated time: 10-15 minutes**

Good luck! 🚀
