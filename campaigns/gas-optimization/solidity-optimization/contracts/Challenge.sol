// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Challenge {

    uint256 immutable _SKIP;

    constructor(uint256 skip) {
        _SKIP = skip;
    }

    /**
     * @notice Returns the sum of the elements of the given array, skipping any SKIP value.
     * @param array The array to sum.
     * @return sum The sum of all the elements of the array excluding SKIP.
     */
    function sumAllExceptSkip(
        uint256[] calldata array
    ) public view returns (uint256 sum) {
        uint256 arrayLength = array.length;
        for (uint256 i; i < arrayLength;) {
            uint256 cacheElement = array[i];
            if (cacheElement != _SKIP) {
                sum += cacheElement;
            }

            unchecked {
                ++i;
            }
        }

        return sum;
    }

}
