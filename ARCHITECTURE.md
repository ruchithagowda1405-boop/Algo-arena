# IdentityVault - MVP Architecture & Features Roadmap

## 🏛️ System Architecture

```
╔═══════════════════════════════════════════════════════════════════╗
║                      IDENTITY VAULT MVP                          ║
╚═══════════════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────────────┐
│                     USER INTERFACE LAYER                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Landing    │  │  Dashboard   │  │   Vault      │          │
│  │    Page     │  │   MyVault    │  │  Management  │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                  │
│  Components: ConnectWallet, CredentialCard, IssueForm...      │
└─────────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│                   STATE MANAGEMENT LAYER                         │
│                                                                  │
│  Zustand Store                                                  │
│  ├─ useAuthStore (account, chainId, isConnected)              │
│  └─ useVaultStore (credentials, userDid)                      │
└─────────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│                   BLOCKCHAIN INTERACTION LAYER                   │
│                                                                  │
│  Ethers.js Client                                               │
│  ├─ connectWallet() → MetaMask                                 │
│  ├─ createContractInstance(address, abi)                       │
│  └─ getCurrentAccount()                                         │
└─────────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│              IDENTITY & CREDENTIALS LAYER                        │
│                                                                  │
│  Veramo Agent                                                   │
│  ├─ DID Management (Create, Store, Resolve)                   │
│  ├─ VC Issuance (Create signed credentials)                   │
│  ├─ VC Verification (Verify signatures)                       │
│  └─ VP Creation (Presentations with selective disclosure)     │
└─────────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│                  STORAGE LAYER (IPFS/PINATA)                    │
│                                                                  │
│  uploadToPinata(credential) → IPFS Hash                        │
│  retrieveFromIPFS(hash) → Credential Data                      │
└─────────────────────────────────────────────────────────────────┘
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│                   SMART CONTRACTS LAYER                          │
│                                                                  │
│  ┌──────────────────┐              ┌──────────────────┐        │
│  │  DIDRegistry.sol │              │  VCRegistry.sol  │        │
│  │                  │              │                  │        │
│  │ • registerDID    │              │ • issueVC        │        │
│  │ • transferDID    │              │ • revokeVC       │        │
│  │ • getDIDsByOwner │              │ • restoreVC      │        │
│  │ • isDIDReg...    │              │ • getVC          │        │
│  │                  │              │ • isVCValid      │        │
│  └──────────────────┘              └──────────────────┘        │
└─────────────────────────────────────────────────────────────────┘
                              ↕
                    Hardhat Node (Local)
                   (or Testnet/Mainnet)
```

## 📊 Data Flow Diagrams

### 1. DID Creation & Registration

```
User                Frontend           Veramo              Smart Contract
  │                   │                  │                      │
  ├─ Click Create ────→│                  │                      │
  │                   │                  │                      │
  │                   ├─ Create DID ────→│                      │
  │                   │                  │                      │
  │                   │   did:ethr:0x... ←──────────────────────┤
  │                   │←─ Return DID ────┤                      │
  │                   │                  │                      │
  │                   ├─ Connect Wallet ──→ (MetaMask)          │
  │                   │                  │                      │
  │                   ├─ Register DID ────────────────────────→ registerDID()
  │                   │                  │                      │
  │                   │                  │   (Emits Event)      │
  │                   │                  │   DIDRegistered      │
  │                   │                  │   ← ───────────────┤
  │                   │                  │                      │
  │◄── Show Success ──┤                  │                      │
```

### 2. Credential Issuance Flow

