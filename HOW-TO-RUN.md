# 🚀 IDENTITY VAULT - HOW TO RUN YOUR PROJECT

## ✅ STATUS: READY TO EXECUTE!

Your project is **fully set up** and **ready to run**!

---

## 📋 QUICK START (Follow in Order)

### Step 1️⃣: Compile Smart Contracts (30 seconds)

**Option A: Using Batch File** (Easiest)
- Double-click: `0-compile-contracts.bat`

**Option B: Using Command Prompt**
```bash
npm run hardhat:compile
```

**Expected Output:**
```
Solidity 0.8.20 | openzeppelin/contracts-upgradeable 4.9.3 selected.
Compiling 2 contracts...
✓ Contracts compiled successfully
```

✅ When you see this: Move to Step 2

---

### Step 2️⃣: Start Blockchain Node (Keep Running!)

**Option A: Using Batch File** (Easiest)
- Double-click: `1-start-hardhat.bat`
- **KEEP THIS TERMINAL OPEN!**

**Option B: Using Command Prompt**
```bash
npm run hardhat:node
```

**Expected Output:**
```
Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/

Accounts (20 available)

Account #0: 0x... (...)
```

✅ When you see "Started HTTP...": **LEAVE THIS RUNNING** and go to Step 3

---

### Step 3️⃣: Deploy Smart Contracts (In New Terminal!)

**🔴 IMPORTANT: Open a NEW command prompt!**
- Do NOT close Terminal 1
- Open a new Command Prompt window

**Option A: Using Batch File** (Easiest)
- Double-click: `2-deploy-contracts.bat`

**Option B: Using Command Prompt**
```bash
npm run hardhat:deploy
```

**Expected Output:**
```
✓ DIDRegistry deployed to: 0x5FbDB2315678afccb5f...(some address)
✓ VCRegistry deployed to: 0xe7f1725E7734CE288F8...(some address)
```

✅ **Copy those addresses!** You'll need them in Step 4

---

### Step 4️⃣: Update Environment Variables

Now copy those addresses into `.env.local`:

1. Open: `.env.local` (in your project root)
2. Find these lines:
   ```
   NEXT_PUBLIC_DID_REGISTRY_ADDRESS=
   NEXT_PUBLIC_VC_REGISTRY_ADDRESS=
   ```
3. Add the addresses from Step 3:
   ```
   NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb5f...
   NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8...
   ```
4. Save the file

✅ Done! Move to Step 5

---

### Step 5️⃣: Start Frontend Server (In Another New Terminal!)

**🔴 IMPORTANT: Open ANOTHER new command prompt!**
- Do NOT close Terminals 1 & 2
- Open a THIRD Command Prompt window

**Option A: Using Batch File** (Easiest)
- Double-click: `3-start-dev.bat`

**Option B: Using Command Prompt**
```bash
npm run dev
```

**Expected Output:**
```
▲ Next.js 15.0.0
- Local: http://localhost:3000
- Environments: .env.local
```

✅ When you see "Ready in...": **Backend is ready!**

---

### Step 6️⃣: Open in Browser

1. Open your browser
2. Go to: **http://localhost:3000**
3. You'll see your beautiful landing page! 🎉

✅ **PROJECT IS RUNNING!**

---

## 📊 WHAT YOU SHOULD SEE

### Terminal 1 (Hardhat Node)
```
Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/

Accounts (20 available)
Account #0: 0x... (1000 ETH)
Account #1: 0x... (1000 ETH)
...
```

### Terminal 2 (Deployment)
```
Compiling 2 contracts...
✓ Contracts compiled successfully
✓ DIDRegistry deployed to: 0x5FbDB...
✓ VCRegistry deployed to: 0xe7f1...
```

### Terminal 3 (Dev Server)
```
▲ Next.js 15.0.0
- Local: http://localhost:3000
```

### Browser (http://localhost:3000)
- Beautiful landing page loads ✅
- All images load ✅
- Buttons responsive ✅
- No errors in console (F12) ✅

---

## 🔧 EASY MODE: Use All Batch Files

Instead of opening 3 terminals manually, use these batch files:

| File | What It Does |
|------|-------------|
| `0-compile-contracts.bat` | Compile smart contracts |
| `1-start-hardhat.bat` | Start blockchain node |
| `2-deploy-contracts.bat` | Deploy contracts |
| `3-start-dev.bat` | Start dev server |
| `START-ALL.bat` | Start all 3 (recommended!) |

**Easiest Way:**
1. Double-click `0-compile-contracts.bat` → Wait for completion
2. Double-click `START-ALL.bat` → Opens all 3 terminals
3. Go to http://localhost:3000

