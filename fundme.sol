//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "./lib.sol";

contract fundmeAbeg{
    using DataFeed for uint;
    // we use the constant keyword when we wan to save gas // capital letters
    uint public constant MIN_AMOUNT = 50 * 1e18 ;
    address[] public funders;
    mapping(address => uint) public addrsssofsenders;
    address public immutable i_owner;

    constructor(){
        i_owner= msg.sender;
    }

    function fundAccount() public payable{
        require(msg.value.ValueRate() >= MIN_AMOUNT, "not enough funds");
        funders.push(msg.sender);
        addrsssofsenders[msg.sender] +=msg.value;
        // i think you can also use minAmunt for msg.value  
    }

    function withdraw()public onlyowner{
        //you can do it like this but this would take so much space use modifier
        //require (msg.sender == owner, "you are not the owner");
        for (uint funderindex =0; funderindex < funders.length; funderindex++){
            address fundA = funders[funderindex];
            addrsssofsenders[fundA] = 0;
        }
        funders = new address[](0);
        //using transfer to send eth 
        //payable(msg.sender).transfer(address(this).balance);

        //using send to transfer eth
        //bool success =payable(msg.sender).send(address(this).balance);
        //require(success, "failed to send");

        //the recquired way of sending eth. 
        (bool showsuccess,) =payable(msg.sender).call{value: address(this).balance}("");
        require(showsuccess, "failed");
    }
    modifier onlyowner{
        require (msg.sender == i_owner, "you are not the owner");
        _;
    }

}