```
Issuer              Frontend             Veramo         Pinata(IPFS)    Smart Contract
  │                   │                   │                │                  │
  ├─ Fill Form ──────→│                   │                │                  │
  │                   │                   │                │                  │
  │                   ├─ Create VC ──────→│                │                  │
  │                   │                   │                │                  │
  │                   │   Credential      │                │                  │
  │                   │   (Signed JWT) ←──┤                │                  │
  │                   │                   │                │                  │
  │                   ├─ Upload to IPFS ────────────────→  │                  │
  │                   │                   │          Hash(QmXxxx..)            │
  │                   │                   │           ←───┤                    │
  │                   │                   │                │                  │
  │                   ├─ Issue VC ─────────────────────────────────────→ issueVC()
  │                   │                   │                │          (hash)    │
  │                   │                   │                │                   │
  │                   │                   │                │   (Emits Event)    │
  │                   │                   │                │   VCIssued ←──────┤
  │                   │                   │                │                    │
  │◄─ Credential Issued ─────────────────────────────────┤                    │
```

### 3. Credential Verification Flow

```
Verifier            Frontend         Veramo         Smart Contract    User
    │                  │               │                  │            │
    ├─ Request VP ────→│               │                  │            │
    │                  │               │                  │            │
    │                  ├─ Show         │                  │            │
    │                  │  Consent      │                  │            │
    │                  │   Dialog ─────────────────────────────────────→ User Reviews
    │                  │               │                  │            │
    │                  │               │                  │            ├─ Selects claims
    │                  │               │                  │            │
    │                  │◄──────────────────────── User Approves ←───────┤
    │                  │               │                  │            │
    │                  ├─ Create VP ──→│ (Selective       │            │
    │                  │               │  Disclosure)     │            │
    │                  │               │                  │            │
    │                  │   VP (JWT) ←──┤                  │            │
    │                  │               │                  │            │
    │◄─ Receive VP ────┤               │                  │            │
    │                  │               │                  │            │
    ├─ Verify VP ──────→│ (Signature    │                  │            │
    │                  │  Check)       │                  │            │
    │                  ├──────────────────────────→ Check isVCValid()   │
    │                  │               │                  │            │
    │                  │               │    (Valid/Revoked) ←──────────┤
    │                  │               │                  │            │
    ├─ Grant Access ──→│               │                  │            │
    │                  │               │                  │            │
    └──────────────────────────────────────────────────────────────────┘
```

## 🎯 MVP Features

### Phase 1: Core Identity (DONE - Contracts)
- ✅ DID Registry Smart Contract
- ✅ VC Registry Smart Contract
- ✅ Deployment Script
- 🔄 Integration Tests

### Phase 2: Frontend Setup (IN PROGRESS)
- ✅ Next.js + Tailwind Setup
- ✅ Landing Page
- 🔄 Dashboard Layout
- 🔄 Component Structure

### Phase 3: Wallet & Auth
- 🔄 MetaMask Integration
- 🔄 Account Management
- 🔄 ChainID Validation
- 🔄 Persistent Auth State

### Phase 4: DID Management
- 🔄 Create DID (Veramo)
- 🔄 Register on-chain
- 🔄 DID Resolution
- 🔄 Display User DID

### Phase 5: Credential Issuance
- 🔄 Issuer Interface
- 🔄 VC Creation (Veramo)
- 🔄 IPFS Upload (Pinata)
- 🔄 On-chain Anchoring
- 🔄 Event Listening

### Phase 6: Credential Management
- 🔄 Display Credentials
- 🔄 Credential Details
- 🔄 Revocation UI
- 🔄 Expiration Handling

### Phase 7: Verification
- 🔄 Verifier Interface
- 🔄 VP Request Creation
- 🔄 Credential Verification
- 🔄 Status Display

### Phase 8: Selective Disclosure
- 🔄 Claim Selection UI
- 🔄 ZKP Integration (Optional)
- 🔄 Proof Generation
- 🔄 Verification

### Phase 9: Polish & Testing
- 🔄 UI/UX Refinement
- 🔄 Error Handling
- 🔄 Performance Optimization
- 🔄 Security Audit

## 📋 Component Tree

