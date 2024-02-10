// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ChatApp{

    struct User{
         string username;
         bytes32 passwordHash;
         bytes32 sessionToken;
         address userAddress;
   }

   
    struct ChatRoom{
        string name;
        address[] members;
    }

    mapping(address=>User) public users;


   modifier userExists(){
       require(users[msg.sender].userAddress != address(0), "User not found");
       _;
   }

   modifier userDoesNotExist(){
       require(users[msg.sender].userAddress == address(0), "User already exists");
       _;
   }


   function register(string memory username, string memory password) public userDoesNotExist returns (bytes32){
    bytes32 passwordHash = keccak256(abi.encodePacked(password));
    bytes32 sessionToken = keccak256(abi.encodePacked(username, passwordHash, block.timestamp));
    users[msg.sender] = User(username, passwordHash, sessionToken, msg.sender);

    // Return the session token
    return sessionToken;
   }

   function login(string memory password) public userExists returns (bytes32){
       bytes32 passwordHash = keccak256(abi.encodePacked(password));
       require(users[msg.sender].passwordHash == passwordHash, "Invalid username or password");
       string memory username = users[msg.sender].username;
       bytes32 sessionToken = keccak256(abi.encodePacked(username, passwordHash, block.timestamp));
       users[msg.sender].sessionToken = sessionToken;
       return sessionToken;
   }

}