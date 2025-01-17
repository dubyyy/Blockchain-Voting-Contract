// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting {

   struct Candidate {
    string name;
    uint256 voteCount;
   }

   Candidate[] public candidates;

    address owner;

    mapping (address=>bool) public voters;

    uint256 voteStart;
    uint256 voteEnd;

    constructor(string[] memory _candidateNames,uint256 _duration){
        for(uint256 i=0;i<_candidateNames.length;i++){
            candidates.push( Candidate ({
                 name: _candidateNames[i],
                 voteCount:0
            }));
        }
        owner=msg.sender;
        voteStart=block.timestamp;
        voteEnd=block.timestamp +(_duration*  1 minutes);
    }
    modifier onlyOwner{
       require(msg.sender==owner);
       _;
    }
    function addCandidate(string memory _name) public onlyOwner{
            candidates.push( Candidate ({
                 name: _name,
                 voteCount:0
            }));
    }

    function vote(uint256 _canditateIndex) public {
            require(!voters[msg.sender],"you have already voted");
            require(_canditateIndex<candidates.length,"invalid index");
            candidates[_canditateIndex].voteCount++ ;
            voters[msg.sender]==true;
} 
    function getAllVotesOfCandidates() public view returns (Candidate[] memory){
            return candidates;
    }

    function getVotingStatus() public view returns (bool){
        return (block.timestamp>=voteStart&&block.timestamp<=voteEnd);
    }

    function getRemainingTime() public view returns (uint256) {
            require(block.timestamp>=voteStart);
            if(block.timestamp>=voteStart){
                return 0;
            }
            return voteEnd - block.timestamp;

    }


} 
