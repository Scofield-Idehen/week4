# week4
Today i learnt how to use the constant and immutable keywords to save gas on my transactions, i saw how constant can be use when the sythax is on a single line, for example uint public MIN_AMOUNT = 50;

We can insert the constant here to save the variable inside the byte data.

uint public constant MIN_AMOUNT = 50;

in a situation where our variable is used in mutiple line like the constructor we can use the immutable keyword on the variable function like so.

address public immutable i_owner 

constructor{
  i_owner = msg.sender;
}

using the require cost a lot of gas, so to save gas we use the error, create the error function above the contract like so 

error Not_Owner;

on the modifier 

modifier onlyowner{
        if (msg.sender == i_owner) {revert notOwner();}
        _;
    }




I also learnt how to use the fallback and receive function, this works in a case where someone tries to interate with my smart contract by not calling the fundAcount we created. 

once a funder send ETH to our smart contract let say directly from metamask, it is quickly updated and sent to fundaccount functions trough the receieve function, like so 

receieve() external payable {
  fundacount();

}

if the user sends soenthing other than a transaction, our fallback function which is like a fail safe for our contract, this pushes it back to receieve and if it is outline in our fundaccount function, it throws an error. 


