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
        assembly {
            copy := mload(0x40)
            mstore(0x40, add(copy, and(add(add(mload(array), 0x20), 0x1f), not(0x1f))))
            // store length in memory
            mstore(copy, mload(array))
            let max := add(mload(array), 32)

            for {let n := 32} lt(n, max) {n := add(n, 32)} {
                mstore(add(copy, n), mload(add(array, n)))
            }
        }
    }
}
