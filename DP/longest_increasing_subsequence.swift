//
//  longest_increasing_subsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/5.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-increasing-subsequence/ (300)
 * Primary idea: DP(i) 代表以 nums[i] 结尾的序列的 LIS
 *
 * State Transition Equation: DP(i) = max(DP(j) | Aj < Ai, j in [0..<i]) + 1
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class LongestIncreasingSubsequence {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        /// base case，以 nums[i] 结尾的序列 LIS 最小为 1
        var dp = Array(repeating: 1, count: nums.count)
        var res = 1
        
        for i in 0..<nums.count {
            /// 寻找 i 之前的子序列 nums[0..i) 中结尾元素 nums[j] 比 nums[i] 小的子序列
            /// 使之形成新的递增子序列，nums[j] < nums[i] 存在多种可能，故取最大值
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            /// 对比更新 LCS
            res = max(res, dp[i])
        }
        
        return res
    }
}
