import { ethers } from "hardhat";

describe("SmartBet", function () {
    // Define variables to store contract instances
    let smartBetContract;
    let admin;
    let user1;

    // Deploy the contract and set up accounts before each test
    beforeEach(async function () {
        // Get accounts from the Hardhat node
        [admin, user1] = await ethers.getSigners();

        // Deploy the SmartBet contract
        const SmartBet = await ethers.getContractFactory("SmartBet");
        smartBetContract = await SmartBet.deploy();
        await smartBetContract.deployed();
    });

    // Test the addMatch function
    it("Should add a new match", async function () {
        // Execute the addMatch function
        await smartBetContract.addMatch(1, "Team A", "Team B");

        // Check if the match is added successfully
        const match = await smartBetContract.matches(1);
        assert.equal(match.homeTeam, "Team A", "Home team is incorrect");
        assert.equal(match.awayTeam, "Team B", "Away team is incorrect");
    });

    // Test the updateMatchResult function
    it("Should update match result", async function () {
        // Add a new match
        await smartBetContract.addMatch(1, "Team A", "Team B");

        // Execute the updateMatchResult function
        await smartBetContract.updateMatchResult(1, 2, 1);

        // Check if the match result is updated successfully
        const match = await smartBetContract.matches(1);
        assert.equal(match.homeTeamScore, 2, "Home team score is incorrect");
        assert.equal(match.awayTeamScore, 1, "Away team score is incorrect");
    });

    // Test the withdrawAdminEarnings function
    it("Should withdraw admin earnings", async function () {
        // Get initial contract balance
        const initialBalance = await ethers.provider.getBalance(admin.address);

        // Execute the withdrawAdminEarnings function
        await smartBetContract.withdrawAdminEarnings(100);

        // Get updated contract balance
        const updatedBalance = await ethers.provider.getBalance(admin.address);

        // Check if admin earnings are withdrawn correctly
        assert.equal(updatedBalance.sub(initialBalance).toNumber(), 100, "Admin earnings are incorrect");
    });
});
