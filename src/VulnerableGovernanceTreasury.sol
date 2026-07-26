// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VulnerableGovernanceTreasury {
    error InsufficientStake();
    error ProposalNotFound();
    error ProposalAlreadyExecuted();
    error ThresholdNotReached();
    error TransferFailed();

    uint256 public constant EXECUTION_THRESHOLD = 5 ether;

    struct Proposal {
        address payable recipient;
        uint256 amount;
        uint256 yesVotes;
        bool executed;
    }

    mapping(address voter => uint256 amount) public stakes;
    mapping(uint256 id => Proposal) public proposals;
    uint256 public proposalCount;

    receive() external payable {}

    function stake() external payable {
        stakes[msg.sender] += msg.value;
    }

    function createProposal(address payable recipient, uint256 amount) external returns (uint256 id) {
        id = ++proposalCount;
        proposals[id] = Proposal({recipient: recipient, amount: amount, yesVotes: 0, executed: false});
    }

    function voteYes(uint256 proposalId) external {
        Proposal storage p = proposals[proposalId];
        if (p.recipient == address(0)) revert ProposalNotFound();
        if (p.executed) revert ProposalAlreadyExecuted();
        uint256 weight = stakes[msg.sender];
        if (weight == 0) revert InsufficientStake();

        p.yesVotes += weight;
    }

    function execute(uint256 proposalId) external {
        Proposal storage p = proposals[proposalId];
        if (p.recipient == address(0)) revert ProposalNotFound();
        if (p.executed) revert ProposalAlreadyExecuted();
        if (p.yesVotes < EXECUTION_THRESHOLD) revert ThresholdNotReached();

        p.executed = true;
        (bool ok,) = p.recipient.call{value: p.amount}("");
        if (!ok) revert TransferFailed();
    }
}