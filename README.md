# IdentityVault - Decentralized Digital Identity & Credential Vault

A modern, self-sovereign identity management system built on blockchain with verifiable credentials, decentralized identifiers (DIDs), and IPFS integration.

## 🎯 Overview

**IdentityVault** is a full-stack MVP for replacing centralized identity systems (like DigiLocker) with a blockchain-based, self-sovereign solution. Users can:

- ✅ Create and manage DIDs on-chain
- ✅ Issue and verify W3C Verifiable Credentials
- ✅ Store credentials on IPFS with Pinata
- ✅ Perform selective disclosure (share only what you need)
- ✅ Revoke credentials with one click
- ✅ Never share your private key with anyone

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- MetaMask or compatible Web3 wallet
- Pinata account (for IPFS pinning)
- Hardhat for local blockchain

### Installation

```bash
# Navigate to the project directory
cd identity-vault

# Install dependencies
npm install

# Install Tailwind dependencies
npm install -D tailwindcss-animate

# Install additional dev dependencies
npm install -D @types/node
```

### Environment Setup

Create a `.env.local` file:

```env
# Blockchain Configuration
NEXT_PUBLIC_RPC_URL=http://localhost:8545
NEXT_PUBLIC_CHAIN_ID=31337

# IPFS/Pinata Configuration
NEXT_PUBLIC_PINATA_API_KEY=your_key_here
NEXT_PUBLIC_PINATA_API_SECRET=your_secret_here
NEXT_PUBLIC_PINATA_GATEWAY=https://gateway.pinata.cloud

# Smart Contract Addresses (update after deployment)
NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x0000000000000000000000000000000000000000
NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0x0000000000000000000000000000000000000000

# Veramo Configuration
VERAMO_SECRET_KEY=your_secret_key
```

### Local Blockchain Setup

```bash
# Terminal 1: Start Hardhat node
npm run hardhat:node

# Terminal 2: Deploy contracts
npm run hardhat:deploy

# Terminal 3: Start Next.js dev server
npm run dev
```

The app will be available at `http://localhost:3000`

## 📁 Project Structure

```
identity-vault/
├── src/
│   ├── app/
│   │   ├── layout.tsx          # Root layout
│   │   ├── page.tsx            # Landing page
│   │   ├── globals.css         # Global styles
│   │   └── dashboard/
│   │       ├── page.tsx        # Main vault dashboard
│   │       ├── issue/          # Issue credentials
│   │       ├── verify/         # Verify credentials
│   │       └── selective-disclosure/
│   ├── components/
│   │   ├── ConnectWallet.tsx   # Wallet connection
│   │   ├── CredentialCard.tsx  # Credential display
│   │   └── ...
│   ├── lib/
│   │   ├── veramoAgent.ts      # Veramo agent setup
│   │   ├── ethers-client.ts    # Ethers.js integration
│   │   ├── pinata-client.ts    # IPFS/Pinata client
│   │   └── store.ts            # Zustand state management
│   └── api/
│       └── routes/
├── contracts/
│   ├── DIDRegistry.sol         # DID registry contract
│   └── VCRegistry.sol          # VC registry contract
├── scripts/
│   └── deploy.ts               # Deployment script
├── hardhat.config.ts
├── next.config.mjs
├── tailwind.config.ts
└── tsconfig.json
```

## 🏗️ Architecture

### Smart Contracts

#### DIDRegistry.sol
- Maps DIDs (strings) to owners (Ethereum addresses)
- Supports DID registration, transfer, and lookup
- Events for monitoring DID lifecycle

#### VCRegistry.sol
- Anchors Verifiable Credentials on-chain
- Stores credential metadata and IPFS hash
- Revocation mechanism for issuers
- Expiration support

### Frontend Stack

- **Framework**: Next.js 15 with App Router
- **Styling**: Tailwind CSS + Custom components
- **State**: Zustand (lightweight alternative to Redux)
- **Blockchain**: Ethers.js v6
- **Identity**: Veramo (DID & VC management)
- **Storage**: IPFS via Pinata API

### Core Services

| Service | Purpose |
|---------|---------|
| `veramoAgent.ts` | DID creation, VC issuance/verification |
| `ethers-client.ts` | Smart contract interaction |
| `pinata-client.ts` | Upload/retrieve from IPFS |
| `store.ts` | Authentication and vault state |

