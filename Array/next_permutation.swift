//
//  next_permutation.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/next-permutation/
 * Primary idea: Find the first decreasing number from low to high in sequence, then swap it with the minimum that large than
 * this number of right part. At last，reverse the sequence on decreasing number's right part.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2, j = nums.count - 1
        while i >= 0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        if i >= 0 {
            while nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        nums[i+1..<nums.count].reverse()
    }
}
