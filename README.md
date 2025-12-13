
# 🎲 BaseLottery Oracle

A simple on-chain lottery system for **Base** using Chainlink-style randomness (pseudo RNG for demo).
Designed as a learning + starter project.

## Features
- ETH-based lottery
- Max players per round
- Owner-controlled draw
- Winner paid automatically
- Base Sepolia + Base Mainnet ready

⚠️ Not production randomness. Replace RNG before mainnet use.

## Setup
```bash
npm install
cp .env.example .env
npx hardhat compile
npx hardhat test
```

## Deploy
```bash
npx hardhat run scripts/deploy.ts --network baseSepolia
```

## Draw Winner
```bash
npx hardhat run scripts/draw.ts --network baseSepolia
```

## License
MIT
