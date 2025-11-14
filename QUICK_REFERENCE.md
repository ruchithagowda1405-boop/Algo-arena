# IdentityVault - Quick Reference Card

## 🎯 App Name & Purpose

**IdentityVault** - A self-sovereign digital identity system where users control their own DIDs and verifiable credentials on the blockchain.

## 📁 File Locations

| File | Purpose | Location |
|------|---------|----------|
| Landing Page | Homepage | `src/app/page.tsx` |
| Root Layout | App wrapper | `src/app/layout.tsx` |
| Globals CSS | Theme + styles | `src/app/globals.css` |
| Ethers Client | Web3 integration | `src/lib/ethers-client.ts` |
| Pinata Client | IPFS integration | `src/lib/pinata-client.ts` |
| Veramo Agent | Identity framework | `src/lib/veramoAgent.ts` |
| Zustand Store | State management | `src/lib/store.ts` |
| Connect Wallet | Wallet component | `src/components/ConnectWallet.tsx` |
| DID Registry | Smart contract | `contracts/DIDRegistry.sol` |
| VC Registry | Smart contract | `contracts/VCRegistry.sol` |
| Deploy Script | Deployment | `scripts/deploy.ts` |
| Hardhat Config | Blockchain config | `hardhat.config.ts` |
| Environment | Secrets/config | `.env.local` |

## 🚀 Essential Commands

| Command | Purpose |
|---------|---------|
| `npm install` | Install dependencies |
| `npm run hardhat:node` | Start local blockchain |
| `npm run hardhat:compile` | Compile smart contracts |
| `npm run hardhat:deploy` | Deploy contracts |
| `npm run dev` | Start dev server |
| `npm run build` | Build for production |
| `npm run start` | Start production server |
| `npm run lint` | Run ESLint |

## 🔑 Environment Variables

```env
# Blockchain
NEXT_PUBLIC_RPC_URL=http://localhost:8545
NEXT_PUBLIC_CHAIN_ID=31337

# IPFS/Pinata
NEXT_PUBLIC_PINATA_API_KEY=your_key
NEXT_PUBLIC_PINATA_API_SECRET=your_secret
NEXT_PUBLIC_PINATA_GATEWAY=https://gateway.pinata.cloud

# Smart Contracts
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x...
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0x...

# Veramo
VERAMO_SECRET_KEY=your_secret
```

## 📦 Key Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| next | 15.0.0 | Frontend framework |
| react | 18.2.0 | UI library |
| tailwindcss | 3.4.0 | Styling |
| ethers | 6.10.0 | Blockchain interaction |
| @veramo/core | 5.6.0 | Identity management |
| zustand | 4.4.0 | State management |
| axios | 1.6.0 | HTTP client |
| hardhat | 2.19.0 | Smart contract dev |

## 🏗️ Architecture Layers

```
User Interface (Next.js/React)
         ↕
State Management (Zustand)
         ↕
Blockchain Layer (Ethers.js)
         ↕
Identity Layer (Veramo)
         ↕
Storage Layer (IPFS/Pinata)
         ↕
Smart Contracts (Solidity)
```

## 💾 Smart Contract Functions

### DIDRegistry
```solidity
registerDID(string did)           // Register new DID
transferDID(string did, address)  // Transfer DID
getDIDOwner(string did)           // Get owner
getDIDsByOwner(address)           // List user's DIDs
isDIDRegistered(string)           // Check if exists
```

### VCRegistry
```solidity
issueVC(id, subject, hash, expiry) // Issue credential
revokeVC(id)                        // Revoke credential
restoreVC(id)                       // Restore revoked
getVC(id)                           // Get details
isVCValid(id)                       // Check validity
getSubjectCredentials(addr)         // Get user's VCs
getIssuerCredentials(addr)          // Get issued VCs
```

## 🔐 Security Notes

- 🔒 Private keys stay in wallet (MetaMask)
- 🔒 Credentials hashed on-chain (full content on IPFS)
- 🔒 Selective disclosure prevents info leaks
- 🔒 All transactions signed by user
- 🔒 Environment variables never in git (.gitignore)

## 📊 Data Models

### DID (Decentralized Identifier)
```
did:ethr:0x123456789...
├─ Method: ethr (Ethereum)
├─ Network: mainnet/testnet
└─ Address: 0x123456...
```

