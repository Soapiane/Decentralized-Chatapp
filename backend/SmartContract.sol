// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MessageContract{

    mapping(string => string) private users; // Mapping username-password

    event Registered(address indexed user, string username); // Event emitted after successful registration
    event LoggedIn(address indexed user, string username); // Event emitted after successful login

    function register(string memory _username, string memory _password) public {
        require(bytes(users[_username]).length == 0, "Username already exists");
        users[_username] = _password;
        emit Registered(msg.sender, _username);
    }

    function login(string memory _username, string memory _password) public view returns (bool) {
        return keccak256(abi.encodePacked(users[_username])) == keccak256(abi.encodePacked(_password));
    }
}