```
IdentityVault/
├── src/
│   ├── app/
│   │   ├── layout.tsx (Root Layout)
│   │   ├── page.tsx (Landing)
│   │   ├── globals.css
│   │   └── dashboard/
│   │       ├── layout.tsx (Dashboard Layout)
│   │       ├── page.tsx (MyVault)
│   │       ├── issue/
│   │       │   └── page.tsx (IssueCredential)
│   │       ├── verify/
│   │       │   └── page.tsx (VerifyCredential)
│   │       └── selective-disclosure/
│   │           └── page.tsx (SelectiveDisclosureDemo)
│   │
│   ├── components/
│   │   ├── ConnectWallet.tsx ✅ Skeleton
│   │   ├── CredentialCard.tsx
│   │   ├── CredentialForm.tsx
│   │   ├── VerificationWidget.tsx
│   │   ├── SelectiveDisclosureUI.tsx
│   │   ├── DIDDisplay.tsx
│   │   └── Header.tsx
│   │
│   ├── lib/
│   │   ├── veramoAgent.ts ✅ Skeleton
│   │   ├── ethers-client.ts ✅ Implemented
│   │   ├── pinata-client.ts ✅ Implemented
│   │   └── store.ts ✅ Implemented
│   │
│   └── api/
│       └── routes/ (Next.js API routes for backend logic)
│
├── contracts/
│   ├── DIDRegistry.sol ✅ Complete
│   └── VCRegistry.sol ✅ Complete
│
├── scripts/
│   └── deploy.ts ✅ Complete
│
├── hardhat.config.ts ✅
├── next.config.mjs ✅
├── tailwind.config.ts ✅
├── tsconfig.json ✅
├── package.json ✅
├── README.md ✅
└── SETUP_GUIDE.md ✅
```

## 🔑 Key Technologies & Why

| Technology | Purpose | Why Chosen |
|-----------|---------|-----------|
| Next.js 15 | Frontend Framework | App Router, SSR, TypeScript support |
| Tailwind CSS | Styling | Utility-first, responsive, dark mode |
| Ethers.js v6 | Blockchain | Modern Web3, contract interaction |
| Veramo | Identity | Industry standard for DID/VC management |
| Hardhat | Smart Contract Dev | Local testing, scripting, deployment |
| Solidity 0.8.20 | Smart Contracts | Latest stable, secure features |
| IPFS/Pinata | Distributed Storage | Censorship-resistant, permanent storage |
| Zustand | State Management | Lightweight, simple API, TypeScript |

## 🚀 Deployment Strategy

### Development
```
Local Hardhat Node → Next.js Dev Server → Localhost:3000
```

### Testing (Sepolia Testnet)
```
Sepolia RPC → Deploy Contracts → Configure Testnet → Test Frontend
```

### Production (Mainnet)
```
Mainnet RPC → Deploy Contracts → Configure Mainnet → Production Frontend
```

## 🔐 Security Considerations

1. **Private Key Management**
   - Never store in frontend
   - Use hardware wallets for production
   - MetaMask handles signing

2. **Smart Contract Security**
   - Reentrancy guards (if needed)
   - Access controls
   - Function permissions

3. **Data Privacy**
   - Selective disclosure prevents full identity leak
   - Credentials stored only hash on-chain
   - Actual data on decentralized IPFS

4. **HTTPS/TLS**
   - Always use HTTPS in production
   - Secure CORS headers
   - Content Security Policy (CSP)

## 📈 Performance Optimization

- **Gas Optimization**: Batch operations when possible
- **IPFS Caching**: Use Pinata gateway caching
- **Frontend**: Image optimization, code splitting
- **Contract**: Indexed events for efficient filtering

## 📞 Support & Resources

- **Smart Contracts**: Use Hardhat debugger
- **Frontend**: React DevTools
- **Blockchain**: Etherscan (testnet explorer)
- **IPFS**: Pinata dashboard for file tracking
- **Identity**: Veramo documentation

---

**Status**: MVP Phase 1 ✅ Complete | Ready for Phase 2+ Implementation 🚀
