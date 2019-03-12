//
//  PartitionEqualSubsetSum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/partition-equal-subset-sum/
 * Primary idea: DP(i) represent whether the sum of part elements in array can equal to i.
 *
 * State Transition Equation: DP(i) = DP(i) || DP(i-num)
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class PartitionEqualSubsetSum {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)   /// Get array sum.
        if sum % 2 == 1 {
            return false
        }
        /// Turn this question to check whether the sum of part elements in array can equal to target.
        let target = sum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            var i = target
            while i >= num {
                dp[i] = dp[i] || dp[i - num]
                i -= 1
            }
        }
        return dp[target]
    }
}
