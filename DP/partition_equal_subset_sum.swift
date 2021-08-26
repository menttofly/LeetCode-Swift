//
//  partition_equal_subset_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

class PartitionEqualSubsetSum {
    /**
     * Question Link: https://leetcode.com/problems/partition-equal-subset-sum/
     * Primary idea: DP[i][w] 表示对于 i 个物品，当背包容量为 w 时，是否可以恰好装满（等于目标和）
     *
     * Time Complexity: O(n^2), Space Complexity: O(n^2)
     */
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        /// 和为奇数时，不可能划分为两个相等的集合
        guard sum % 2 == 0 else {
            return false
        }
        
        let target = sum / 2, len = nums.count
        var dp = Array(repeating: Array(repeating: false, count: target + 1), count: len + 1)
        /// base case，背包空间为 0，相当于装满
        for i in 0...len {
            dp[i][0] = true
        }
        
        for i in 1...len {
            for w in 1...target {
                if w < nums[i - 1] {
                    /// 背包空间不足，只能选择不放入背包
                    dp[i][w] = dp[i - 1][w]
                } else {
                    /// 选择放入或者不放入背包都可以
                    dp[i][w] = dp[i - 1][w - nums[i - 1]] ||  dp[i - 1][w]
                }
            }
        }
        
        return dp[len][target]
    }
    
    /**
     * Question Link: https://leetcode.com/problems/partition-equal-subset-sum/
     * Primary idea: DP(i) represent whether the sum of part elements in array can equal to i.
     *
     * State Transition Equation: DP(i) = DP(i) || DP(i-num)
     *
     * Time Complexity: O(n^2), Space Complexity: O(n)
     */
    func canPartition1(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)   /// Get array sum.
        if sum % 2 == 1 {
            return false
        }
        /// Turn this question to check whether the sum of part elements in array can equal to target.
        /// 状态压缩版，从二维数组矩阵的形状理解，dp[i][w] 需要的状态都是上一行 dp[i-1][..] 得到的，再之前的都不会再使用到
        /// 所以只需要一个一维数组记录矩阵中 i-1 这一行的数据即可
        let target = sum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            var w = target
            /// 从后往前遍历，避免上一行的结果在本次循环中被冲掉，可以保证上一行结果只被用一次
            while w >= num {
                dp[w] = dp[w] || dp[w - num]
                w -= 1
            }
        }
        return dp[target]
    }
}
