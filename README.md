# MyToken Smart Contract

## Overview

The `MyToken` contract is an ERC20-compliant token smart contract written in Solidity. It provides functionality for minting new tokens, burning existing tokens, and is owned by a single deployer who has special privileges to create new tokens.

## Features

- **ERC20 Standard**: Implements the ERC20 standard for creating fungible tokens.
- **Owner Privileges**: The deployer of the contract (owner) can mint new tokens to any address.
- **Token Burn**: Allows any token holder to burn their own tokens, reducing the total supply.

## Installation

To use this contract, you need to have the following dependencies:

- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts): For standard ERC20 and Ownable implementations.

To install OpenZeppelin Contracts, run:
```bash
npm install @openzeppelin/contracts

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // Initializes the token with a specific name and symbol
    constructor() ERC20("MyToken", "MTK") {
        // Mint an initial supply of tokens to the contract deployer
        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }

    // Allows only the contract owner to create new tokens and assign them to a specified address
    function createTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    // Permits token holders to burn (destroy) their own tokens
    function destroyTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
```
## Deployment
1. Compile the Contract: Use a Solidity compiler (like solc or an IDE like Remix).
2. Deploy the Contract: Deploy the contract to an Ethereum network using a tool like Hardhat, Truffle, or Remix.
3. Interact with the Contract:
- Use the createTokens function to mint new tokens (only callable by the contract owner).
- Use the destroyTokens function to burn your own tokens.

## Author
Clyde Calub
