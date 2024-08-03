// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Define the ERCToken contract, inheriting from ERC20 and Ownable
contract ERCToken is ERC20, Ownable {
    
    constructor() ERC20("Prism", "PSM") Ownable(msg.sender) {
        // Mint 100 tokens to the deployer's address (msg.sender)
        // The amount is multiplied by 10^18 to account for the token's decimal places
        _mint(msg.sender, 100 * 18 ** decimals());
    }

    // Function to mint new tokens
    // - `to` is the address where the new tokens will be sent
    // - `amount` is the number of tokens to be minted
    // This function can only be called by the contract owner
    function mintToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens
    // - `amount` is the number of tokens to be burned
    // Any token holder can call this function to destroy their own tokens
    function burnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // - `recipient` is the address to transfer tokens to
    // - `amount` is the number of tokens to transfer
    // Any token holder can call this function to transfer their tokens to another address
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }
}
