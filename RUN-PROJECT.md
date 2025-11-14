# 🚀 IdentityVault - RUN & SETUP GUIDE

## ⚡ QUICK START (3 Steps)

### STEP 1: Install Dependencies (2-3 minutes)
```bash
cd c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault
npm install
```

✅ You'll see "added X packages" when complete

### STEP 2: Start Hardhat Node (Terminal 1)
```bash
npm run hardhat:node
```

✅ You'll see "Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/"

### STEP 3: Deploy Contracts (Terminal 2)
```bash
npm run hardhat:deploy
```

✅ You'll see contract addresses:
```
✓ DIDRegistry deployed to: 0x5FbDB...
✓ VCRegistry deployed to: 0xe7f1...
```

### STEP 4: Start Dev Server (Terminal 3)
```bash
npm run dev
```

✅ You'll see "Ready in Xs" and can visit http://localhost:3000

---

## 📋 DETAILED SETUP (Follow in Order)

### Prerequisites
```bash
# Check you have everything
node --version     # Must be v18+
npm --version      # Must be v8+
```

If not installed, download from nodejs.org

### Step 1: Navigate to Project
```bash
cd "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"
```

### Step 2: Install All Dependencies
```bash
npm install
```

**Expected output:**
```
npm notice
npm notice Welcome to npm 10.x.x
added 500+ packages in 120s
```

**If you see errors:**
```bash
npm install --legacy-peer-deps
```

### Step 3: Install Tailwind Plugin
```bash
npm install -D tailwindcss-animate @types/node
```

### Step 4: Verify Installation
```bash
npm list ethers
npm list veramo
npm list next
```

Should show versions like:
```
├── ethers@6.10.0
├── @veramo/core@5.6.0
└── next@15.0.0
```

### Step 5: Compile Smart Contracts
```bash
npm run hardhat:compile
```

**Expected output:**
```
✔ 2 contracts compiled successfully
```

### Step 6: START TERMINAL 1 - Hardhat Node
```bash
npm run hardhat:node
```

**Keep this running!** You'll see:
```
Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/

Accounts:
Account #0: 0x1234... (1000 ETH)
Account #1: 0x5678... (1000 ETH)
...
```

### Step 7: START TERMINAL 2 - Deploy Contracts
**In a NEW terminal:**
```bash
npm run hardhat:deploy
```

**You'll see:**
```
Deploying IdentityVault contracts...
✓ DIDRegistry deployed to: 0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
✓ VCRegistry deployed to: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

**SAVE THESE ADDRESSES!**

### Step 8: Update .env.local
Edit `.env.local` and update:
```env
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

### Step 9: START TERMINAL 3 - Dev Server
**In another NEW terminal:**
```bash
npm run hardhat:node
npm run dev
```

**You'll see:**
```
▲ Next.js 15.0.0
- Local: http://localhost:3000
- Environments: .env.local
```

### Step 10: Open Browser
Visit: **http://localhost:3000**

You should see a beautiful landing page! 🎉

---

## 🎯 WHAT YOU SHOULD SEE

### Terminal 1 (Hardhat Node)
```
Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/
```
✅ Node running, ready for transactions

### Terminal 2 (Deploy)
```
✓ DIDRegistry deployed to: 0x5FbDB...
✓ VCRegistry deployed to: 0xe7f1...
```
✅ Contracts deployed successfully

### Terminal 3 (Dev Server)
```
▲ Next.js 15.0.0
- Local: http://localhost:3000
```
✅ Dev server ready

### Browser (http://localhost:3000)
- Beautiful landing page loads
- Hero section visible
- Features displayed
- Responsive design works
- No errors in console (F12)

✅ Everything working!

---

## 🖥️ EASIER: Use Batch Files

Instead of running commands manually, use these batch files:

**Double-click these in order:**

1. **1-start-hardhat.bat** (Terminal 1)
2. **2-deploy-contracts.bat** (Terminal 2)
3. **3-start-dev.bat** (Terminal 3)

**Or use:**

**START-ALL.bat** (Opens all 3 automatically)

---

## ✅ VERIFICATION CHECKLIST

After completing all steps:

- [ ] npm install completed (no errors)
- [ ] Hardhat node running (see "Started HTTP...")
- [ ] Contracts compiled (see "2 contracts compiled")
- [ ] Contracts deployed (see contract addresses)
- [ ] .env.local updated with addresses
- [ ] Dev server running (see "Ready in...")
- [ ] Browser loads http://localhost:3000
- [ ] Landing page displays correctly
- [ ] No errors in browser console (F12)
- [ ] Styling looks good (Tailwind working)

**If all ✅, you're ready to develop!**

---

## 🚨 COMMON ISSUES & QUICK FIXES

### "npm: command not found"
**Fix**: Reinstall Node.js from nodejs.org, restart terminal

### "Port 3000 already in use"
**Fix**: `npm run dev -- -p 3001` (use port 3001 instead)

### "Cannot find module"
**Fix**: `npm install` (ensure all dependencies installed)

### "Hardhat node won't start"
**Fix**: `npm run hardhat:compile` first, then try again

### "ECONNREFUSED 127.0.0.1:8545"
**Fix**: Ensure Hardhat node is running in Terminal 1

### "Tailwind not working"
**Fix**: `npm install -D tailwindcss-animate` then restart dev server

**For more issues, see: ERROR_FIXES.md**

---

## 📁 IMPORTANT FILES AFTER SETUP

```
identity-vault/
├── node_modules/              ← Dependencies (created by npm install)
├── .env.local                 ← Your configuration
├── package.json               ← Project metadata
├── src/
│   ├── app/page.tsx          ← Landing page
│   ├── lib/ethers-client.ts  ← Web3 integration
│   └── lib/store.ts          ← State management
├── contracts/
│   ├── DIDRegistry.sol        ← Smart contract
│   └── VCRegistry.sol         ← Smart contract
└── scripts/deploy.ts          ← Deployment script
```

---

## 🔗 NEXT STEPS

### After Setup Works:

1. **Explore the landing page** at http://localhost:3000
2. **Try connecting MetaMask** (install extension first)
3. **Read ARCHITECTURE.md** to understand the system
4. **Check QUICK_REFERENCE.md** for handy commands
5. **Start Phase 2**: Build dashboard pages

---

## 📞 NEED HELP?

### Check These Files:
1. **ERROR_FIXES.md** - Specific error solutions
2. **GETTING_STARTED.md** - Detailed setup guide
3. **QUICK_REFERENCE.md** - Commands reference
4. **README.md** - Complete documentation

### Quick Links:
- [Next.js Docs](https://nextjs.org/docs)
- [Ethers.js Docs](https://docs.ethers.org)
- [Hardhat Docs](https://hardhat.org)

---

## 🎉 SUCCESS!

Once everything is running:

✅ You have a local blockchain
✅ You have deployed smart contracts
✅ You have a Next.js dev server
✅ You can see the landing page
✅ You're ready to develop!

**Time to build something amazing! 🚀**

---

**Setup Time: 10-15 minutes**
**Estimated Difficulty: Easy**
**Status: Ready to Go! 🎊**
