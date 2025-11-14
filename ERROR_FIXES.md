# 🔧 IdentityVault - Common Errors & Fixes

## 🚨 ERROR CATEGORIES & SOLUTIONS

### 1. DEPENDENCY & MODULE ERRORS

#### Error: "Cannot find module 'next'"
**Cause**: Dependencies not installed
**Fix**:
```bash
npm install
```

#### Error: "Cannot find module 'ethers'"
**Cause**: Missing Ethers.js
**Fix**:
```bash
npm install ethers@6.10.0
npm install @types/ethers --save-dev
```

#### Error: "Cannot find module '@veramo/core'"
**Cause**: Missing Veramo packages
**Fix**:
```bash
npm install @veramo/core @veramo/did-manager @veramo/credential-w3c
```

#### Error: "Cannot find module 'tailwindcss'"
**Cause**: Missing Tailwind CSS plugin
**Fix**:
```bash
npm install -D tailwindcss-animate
```

**If many modules missing:**
```bash
rm -r node_modules package-lock.json
npm install
```

---

### 2. TypeScript ERRORS

#### Error: "Cannot find name 'process'"
**Cause**: Missing @types/node
**Fix**:
```bash
npm install -D @types/node
```

#### Error: "Cannot use JSX unless the '--jsx' flag is provided"
**Cause**: TypeScript config issue
**Fix**: Ensure `tsconfig.json` has:
```json
{
  "compilerOptions": {
    "jsx": "preserve",
    "jsxImportSource": "react"
  }
}
```

#### Error: "Parameter implicitly has 'any' type"
**Cause**: TypeScript strict mode
**Fix**: Add type annotations
```typescript
// Before
export const useAuthStore = create((set) => ({
  
// After
export const useAuthStore = create<AuthState>((set: any) => ({
```

#### Error: "Module resolution failed"
**Cause**: TypeScript moduleResolution setting
**Fix**: Ensure `tsconfig.json` has:
```json
{
  "compilerOptions": {
    "moduleResolution": "node",
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

---

### 3. BLOCKCHAIN & HARDHAT ERRORS

#### Error: "Error: Cannot find module 'hardhat'"
**Cause**: Hardhat not installed
**Fix**:
```bash
npm install -D hardhat @nomicfoundation/hardhat-toolbox @nomicfoundation/hardhat-ethers
```

#### Error: "ECONNREFUSED: connect ECONNREFUSED 127.0.0.1:8545"
**Cause**: Hardhat node not running
**Fix**:
1. Open Terminal 1
2. Run: `npm run hardhat:node`
3. Wait for output showing "Started HTTP"

#### Error: "Error: Execution halted"
**Cause**: Contract compilation error
**Fix**:
```bash
npm run hardhat:compile
# Check output for specific Solidity errors
```

#### Error: "Error: Contract at ... does not have code"
**Cause**: Contract not deployed yet
**Fix**:
1. Ensure Hardhat node is running
2. Run: `npm run hardhat:deploy`
3. Copy contract addresses to `.env.local`

#### Error: "Chain ID mismatch"
**Cause**: Wrong network in MetaMask
**Fix**:
- MetaMask settings → Add Network Manually
- Network Name: Hardhat
- RPC URL: http://localhost:8545
- Chain ID: 31337
- Symbol: ETH

---

### 4. NEXT.JS & FRONTEND ERRORS

#### Error: "Error: ENOENT: no such file or directory"
**Cause**: File path issue
**Fix**: Verify file exists
```bash
# Windows
dir src\app\page.tsx

