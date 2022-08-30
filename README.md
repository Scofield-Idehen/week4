# week4
Today i learnt how to use the constant and immutable keywords to save gas on my transactions, i saw how constant can be use when the sythax is on a single line, for example uint public MIN_AMOUNT = 50;

We can insert the constant here to save the variable inside the byte data.

uint public constant MIN_AMOUNT = 50;

in a situation where our variable is used in mutiple line like the constructor we can use the immutable keyword on the variable function like so.

address public immutable i_owner 

constructor{
  i_owner = msg.sender;
}
