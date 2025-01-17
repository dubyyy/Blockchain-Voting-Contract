# Voting Smart Contract

This repository contains a simple Voting smart contract written in Solidity. It allows for the creation of a voting system where candidates can be added, and users can vote for their preferred candidates. The contract also tracks voting statuses, time remaining, and prevents duplicate voting.

---

## Features

- **Candidate Management**:  
  - Candidates can be initialized during contract deployment.
  - New candidates can be added by the contract owner after deployment.

- **Voting System**:  
  - Users can vote for a candidate by specifying their index in the list of candidates.
  - Duplicate votes by the same user are prevented.

- **Voting Status**:  
  - Check if voting is active based on the set duration.
  - Get the remaining time for voting.

- **Vote Counting**:  
  - Each candidate's vote count is tracked and can be retrieved.

---

## Functions

### 1. Constructor
Initializes the contract with:
- A list of candidate names.
- The voting duration in minutes.

### 2. `addCandidate(string memory _name)`
- Adds a new candidate to the list.  
- **Access Control**: Only the contract owner can call this function.

### 3. `vote(uint256 _candidateIndex)`
- Allows a user to vote for a candidate by specifying their index in the candidate list.  
- **Requirements**:
  - The voter has not already voted.
  - The candidate index is valid.

### 4. `getAllVotesOfCandidates()`
- Returns the list of all candidates and their respective vote counts.

### 5. `getVotingStatus()`
- Returns a boolean indicating whether the voting is currently active.

### 6. `getRemainingTime()`
- Returns the remaining time for voting in seconds.  
- If voting has ended, it returns `0`.

---

## Usage

### Contract Deployment
Deploy the contract by providing:
1. An array of candidate names (e.g., `["Alice", "Bob", "Charlie"]`).
2. The voting duration in minutes.

Example Deployment:
```solidity
["Alice", "Bob", "Charlie"], 60
