# SmartBet - Football Match Betting Platform (Solidity exam 4IBC ESGI)

SmartBet is a decentralized platform for betting on football matches using Ethereum smart contracts. Users can place bets on the scores of football matches in the Premier League and win rewards based on their correct predictions.

## Files

The project consists of the following files:

1. `SmartBet.sol`: This Solidity smart contract implements the main functionalities of the SmartBet platform, including registering users, placing bets, managing participations, and distributing winnings.

2. `BettingFunctions.sol`: This Solidity smart contract contains reusable functions for managing bets and participations. It is imported and used in the `SmartBet.sol` contract.

3. `Structs.sol`: This Solidity file defines the data structures used in the project, including `User`, `Match`, and `Participation`.

4. `deploy.ts`: This TypeScript script deploys the `SmartBet` contract to an Ethereum network using Hardhat.

5. `SmartBet.test.js`: This JavaScript test file contains unit tests for the `SmartBet` contract using Chai.

## Prerequisites

Before running the project, make sure you have the following installed:

- Node.js
- Hardhat
- Hardhat Ethereum network (e.g., localhost, Sepolia, etc.)
- Ethereum wallet (e.g., MetaMask) for interacting with the smart contracts if on a testnet or mainnet

## How to Run

1. Clone this repository to your local machine:

```bash
git clone https://github.com/Ronfflex/4ESGI-Solidity-exam.git
```

2. Install dependencies:

```bash
cd 4ESGI-Solidity-exam
npm install
```

3. Compile the contracts:

```bash
npx hardhat compile
```

4. Deploy the SmartBet contract:

```bash
npx hardhat run scripts/deploy.ts --network <network-name>
```

Replace `<network-name>` with the name of the Ethereum network you want to deploy to (e.g., `localhost`, `sepolia`, etc.).

5. Run tests:

```bash
npx hardhat test
```

This command will run the tests defined in `SmartBet.test.js`.

## Usage

Once the SmartBet contract is deployed, users can interact with it using an Ethereum wallet (e.g., MetaMask) and an Ethereum-enabled browser (e.g., Brave, Chrome with MetaMask extension). Users can register, place bets, and manage participations through the contract's functions.

## Subject (french)

Mini-projet solidity
Titre du Projet : SmartBet - Plateforme de Pronostics sur les Matchs de Football de la Première Ligue

Description :
Dans ce mini-projet, vous allez créer une plateforme de pronostics sur les matchs de football de la première ligue en utilisant le langage Solidity pour les contrats intelligents et Hardhat pour le développement et le déploiement. Les utilisateurs pourront participer en pariant sur les scores des matchs en payant un montant d'entrée. À la fin de chaque journée de matchs, les gagnants seront déterminés en fonction de leurs pronostics corrects et recevront une partie du montant total des participations.

Fonctionnalités :
Enregistrement des Utilisateurs : Les utilisateurs pourront s'inscrire sur la plateforme en fournissant leurs informations d'identification.
Parier sur les Matchs : Les utilisateurs pourront parier sur les scores des matchs en spécifiant les scores qu'ils prédisent.
Gestion des Participations : Les utilisateurs devront payer un montant d'entrée pour chaque participation. Ce montant sera collecté et utilisé pour déterminer les gains des gagnants.
Détermination des Gagnants : À la fin de chaque journée de matchs, les scores réels des matchs seront vérifiés et comparés aux pronostics des utilisateurs. Les utilisateurs ayant les pronostics les plus précis seront désignés comme gagnants.
Distribution des Gains : Les gains seront distribués aux 5 gagnants en fonction du montant total des participations. Dans le cas où on a plus de 5 gagnants, on en choisit aléatoirement que 5.
Gestion de l'Administration : Un administrateur pourra gérer les matchs, les utilisateurs et les résultats.

Instructions :
Mettez en place un environnement de développement avec Hardhat pour la compilation, le déploiement et les tests.
Créez les contrats intelligents nécessaires pour implémenter les fonctionnalités décrites ci-dessus.
Implémentez les fonctions pour l'enregistrement des utilisateurs, la participation aux pronostics, la gestion des participations et la détermination des gagnants.
Déployez les contrats sur un réseau de test (par exemple, Sepolia).
Testez les fonctionnalités en simulant différentes situations (inscription, participation, détermination des gagnants, etc.).
Documentez votre code et votre processus de développement (un simple fichier readme).

Contraintes :
Limitez-vous à une journée de matchs pour simplifier le projet.
Un utilisateur ne peut réaliser qu’un seul pronostic sur un match donné.
Gardez à l'esprit la sécurité des contrats intelligents et évitez les vulnérabilités potentielles comme les attaques de re-entrance ou DDoS. Indice: pensez à mettre en place le modèle pull over push afin d’éviter les attaque DDoS liées au revert provoqués par les utilisateurs (cf. https://consensys.github.io/smart-contract-best-practices/attacks/denial-of-service/).

Bonus :
Implémentez une interface utilisateur simple pour interagir avec les contrats intelligents.
Implémentez un générateur aléatoire pour désigner les 5 gagnants à l’aide du smart contract VRF du chainlink.
Ce projet vous permettra de mettre en pratique vos connaissances en Solidity et de vous familiariser avec le développement de contrats intelligents pour des applications réelles. Amusez-vous bien et bon courage !

