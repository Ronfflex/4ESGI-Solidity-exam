// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct User {
    address userAddress;
    uint totalGains;
    bool registered;
}

struct Match {
    uint id;
    string homeTeam;
    string awayTeam;
    uint homeTeamScore;
    uint awayTeamScore;
    bool resultConfirmed;
}

struct Participation {
    uint matchId;
    address userAddress;
    uint homeTeamScorePrediction;
    uint awayTeamScorePrediction;
    uint amountBet;
    bool settled;
}
