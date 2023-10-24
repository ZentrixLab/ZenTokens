// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZenERC20 is ERC20, Ownable {

    uint256 public price;

    constructor(uint256 _price)
        ERC20("ZenToken", "ZTK")
        Ownable(msg.sender)
    {
        price = _price;
    }

    function mint(address to, uint256 amount) public payable {
        require(msg.value == amount * price, 'Error: Not enough ether supplied');
        _mint(to, amount);
    }
}