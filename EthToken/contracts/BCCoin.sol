pragma solidity ^0.4.21;

import "./Interface.sol";            // change this line
//import "./SafeMath.sol";

contract BCCoin is Interface {

    uint256 constant private MAX_UINT256 = 2 ** 256 - 1;
    // declare balances variable here
    mapping(address => uint256) public balances; //token

    mapping(address => mapping(address => uint256)) public allowed;

    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show.
    string public symbol;                 //An identifier: eg SBX
    uint8 public tokenValue;              //token value in ethers
    address public Owner;                 //address account who deplyed the contract
    bool result;
    uint public price;
    uint public mult_dec;

    constructor (
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        uint8 _tokenValue
    ) public {
        Owner = msg.sender;
        // your code here
        tokenValue = _tokenValue;
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
        balances[Owner] = _initialAmount;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        // your code here
        if (balances[Owner] >= _value)
        {
            balances[Owner] = sub(balances[Owner], _value);
            balances[_to] = add(balances[_to], _value);
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
        uint256 allowance = allowed[_from][msg.sender];
        // your code here
        result = false;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
            balances[_from] = sub(balances[_from], _value);
            balances[_to] = add(balances[_to], _value);
            result = true;
        }
        return result;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        return true;
    }

    function getBalance() public view returns (uint b) {
        address account = msg.sender;
        return account.balance;
    }

    // sender buys tokens from owner i.e contract balance for owner will decrease and ethers balance for owner will increase
    // increase/decrease in ether balance is handled internally i.e no need to write code
    function getTokens() public payable {
        //  100 wei = 1 token
        transferFrom(Owner, msg.sender, msg.value / 100);
    }

    // sender sells tokens to owner i.e contract balance for owner will increase and ethers balance for owner will decrease
    // increase/decrease in ether balance is handled internally i.e no need to write code
    function getEthers(uint _value) public returns (uint b) {// parameter is tokens
        // 100 wei = 1 token
        uint weis = _value * 100;
        transferFrom(msg.sender, Owner, _value);
        msg.sender.transfer(weis);
    }

    function add(uint a, uint b) payable returns (uint c) {
        c = a + b;
        require(c >= a);
        return c;
    }

    function sub(uint a, uint b) payable returns (uint c) {
        require(b <= a);
        return c = a - b;
    }
}