pragma solidity ^0.4.21;

contract Interface {

    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    function transfer(address _to, uint256 _value) public returns (bool); //

    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool); //

    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    function approve(address _spender, uint256 _value) public returns (bool); //

  //  function totalSupply() public constant returns (uint);

   // function balanceOf(address tokenOwner) public constant returns (uint balance); //

    //function allowance(address tokenOwner, address spender) public constant returns (uint remaining);

   // event Transfer(address indexed from, address indexed to, uint tokens);

  //  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}