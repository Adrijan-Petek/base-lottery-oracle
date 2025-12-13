
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract BaseLottery {
    address public owner;
    uint256 public ticketPrice;
    address[] public players;

    event Enter(address indexed player);
    event Winner(address indexed winner, uint256 amount);

    constructor(uint256 _ticketPrice) {
        owner = msg.sender;
        ticketPrice = _ticketPrice;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function enter() external payable {
        require(msg.value == ticketPrice, "Wrong price");
        players.push(msg.sender);
        emit Enter(msg.sender);
    }

    function drawWinner() external onlyOwner {
        require(players.length > 0, "No players");

        uint256 rand = uint256(
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players.length))
        );

        address winner = players[rand % players.length];
        uint256 prize = address(this).balance;

        delete players;
        payable(winner).transfer(prize);

        emit Winner(winner, prize);
    }

    function playerCount() external view returns (uint256) {
        return players.length;
    }
}
