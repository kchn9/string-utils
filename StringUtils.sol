// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// it don't have own storage, it don't inherit etc.
library StringUtil {
    function concat(string memory string1, string memory string2) internal pure returns(string memory) {
        return string(abi.encodePacked(string1, string2));
    }

    function compare(string memory string1, string memory string2) internal pure returns(bool) {
        return keccak256(bytes(string1)) == keccak256(bytes(string2));
    }

    // works only for 1-byte UTF representations 
    function length(string memory str) internal pure returns(uint) {
        return bytes(str).length;
    }
}

contract Test {
    string public value1;
    bool public value2;
    uint256 public value3;

    // allows to use to use fucntions of StringUtil library as string 'methods'
    using StringUtil for string;

    function testConcat(string memory str1, string memory str2) public {
        value1 = str1.concat(str2);
    }

    function testCompare(string memory str1, string memory str2) public {
        value2 = str1.compare(str2);
    }

    function testLength(string memory str) public {
        value3 = str.length();
    }
}
