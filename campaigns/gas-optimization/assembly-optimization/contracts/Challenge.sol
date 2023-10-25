// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

abstract contract Challenge {

    /**
     * @notice Returns a copy of the given array in a gas efficient way.
     * @dev This contract will be called internally.
     * @param array The array to copy.
     * @return copy The copied array.
     */
    function copyArray(bytes memory array)
        internal
        pure
        returns (bytes memory copy)
    {
        copy = new bytes(array.length);
        uint256 max = array.length + 31;
        for (uint256 i=32; i<=max;) {
            assembly {
                mstore(add(copy, i), mload(add(array, i)))
            }

            unchecked {
                i+=32;
            }
        }
    }
}
