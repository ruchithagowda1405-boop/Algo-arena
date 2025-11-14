# IdentityVault - Complete Setup Guide

## Phase 1: Initial Installation ✅ (Current)

You have successfully created the project structure! Here's what's been set up:

### Files Created:
- ✅ `package.json` with all dependencies
- ✅ `tsconfig.json` for TypeScript
- ✅ `tailwind.config.ts` for styling
- ✅ `next.config.mjs` for Next.js
- ✅ `hardhat.config.ts` for blockchain
- ✅ `postcss.config.js` for CSS processing
- ✅ Smart contracts: `DIDRegistry.sol`, `VCRegistry.sol`
- ✅ Core utilities: `veramoAgent.ts`, `ethers-client.ts`, `pinata-client.ts`, `store.ts`
- ✅ Landing page: `page.tsx`
- ✅ Layout and styles: `layout.tsx`, `globals.css`
- ✅ Deployment script: `scripts/deploy.ts`

### Next Steps:

```bash
# 1. Install all dependencies
npm install

# 2. Install missing Tailwind plugin
npm install -D tailwindcss-animate

# 3. Configure Python (if using Windows)
# For hardhat TypeScript support, ensure Node packages are installed

# 4. Verify installation
npm list ethers veramo

# 5. Start Hardhat node in a terminal
npm run hardhat:node

# 6. Deploy contracts (in another terminal)
npm run hardhat:deploy

# 7. Start development server (in another terminal)
npm run dev
```

## Phase 2: Smart Contract Development

### What We've Built:

#### `contracts/DIDRegistry.sol`
- Maps DIDs to Ethereum addresses
- Functions:
  - `registerDID(string _did)` - Register new DID
  - `transferDID(string _did, address _newOwner)` - Transfer DID
  - `getDIDOwner(string _did)` - Get DID owner
  - `getDIDsByOwner(address _owner)` - Get all DIDs for owner
  - `isDIDRegistered(string _did)` - Check if registered

#### `contracts/VCRegistry.sol`
- Anchors Verifiable Credentials on-chain
- Stores: issuer, subject, credential hash, timestamps, revocation status
- Functions:
  - `issueVC(...)` - Issue new credential
  - `revokeVC(bytes32 _credentialId)` - Revoke credential
  - `restoreVC(bytes32 _credentialId)` - Restore revoked credential
  - `getVC(bytes32 _credentialId)` - Get credential details
  - `isVCValid(bytes32 _credentialId)` - Check if valid/not revoked

### Compile Contracts:
```bash
npm run hardhat:compile
```

### Deploy to Local Network:
```bash
# Terminal 1: Start local blockchain
npm run hardhat:node

# Terminal 2: Deploy
npm run hardhat:deploy
```

You'll get addresses like:
```
DIDRegistry: 0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
VCRegistry: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

Copy these to `.env.local`:
```env
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
```

## Phase 3: Frontend Development (Next)

### Components to Build:

1. **ConnectWallet.tsx** - MetaMask connection
2. **Dashboard/page.tsx** - Main vault interface
3. **Dashboard/IssueCredential.tsx** - VC issuance form
4. **Dashboard/VerifyCredential.tsx** - VC verification
5. **Dashboard/SelectiveDisclosure.tsx** - Privacy demo

### Key Pages:

```
/ (Landing)
  └── /dashboard
      ├── /my-vault (MyVault component)
      ├── /issue (IssueCredential component)
      ├── /verify (VerifyCredential component)
      └── /selective-disclosure (Demo component)
```

## Phase 4: Veramo Integration (Core Logic)

### Setup Veramo Agent:

The `lib/veramoAgent.ts` contains the skeleton. It will:

1. Initialize Veramo agent with:
   - Key Manager (KMS)
   - DID Manager with ethr-did provider
   - Credential plugins

2. Provide functions for:
   - `createDID()` - Create new ethr DID
   - `createVerifiableCredential()` - Issue W3C VC
   - `verifyCredential()` - Verify VC
   - `createPresentation()` - Create VP for selective disclosure

Example (will be implemented in Phase 4):
```typescript
// Create DID
const identifier = await agent.didManagerCreate({
  provider: 'ethr',
  options: { network: 'mainnet' }
})

// Create VC
const credential = await agent.createVerifiableCredential({
  credential: {
    issuer: { id: issuerDid },
    credentialSubject: {
      id: subjectDid,
      name: "John Doe",
      degree: "Bachelor of Science"
    }
  },
  proofFormat: 'jwt'
})
```

## Phase 5: IPFS Integration

### Upload Credentials:

```typescript
// lib/pinata-client.ts already configured

import { uploadToPinata } from '@/lib/pinata-client'

