#!/bin/bash
# Installation & Setup Commands for IdentityVault
# Run these commands in order from the identity-vault directory

echo "=========================================="
echo "IdentityVault - Installation Commands"
echo "=========================================="
echo ""

# Step 1: Install Dependencies
echo "Step 1: Installing npm dependencies..."
echo "Command: npm install"
echo ""

# Step 2: Install Additional Tailwind Packages
echo "Step 2: Installing Tailwind plugins..."
echo "Command: npm install -D tailwindcss-animate"
echo ""

# Step 3: Install Type Definitions
echo "Step 3: Installing type definitions..."
echo "Command: npm install -D @types/node"
echo ""

# Step 4: Verify Installation
echo "Step 4: Verify critical packages..."
echo "Commands:"
echo "  npm list ethers"
echo "  npm list veramo"
echo "  npm list next"
echo ""

# Step 5: Compile Smart Contracts
echo "Step 5: Compile Solidity contracts..."
echo "Command: npm run hardhat:compile"
echo ""

# Step 6: Start Local Blockchain (Terminal 1)
echo "Step 6: Start Hardhat local blockchain (in Terminal 1)..."
echo "Command: npm run hardhat:node"
echo ""
echo "Expected Output:"
echo "  > Started HTTP and WebSocket JSON-RPC server at http://127.0.0.1:8545/"
echo "  > Accounts:"
echo "  > Account #0: 0x1234..."
echo ""

# Step 7: Deploy Contracts (Terminal 2)
echo "Step 7: Deploy smart contracts (in Terminal 2, after node starts)..."
echo "Command: npm run hardhat:deploy"
echo ""
echo "Expected Output:"
echo "  ✓ DIDRegistry deployed to: 0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c"
echo "  ✓ VCRegistry deployed to: 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"
echo ""

# Step 8: Start Dev Server (Terminal 3)
echo "Step 8: Start Next.js development server (in Terminal 3)..."
echo "Command: npm run dev"
echo ""
echo "Expected Output:"
echo "  ▲ Next.js 15.0.0"
echo "  - Local: http://localhost:3000"
echo ""

# Step 9: Update Environment Variables
echo "Step 9: Update .env.local with contract addresses..."
echo "Edit .env.local and add:"
echo ""
echo "  NEXT_PUBLIC_DID_REGISTRY_ADDRESS=0x5FbDB2315678afccb333f8a9c61662f00ebc6f4c"
echo "  NEXT_PUBLIC_VC_REGISTRY_ADDRESS=0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"
echo ""

# Step 10: Optional - Setup Pinata
echo "Step 10: (Optional) Setup Pinata IPFS Integration..."
echo ""
echo "1. Sign up at https://www.pinata.cloud"
echo "2. Create API key"
echo "3. Add to .env.local:"
echo ""
echo "  NEXT_PUBLIC_PINATA_API_KEY=your_api_key"
echo "  NEXT_PUBLIC_PINATA_API_SECRET=your_api_secret"
echo ""

echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "📋 Checklist:"
echo "  ☐ npm install completed"
echo "  ☐ Tailwind plugins installed"
echo "  ☐ Type definitions installed"
echo "  ☐ Contracts compiled (npm run hardhat:compile)"
echo "  ☐ Hardhat node running (npm run hardhat:node)"
echo "  ☐ Contracts deployed (npm run hardhat:deploy)"
echo "  ☐ Dev server running (npm run dev)"
echo "  ☐ .env.local updated with contract addresses"
echo "  ☐ Pinata API keys added (optional)"
echo ""
echo "🚀 Next Steps:"
echo "  1. Open http://localhost:3000"
echo "  2. Connect MetaMask wallet"
echo "  3. Create a DID"
echo "  4. Issue your first credential"
echo ""

echo "📚 Documentation:"
echo "  - README.md: Overview and features"
echo "  - SETUP_GUIDE.md: Detailed setup instructions"
echo "  - ARCHITECTURE.md: System design and data flows"
echo ""

echo "💡 Troubleshooting:"
echo "  - Can't connect wallet? Make sure Hardhat node is running"
echo "  - Contracts not found? Check .env.local addresses"
echo "  - Styling issues? Restart dev server after Tailwind installation"
echo ""