### Verifiable Credential
```json
{
  "issuer": "did:ethr:0xIssuer...",
  "credentialSubject": {
    "id": "did:ethr:0xUser...",
    "name": "John Doe",
    "degree": "BSc Computer Science"
  },
  "issuanceDate": "2025-11-14T...",
  "expirationDate": "2030-11-14T...",
  "proof": { "jwt": "eyJhbG..." }
}
```

### Verifiable Presentation
```json
{
  "verifiableCredential": [{ /* VC */ }],
  "proof": { "jwt": "eyJhbG..." },
  "verifier": ["did:ethr:0xVerifier..."]
}
```

## 🎨 UI Colors & Design

- **Primary**: Blue (#2563EB)
- **Secondary**: Purple (#7C3AED)
- **Background**: Slate-900 (#0F172A)
- **Text**: White/Slate-300
- **Accent**: Green (#16A34A)
- **Danger**: Red (#DC2626)

## 📱 Responsive Breakpoints

- Mobile: 0-640px
- Tablet: 640px-1024px
- Desktop: 1024px+

## 🧪 Testing Workflow

```
1. npm run hardhat:compile     # Check syntax
2. npm run hardhat:node        # Start blockchain
3. npm run hardhat:deploy      # Deploy contracts
4. npm run dev                 # Start frontend
5. Open localhost:3000         # Test UI
6. Connect MetaMask            # Test wallet
7. Create DID                  # Test identity
8. Issue credential            # Test issuance
9. Verify credential           # Test verification
```

## 🐛 Common Issues & Fixes

| Issue | Solution |
|-------|----------|
| Module not found | `npm install [package]` |
| Port 3000 in use | `npm run dev -- -p 3001` |
| Hardhat node fails | Ensure Node.js 18+ installed |
| MetaMask not found | Install MetaMask extension |
| Contract deployment fails | Check Hardhat node running |
| Tailwind not working | `npm install -D tailwindcss-animate` |
| `.env` not loaded | Restart dev server |

## 📈 Performance Tips

- Use `next/Image` for images
- Lazy load components with dynamic imports
- Batch blockchain transactions when possible
- Cache IPFS responses
- Use SWR/React Query for data fetching
- Enable compression in production

## 🔗 Important URLs

- **Frontend**: http://localhost:3000
- **Hardhat**: http://127.0.0.1:8545
- **MetaMask**: https://metamask.io
- **Pinata**: https://www.pinata.cloud
- **Veramo Docs**: https://veramo.io
- **Solidity Docs**: https://docs.soliditylang.org/

## 📞 Git Commands

```bash
git init                          # Initialize repo
git add .                         # Stage all files
git commit -m "Initial commit"    # Commit
git branch -M main               # Rename to main
git remote add origin [url]      # Add remote
git push -u origin main          # Push
```

## ⚡ Development Tips

1. **Use React DevTools** - Debug components easily
2. **Use MetaMask DevTools** - Debug Web3 interactions
3. **Use Hardhat debugger** - Debug smart contracts
4. **Check browser console** - For JavaScript errors
5. **Use `console.log`** - For quick debugging
6. **Enable Etherscan verification** - Before production

## 🚀 Deployment Checklist

- [ ] All environment variables set
- [ ] Smart contracts audited
- [ ] Contract addresses updated
- [ ] Frontend tested thoroughly
- [ ] HTTPS enabled
- [ ] CORS configured
- [ ] Rate limiting enabled
- [ ] Error tracking setup (Sentry)
- [ ] Analytics enabled
- [ ] Backup & recovery plan

## 📖 Learning Path

1. **Solidity Basics** → Deploy simple contract
2. **Web3.js/Ethers** → Connect wallet
3. **Smart Contract Interaction** → Read/write state
4. **DID Concepts** → Understand DIDs
5. **Verifiable Credentials** → Understand VCs
6. **IPFS** → Store data on IPFS
7. **Veramo** → Implement identity
8. **Selective Disclosure** → Advanced privacy

## 🎓 Resources by Topic

**Blockchain**
- Ethers.js: https://docs.ethers.org
- Hardhat: https://hardhat.org
- Solidity: https://docs.soliditylang.org

**Identity**
- W3C VC: https://www.w3.org/TR/vc-data-model/
- Veramo: https://veramo.io
- DIDs: https://w3c-ccg.github.io/did-core/

**Frontend**
- Next.js: https://nextjs.org
- React: https://react.dev
- Tailwind: https://tailwindcss.com

**Storage**
- IPFS: https://docs.ipfs.tech
- Pinata: https://www.pinata.cloud

---

**Quick Ref v1.0** | Last Updated: Nov 14, 2025
