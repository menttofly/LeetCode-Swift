//
//  LongestIncreasingSubsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/5.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-increasing-subsequence/
 * Primary idea: DP(i) represent LIS end with item at index i
 *
 * State Transition Equation: DP(i) = max(DP(j) | Ai > Aj, j in [0..<i]) + 1
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class LongestIncreasingSubsequence {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 1, count: nums.count)
        var result = 1
        for i in 0..<nums.count {
            var max = 0   /// Record the max DP[j] of the interval [0..<i]
            for j in 0..<i {
                if nums[i] > nums[j], dp[j] > max {
                    max = dp[j]
                }
            }
            dp[i] = max + 1
            if dp[i] > result {
                result = dp[i]
            }
        }
        return result
    }
}