## 🔄 Key Workflows

### 1. User Registration (Create DID)

```
User → Connect Wallet → Create DID (Veramo) → Register on DIDRegistry
```

### 2. Issue Credential

```
Issuer → Fill credential form → Create VC (Veramo)
  → Upload to IPFS (Pinata) → Anchor hash on VCRegistry
  → Emit VCIssued event
```

### 3. Verify Credential

```
Verifier → Request VP (Verifiable Presentation) → User approves
  → Generate VP with selective disclosure → Verify on-chain
  → Check VCRegistry revocation status
```

### 4. Selective Disclosure

```
User selects claims to reveal → Zero-knowledge proof
  → Verifier receives only disclosed properties
  → User's full identity remains private
```

## 📦 Dependencies

### Core Dependencies

```json
{
  "ethers": "^6.10.0",
  "@veramo/core": "^5.6.0",
  "@veramo/credential-w3c": "^5.6.0",
  "@veramo/did-manager": "^5.6.0",
  "@veramo/did-provider-ethr": "^5.6.0",
  "did-jwt": "^7.4.0",
  "axios": "^1.6.0",
  "zustand": "^4.4.0"
}
```

### Dev Dependencies

```json
{
  "hardhat": "^2.19.0",
  "@nomicfoundation/hardhat-toolbox": "^4.0.0",
  "tailwindcss": "^3.4.0"
}
```

## 🔐 Security Considerations

- **Private Keys**: Never expose in frontend. Use hardware wallets for production.
- **IPFS Hashes**: Used as commitment mechanism. Actual VC stored on IPFS.
- **Selective Disclosure**: Implement zero-knowledge proofs for sensitive claims.
- **Contract Upgradability**: Consider proxy patterns for future updates.

## 📚 API Reference

### Veramo Agent

```typescript
// Create a new DID
const did = await agent.didManagerCreate({ provider: 'ethr' })

// Create a Verifiable Credential
const vc = await agent.createVerifiableCredential({
  credential: {
    issuer: { id: issuerDid },
    credentialSubject: { id: subjectDid, ...claims },
  },
  proofFormat: 'jwt'
})

// Verify a credential
const verified = await agent.verifyCredential({ credential: vc })
```

### Ethers.js Integration

```typescript
// Register DID on-chain
const tx = await didRegistry.registerDID(did)
await tx.wait()

// Issue VC on-chain
const credId = ethers.id("unique-credential-id")
const tx = await vcRegistry.issueVC(credId, subject, ipfsHash, expiresAt)
await tx.wait()
```

### Pinata API

```typescript
// Upload to IPFS
const ipfsHash = await uploadToPinata(credential, "credential.json")

// Retrieve from IPFS
const credential = await retrieveFromIPFS(ipfsHash)
```

## 🧪 Testing

```bash
# Run Hardhat tests
npx hardhat test

# Test smart contracts locally
npm run hardhat:node
```

## 🚀 Deployment

### Testnet (Sepolia)

1. Update `hardhat.config.ts` with Infura/Alchemy RPC
2. Configure `DEPLOYER_PRIVATE_KEY` in `.env.local`
3. Deploy:

```bash
npx hardhat run scripts/deploy.ts --network sepolia
```

### Mainnet

Update contract addresses in `.env.local` after deployment.

## 📖 Useful Resources

- [Veramo Documentation](https://veramo.io/)
- [W3C Verifiable Credentials](https://www.w3.org/2017/vc/working-group/)
- [Ethers.js Documentation](https://docs.ethers.org/)
- [IPFS Documentation](https://docs.ipfs.tech/)
- [Solidity by Example](https://solidity-by-example.org/)

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - See LICENSE file for details

## ⚠️ Disclaimer

This is an MVP/hackathon project. For production use:

- Conduct security audits
- Implement rate limiting and DDOS protection
- Use secure key management (HSM, KMS)
- Enable comprehensive logging and monitoring
- Follow SOC 2 compliance requirements

## 🎓 Educational Purpose

This project demonstrates:

- Smart contract development with Solidity
- Web3 integration with Ethers.js
- Decentralized identity concepts
- Verifiable credentials framework
- IPFS integration
- Modern React/Next.js patterns

---

**Built with ❤️ for the decentralized identity revolution**
