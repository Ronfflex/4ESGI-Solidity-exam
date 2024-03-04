// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Functions.sol";

contract SmartBet is BettingFunctions {
    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Function to add a new match
    function addMatch(uint _id, string memory _homeTeam, string memory _awayTeam) external onlyAdmin {
        require(matches[_id].id == 0, "Match already exists");
        matches[_id] = Match(_id, _homeTeam, _awayTeam, 0, 0, false, new address[](0));
    }

    // Function to update match result by admin
    function updateMatchResult(uint _id, uint _homeTeamScore, uint _awayTeamScore) external onlyAdmin {
        require(matches[_id].id != 0, "Match does not exist");
        Match storage matchData = matches[_id];
        matchData.homeTeamScore = _homeTeamScore;
        matchData.awayTeamScore = _awayTeamScore;
        matchData.resultConfirmed = true;
    }

    // Function to withdraw admin earnings
    function withdrawAdminEarnings(uint _amount) external onlyAdmin {
        require(_amount <= address(this).balance, "Insufficient contract balance");
        payable(admin).transfer(_amount);
    }
}
