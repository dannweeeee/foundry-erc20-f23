//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    // to implement ERC20, we just need to folow the EIP/ERC token standard

    mapping(address => uint256) private s_balances; // to map people addresses to their balances

    // function name() public pure returns (string memory) {
    //     return "Manual Token";
    // }

    // OR

    string public name = "Manual Token";

    function totalSupply() public pure returns (uint256) {
        return 100 ether; // 100000000000000000000
    }

    function decimals() public pure returns (uint8) {
        return 18; // 100 ether has 18 decimals
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
