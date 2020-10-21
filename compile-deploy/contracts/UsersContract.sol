pragma solidity ^0.4.17;

contract UsersContract {

    struct User {
        string name;
        string lastname;
    }

    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    address[] total;

    event onUserJoined(address, string);

    function join(string name, string lastname) public {
        require(!userJoines(msg.sender));
        User storage user = users[msg.sender];
        user.name = name;
        user.lastname = lastname;
        joinedUsers[msg.sender] = true;
        total.push(msg.sender);

        onUserJoined(msg.sender, string(abi.encodePacked(name, " ", lastname)));
    }

    function getUser(address addr) public view returns (string, string) {
        require(userJoines(msg.sender));
        User memory user = users[addr];
        return (user.name, user.lastname);
    }

    function userJoines(address addr) private view returns (bool) {
        return joinedUsers[addr];
    }

    function totalUsers() public view returns (uint) {
        return total.length;
    }

}