// Upload credential to IPFS
const ipfsHash = await uploadToPinata(credential, "degree.json")
// Returns: QmXxxx...
```

### Get Pinata API Keys:

1. Sign up at [pinata.cloud](https://www.pinata.cloud)
2. Create new API key
3. Add to `.env.local`:
```env
NEXT_PUBLIC_PINATA_API_KEY=your_api_key
NEXT_PUBLIC_PINATA_API_SECRET=your_api_secret
```

## Phase 6: Complete Workflow Example

### User Registration + Credential Issuance:

```
1. User clicks "Connect Wallet"
   ↓
2. MetaMask opens → User connects
   ↓
3. Frontend creates DID: did:ethr:0x123...
   ↓
4. DID registered on DIDRegistry contract
   ↓
5. Issuer creates credential with user's DID
   ↓
6. Credential uploaded to IPFS
   ↓
7. IPFS hash stored in VCRegistry contract
   ↓
8. Credential appears in user's vault ✓
```

### Verification Flow:

```
1. Verifier requests credential presentation
   ↓
2. User reviews what's being requested
   ↓
3. User can selectively disclose fields (selective disclosure)
   ↓
4. Frontend creates Verifiable Presentation (VP)
   ↓
5. Verifier receives VP + checks:
   - Valid signature (Veramo)
   - Not revoked (VCRegistry)
   - Not expired (VCRegistry)
   ↓
6. Access granted if valid ✓
```

## Testing Checklist

- [ ] All npm packages installed
- [ ] Hardhat node running
- [ ] Contracts compiled without errors
- [ ] Contracts deployed to local network
- [ ] Contract addresses in `.env.local`
- [ ] Frontend dev server running
- [ ] Landing page loads
- [ ] MetaMask connects
- [ ] Can create DID
- [ ] Can issue credential
- [ ] Credential appears in vault
- [ ] Can verify credential
- [ ] Selective disclosure works

## Troubleshooting

### "Cannot find module 'ethers'"
```bash
npm install ethers
npm install --save-dev @types/ethers
```

### Hardhat node won't start
```bash
npm install -D hardhat @nomicfoundation/hardhat-toolbox
npm run hardhat:node
```

### Tailwind not working
```bash
npm install -D tailwindcss postcss autoprefixer tailwindcss-animate
```

### Contract deployment fails
```bash
# Make sure hardhat node is running in a separate terminal
# Check contract syntax: npx hardhat compile
```

### MetaMask won't connect
- Check `.env.local` RPC_URL is correct
- Ensure Hardhat node is running on 8545
- Add Hardhat network to MetaMask manually

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                    IdentityVault MVP                    │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  Frontend (Next.js + React)                             │
│  ├─ Landing Page (/)                                    │
│  ├─ Dashboard (/dashboard)                              │
│  ├─ Vault Management                                    │
│  └─ Credential UI                                       │
│                                                          │
│  ↓ (Web3 Interaction)                                   │
│                                                          │
│  Ethers.js Client                                       │
│  ├─ Connect Wallet                                      │
│  ├─ Read/Write Contracts                                │
│  └─ Get Account Info                                    │
│                                                          │
│  ↓ (Blockchain)                                         │
│                                                          │
│  Smart Contracts (Solidity)                             │
│  ├─ DIDRegistry.sol                                     │
│  └─ VCRegistry.sol                                      │
│                                                          │
│  ↕ (Identity/Credentials)                               │
│                                                          │
│  Veramo Agent                                           │
│  ├─ DID Management                                      │
│  ├─ VC Creation/Verification                            │
│  └─ Presentation Creation                               │
│                                                          │
│  ↕ (Distributed Storage)                                │
│                                                          │
│  IPFS (via Pinata)                                      │
│  └─ Store Credential Files                              │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

## Recommended Development Order

1. ✅ Project setup (DONE)
2. ✅ Smart contracts (DONE)
3. → Next: Set up Shadcn/UI components
4. → Build dashboard interface
5. → Integrate Veramo for DID/VC management
6. → Connect to smart contracts
7. → Add IPFS integration
8. → Implement selective disclosure
9. → Testing and refinement
10. → Deploy to testnet

## Resources

- [Next.js Docs](https://nextjs.org/docs)
- [Veramo Docs](https://veramo.io)
- [Ethers.js v6](https://docs.ethers.org/v6/)
- [Solidity Docs](https://docs.soliditylang.org/)
- [Hardhat Docs](https://hardhat.org/docs)
- [W3C VC Spec](https://www.w3.org/TR/vc-data-model/)

---

**You're now ready to move to Phase 2! Run `npm install` first. 🚀**
