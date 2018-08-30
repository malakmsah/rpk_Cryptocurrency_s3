pragma solidity ^0.4.21;

library SafeMath {
    function add(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
        return c;
    }
    function sub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        return c = a - b;
    }
}
