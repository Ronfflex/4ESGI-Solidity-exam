// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Structs.sol";


library Utils {
    // Fonction de recherche d'utilisateur dans un tableau d'utilisateurs
    function findUser(address _userAddress, User[] storage _users) internal view returns (uint) {
        for (uint i = 0; i < _users.length; i++) {
            if (_users[i].userAddress == _userAddress) {
                return i;
            }
        }
        revert("User not found");
    }

    // Fonction de recherche de participation dans un tableau de participations
    function findParticipation(uint _matchId, address _userAddress, Participation[] storage _participations) internal view returns (uint) {
        for (uint i = 0; i < _participations.length; i++) {
            if (_participations[i].matchId == _matchId && _participations[i].userAddress == _userAddress) {
                return i;
            }
        }
        revert("Participation not found");
    }
}
