//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library DataFeed{

    function GetpriceValue()internal view returns(uint) {
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int price,,,)=PriceFeed.latestRoundData();
        return uint(price * 1e10);
    }
    function ValueRate(uint _ethamount)internal view returns(uint){
        uint NewValue = GetpriceValue();
        uint ValueinUSD = (NewValue * _ethamount) /1e18;
        return ValueinUSD;


    }

    
}