---

## ⚠️ TROUBLESHOOTING

### Problem: "npm: command not found"
**Solution:** Install Node.js from https://nodejs.org (v18+)

### Problem: "Port 3000 already in use"
**Solution:** 
```bash
npm run dev -- -p 3001
```
Then visit http://localhost:3001

### Problem: "Cannot find module..."
**Solution:** 
```bash
npm install
```

### Problem: Hardhat won't compile
**Solution:**
```bash
npm install -D ts-node typescript
npm run hardhat:compile
```

### Problem: Contracts won't deploy
**Solution:**
1. Make sure Hardhat node is running (Terminal 1)
2. Make sure you compiled: `npm run hardhat:compile`
3. Check that contract files exist in `contracts/` folder

### Problem: Browser shows blank page
**Solution:**
1. Press F12 to open Developer Tools
2. Check Console tab for errors
3. Refresh the page (Ctrl+R)
4. Check that dev server is running (Terminal 3)

### Problem: "Connection refused" or "Cannot connect to blockchain"
**Solution:**
1. Make sure Hardhat node is running (Terminal 1)
2. Check port 8545 is not blocked
3. Restart the node: Close Terminal 1 and run again

---

## 🎯 COMPLETE WORKFLOW

```
Step 1: 0-compile-contracts.bat
        ↓
Step 2: 1-start-hardhat.bat (Keep open!)
        ↓
Step 3: 2-deploy-contracts.bat
        ↓
Step 4: Update .env.local with addresses
        ↓
Step 5: 3-start-dev.bat
        ↓
Step 6: Visit http://localhost:3000
        ↓
✅ SUCCESS!
```

---

## 🚀 ADVANCED: Run Everything at Once

```bash
cd "c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault"
npm run hardhat:compile && npm run hardhat:node &
```

Then in another terminal:
```bash
npm run hardhat:deploy
```

Then in another terminal:
```bash
npm run dev
```

---

## 📁 PROJECT STRUCTURE

```
identity-vault/
├── 0-compile-contracts.bat     ← Compile Solidity
├── 1-start-hardhat.bat         ← Start blockchain
├── 2-deploy-contracts.bat      ← Deploy contracts
├── 3-start-dev.bat             ← Start frontend
├── START-ALL.bat               ← Run all 3!
│
├── contracts/                  ← Smart contracts
│   ├── DIDRegistry.sol
│   └── VCRegistry.sol
│
├── src/
│   ├── app/
│   │   ├── page.tsx            ← Landing page
│   │   ├── layout.tsx
│   │   └── globals.css
│   └── lib/
│       ├── ethers-client.ts    ← Web3
│       ├── pinata-client.ts    ← IPFS
│       ├── veramoAgent.ts      ← DIDs
│       └── store.ts            ← State
│
├── scripts/deploy.ts           ← Deployment script
├── package.json                ← Dependencies
├── tsconfig.json               ← TypeScript config
├── next.config.mjs             ← Next.js config
├── hardhat.config.ts           ← Hardhat config
└── .env.local                  ← Environment vars
```

---

## 📚 NEXT STEPS (After Project Runs)

### Phase 2: Building Components
- Create Dashboard page
- Create Forms for DID management
- Add UI components

### Phase 3: Integration
- Connect to Veramo framework
- Implement DID creation
- Implement VC issuance

### Phase 4: Features
- User workflows
- Selective disclosure
- Testing

---

## 🆘 NEED HELP?

Check these files:
- `ERROR_FIXES.md` - Specific error solutions
- `QUICK_REFERENCE.md` - Command reference
- `ARCHITECTURE.md` - System design
- `GETTING_STARTED.md` - Detailed setup

---

## 🎓 WHAT YOU GET

✅ Working local blockchain (20 test accounts, 1000 ETH each)
✅ Deployed smart contracts
✅ Beautiful Next.js frontend
✅ Web3 integration
✅ Identity framework ready
✅ Hot reload for development
✅ Responsive design

---

## ⏱️ TIME BREAKDOWN

- Compiling contracts: 30 seconds
- Starting blockchain: 5 seconds
- Deploying contracts: 10 seconds
- Starting dev server: 5 seconds
- **Total: ~1 minute (first time)**

---

## 🎉 YOU'RE ALL SET!

Everything is configured. Follow the 6 steps above and you'll have a working dApp!

**Let's build something amazing!** 🚀

---

**Next Action:** Run `0-compile-contracts.bat`

**Status:** Ready to Execute ✅
