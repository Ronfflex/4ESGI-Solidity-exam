// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Structs.sol";

contract BettingFunctions {
    // Mapping to store users
    mapping(address => User) public users;
    
    // Mapping to store matches
    mapping(uint => Match) public matches;
    
    // Mapping to store participations
    mapping(address => mapping(uint => Participation)) public participations;
    
    // Event to emit when a new user is registered
    event UserRegistered(address indexed userAddress);
    
    // Event to emit when a user places a bet
    event BetPlaced(address indexed userAddress, uint indexed matchId, uint homeTeamScore, uint awayTeamScore, uint amount);
    
    // Event to emit when participation is managed (after the match)
    event ParticipationManaged(address indexed userAddress, uint indexed matchId, uint homeTeamScore, uint awayTeamScore, uint winnings);

    // Function to register a new user
    function registerUser(address _userAddress) external {
        require(!users[_userAddress].registered, "User already registered");
        users[_userAddress] = User(_userAddress, 0, true);
        emit UserRegistered(_userAddress);
    }
    
    // Function to place a bet on a match
    function placeBet(uint _matchId, uint _homeTeamScore, uint _awayTeamScore) external payable {
        require(msg.value > 0, "Invalid bet amount");
        require(matches[_matchId].id != 0, "Match does not exist");
        
        // Ensure user has not already placed a bet on this match
        require(!participations[msg.sender][_matchId].settled, "User already placed a bet on this match");
        
        // Add the user to the participants array for this match
        Match storage matchData = matches[_matchId];
        matchData.participants.push(msg.sender);
        
        // Record the user's participation
        participations[msg.sender][_matchId] = Participation(_matchId, msg.sender, _homeTeamScore, _awayTeamScore, msg.value, false);
        emit BetPlaced(msg.sender, _matchId, _homeTeamScore, _awayTeamScore, msg.value);
    }
    
    // Function to manage participations after the match
    function manageParticipation(uint _matchId, uint _homeTeamScore, uint _awayTeamScore) external {
        require(matches[_matchId].id != 0, "Match does not exist");
        Match storage matchData = matches[_matchId];
        
        // Iterate through all participations for this match
        for (uint i = 0; i < matchData.participants.length; i++) {
            address userAddress = matchData.participants[i];
            Participation storage participation = participations[userAddress][_matchId];
            
            // Check if the user's prediction is correct
            if (participation.homeTeamScorePrediction == _homeTeamScore && participation.awayTeamScorePrediction == _awayTeamScore) {
                // Calculate winnings and update user's balance (fixed odds because flemme de faire des cotes variables)
                uint winnings = participation.amountBet * 1 / 100;
                users[userAddress].totalGains += winnings;
                
                // Emit event for managing participation
                emit ParticipationManaged(userAddress, _matchId, _homeTeamScore, _awayTeamScore, winnings);
            }
        }
        
        // Reset match data after managing participations
        delete matches[_matchId];
    }
}
