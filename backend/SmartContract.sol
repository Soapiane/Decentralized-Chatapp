// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ChatApp{

    // ------------------------------------------- Structs -------------------------------------------

    struct User{
         string username;
         bytes32 passwordHash;
         bytes32 sessionToken;
         address userAddress;
   }

   
    struct ChatRoom{
        bytes32 id;
        string name;
        bytes32 secretPassword;
        address[] members;
    }



    mapping(address=>User) private users;
    mapping(bytes32=>ChatRoom) public chatRooms;
    mapping(string=>bool) private usernames;

    // ------------------------------------------- Modifiers -------------------------------------------
   modifier userExists(){
       require(users[msg.sender].userAddress != address(0), "User not found");
       _;
   }

   modifier userDoesNotExist(){
       require(users[msg.sender].userAddress == address(0), "User already exists");
       _;
   }

   modifier usernameNotTaken(string memory username){
       require(!usernames[username], "Username already taken");
       _;
   }

   modifier chatRoomAlreadyExists(bytes32 chatRoomId){
         require(chatRooms[chatRoomId].id != 0, "Chat room does not exist");
       _;
   }

   modifier chatRoomDoesNotExist(bytes32 chatRoomId){
       require(chatRooms[chatRoomId].id == 0, "Chat room already exists");
       _;
   }



   // ------------------------------------------- Users -------------------------------------------


   function register(string memory username, string memory password) public userDoesNotExist usernameNotTaken(username) returns (bytes32){
    require(bytes(password).length > 5, "Password must have at least 6 characters");
    bytes32 passwordHash = keccak256(abi.encodePacked(password));
    bytes32 sessionToken = keccak256(abi.encodePacked(username, passwordHash, block.timestamp));
    users[msg.sender] = User(username, passwordHash, sessionToken, msg.sender);
    usernames[username] = true;
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

   // ------------------------------------------- Chatrooms -------------------------------------------

      function createChatRoom(bytes32 sessionToken , string calldata chatRoomName) public userExists returns (ChatRoom memory){
       require(users[msg.sender].sessionToken == sessionToken, "Invalid session token");
        address[] memory members = new address[](1);
        members[0] = msg.sender;
        bytes32 chatRoomId = keccak256(abi.encodePacked(sessionToken,chatRoomName, block.timestamp));
        bytes32 secretPassword = keccak256(abi.encodePacked(chatRoomId, block.timestamp));
        ChatRoom memory newRoom = ChatRoom(chatRoomId, chatRoomName,secretPassword, members);
       chatRooms[chatRoomId] = newRoom;
       return newRoom;
   }





}