const { ethers } = require("hardhat");
const { assert } = require("chai");

describe("SmartBet", function () {
    let smartBetContract;
    let admin;
    let user1;

    beforeEach(async function () {
        [admin, user1] = await ethers.getSigners();

        const contractFactory = await ethers.getContractFactory("SmartBet");
        smartBetContract = await contractFactory.deploy();

        await smartBetContract.waitForDeployment();
    });

    // Test the addMatch function
    it("Should add a new match", async function () {
        await smartBetContract.addMatch(1, "Team A", "Team B");

        const match = await smartBetContract.matches(1);
        assert.equal(match.homeTeam, "Team A", "Home team is incorrect");
        assert.equal(match.awayTeam, "Team B", "Away team is incorrect");
    });

    // Test the updateMatchResult function
    it("Should update match result", async function () {
        await smartBetContract.addMatch(1, "Team A", "Team B");

        await smartBetContract.updateMatchResult(1, 2, 1);

        const match = await smartBetContract.matches(1);
        assert.equal(match.homeTeamScore, 2, "Home team score is incorrect");
        assert.equal(match.awayTeamScore, 1, "Away team score is incorrect");
    });

    // Test the withdrawAdminEarnings function
    it("Should withdraw admin earnings", async function () {
        const initialBalance = await ethers.provider.getBalance(admin.address);

        await smartBetContract.withdrawAdminEarnings(100);

        const updatedBalance = await ethers.provider.getBalance(admin.address);

        assert.equal(updatedBalance.sub(initialBalance).toNumber(), 100, "Admin earnings are incorrect");
    });
});