# Should show the file exists
```

#### Error: "Port 3000 is already in use"
**Cause**: Another app using port 3000
**Fix - Option A**: Kill process
```bash
netstat -ano | findstr :3000
taskkill /PID <PID> /F
npm run dev
```

**Fix - Option B**: Use different port
```bash
npm run dev -- -p 3001
# Visit http://localhost:3001
```

#### Error: "Styling not applied / Tailwind not working"
**Cause**: Tailwind not configured properly
**Fix**:
```bash
npm install -D tailwindcss-animate
npm run dev
# Close (Ctrl+C) and restart dev server
```

#### Error: "Module not found: Can't resolve '@/lib/ethers-client'"
**Cause**: Path alias issue
**Fix**: Ensure `tsconfig.json` has:
```json
{
  "compilerOptions": {
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

#### Error: "Cannot find module 'react'"
**Cause**: React not installed
**Fix**:
```bash
npm install react@18.2.0 react-dom@18.2.0
```

---

### 5. ENVIRONMENT & CONFIGURATION ERRORS

#### Error: "process.env is undefined"
**Cause**: Environment variables not loaded
**Fix**:
1. Create `.env.local` if not exists
2. Add environment variables
3. Restart dev server (Ctrl+C, npm run dev)

#### Error: "Cannot read property of undefined (reading 'NEXT_PUBLIC_RPC_URL')"
**Cause**: `.env.local` missing or malformed
**Fix**:
```env
# .env.local - Example
NEXT_PUBLIC_RPC_URL=http://localhost:8545
NEXT_PUBLIC_CHAIN_ID=31337
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

#### Error: "EACCES: permission denied"
**Cause**: Permission issue
**Fix**:
```bash
npm cache clean --force
npm install
```

---

### 6. EXECUTION & RUNTIME ERRORS

#### Error: "npm: command not found"
**Cause**: Node.js/npm not installed or not in PATH
**Fix**:
1. Reinstall Node.js from nodejs.org
2. Choose LTS version (18+)
3. Select "Add to PATH" during installation
4. Restart terminal/VS Code

#### Error: "Scripts are disabled on this system"
**Cause**: PowerShell execution policy
**Fix**:
```bash
# Option A: Use cmd instead of PowerShell
cmd /c "npm install"

# Option B: Bypass execution policy
powershell -ExecutionPolicy Bypass -Command "npm install"

# Option C: Change policy permanently
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Error: "ENOSPC: no space left on device"
**Cause**: Disk full
**Fix**:
```bash
# Free up space
# Delete: Downloads, Recycle Bin
# Then retry: npm install
```

---

### 7. NETWORK & CONNECTION ERRORS

#### Error: "Network request failed"
**Cause**: RPC not responding
**Fix**:
1. Check Hardhat node is running
2. Restart Hardhat node
3. Check `.env.local` RPC_URL

#### Error: "Failed to fetch contract ABI"
**Cause**: Contract address not deployed
**Fix**:
1. Run `npm run hardhat:deploy`
2. Update `.env.local` with new addresses

#### Error: "Transaction failed or reverted"
**Cause**: Smart contract error
**Fix**:
1. Check contract has code (test with etherscan)
2. Verify function parameters
3. Check account has balance

---

### 8. BUILD & COMPILATION ERRORS

#### Error: "Failed to compile with 1 errors"
**Cause**: Syntax error in code
**Fix**:
1. Check terminal for specific error location
2. Fix syntax error
3. Save file (auto-recompile)

#### Error: "Expected ';' found '^'"
**Cause**: Solidity syntax error
**Fix**: Check contract Solidity syntax:
```bash
npm run hardhat:compile
# Will show exact line number with error
```

#### Error: "Cannot find module or its corresponding type declaration"
**Cause**: TypeScript declaration missing
**Fix**:
```bash
npm install @types/<package-name> --save-dev
```

---

## ✅ QUICK REFERENCE: Error Fixes

| Error | Quick Fix |
|-------|-----------|
| Module not found | `npm install` |
| Cannot find 'process' | `npm install -D @types/node` |
| JSX error | Check `tsconfig.json` |
| Hardhat not found | `npm install -D hardhat @nomicfoundation/hardhat-toolbox` |
| Port 3000 in use | `npm run dev -- -p 3001` |
| Tailwind not working | `npm install -D tailwindcss-animate` then restart |
| ECONNREFUSED | Start Hardhat node: `npm run hardhat:node` |
| Execution policy | Use: `cmd /c` instead of PowerShell |
| npm not found | Reinstall Node.js from nodejs.org |

---

## 🔍 DEBUGGING TECHNIQUES

### 1. Check npm Installation
```bash
npm list
npm list ethers
npm list veramo
```

### 2. Clear Cache
```bash
npm cache clean --force
rm -r node_modules package-lock.json
npm install
```

### 3. Check File Paths
```bash
# Verify files exist
dir src\app\page.tsx
dir contracts\DIDRegistry.sol
dir scripts\deploy.ts
```

### 4. Test Hardhat
```bash
npx hardhat --version
npm run hardhat:compile
npm run hardhat:node
```

### 5. Test Next.js
```bash
npx next --version
npm run dev
# Visit http://localhost:3000
```

### 6. Check Environment
```bash
node --version     # Should be v18+
npm --version      # Should be v8+
git --version      # Optional
```

### 7. Browser Console Debugging (F12)
- Console tab: JavaScript errors
- Network tab: API/RPC calls
- Sources tab: Debug code
- Application tab: LocalStorage

---

## 🚨 NUCLEAR OPTIONS (If all else fails)

### Option 1: Full Clean Install
```bash
cd c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault

# Remove all dependencies
rmdir /s /q node_modules
del package-lock.json

# Reinstall
npm cache clean --force
npm install

# Try again
npm run dev
```

### Option 2: Reinstall Node.js
1. Uninstall Node.js (Control Panel → Programs)
2. Restart computer
3. Download latest LTS from nodejs.org
4. Install with admin privileges
5. Restart terminal
6. Verify: `node --version`
7. Retry: `npm install`

### Option 3: Use Fresh Clone
```bash
cd c:\Users\ruchi\OneDrive\Desktop\digilock
rmdir /s /q identity-vault
# Recreate from backup or github
```

---

## 📞 GETTING HELP

### If You're Stuck:

1. **Read the error message carefully** - it usually tells you the problem
2. **Check the specific line** - go to that file and line number
3. **Search the error online** - most errors have known solutions
4. **Check package versions** - ensure compatible versions
5. **Ask for help** - provide:
   - Full error message
   - Steps to reproduce
   - Your environment (Node version, OS, etc.)

### Useful Resources:
- [Next.js Docs](https://nextjs.org/docs)
- [Ethers.js Docs](https://docs.ethers.org)
- [Hardhat Docs](https://hardhat.org/docs)
- [npm Documentation](https://docs.npmjs.com/)

---

## ✅ FINAL CHECKLIST

Before asking for help, verify:

- [ ] Node.js 18+ installed: `node --version`
- [ ] npm working: `npm --version`
- [ ] In correct directory: `cd c:\Users\ruchi\OneDrive\Desktop\digilock\identity-vault`
- [ ] Dependencies installed: `npm list | find "ethers"`
- [ ] .env.local exists with values
- [ ] Hardhat compiles: `npm run hardhat:compile`
- [ ] Hardhat node runs: `npm run hardhat:node`
- [ ] Contracts deploy: `npm run hardhat:deploy`
- [ ] Dev server runs: `npm run dev`
- [ ] Browser loads: http://localhost:3000

**Once all checks pass, you're ready to develop!** 🎉

---

Last updated: November 14, 2025
