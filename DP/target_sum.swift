//
//  target_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/target-sum/ (494)
 * Primary idea: DP(S) means how many ways to assign symbols to make sum of integers equal to target S
 *
 * Note: https://leetcode.com/problems/target-sum/discuss/455024/DP-IS-EASY!-5-Steps-to-Think-Through-DP-Questions.
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class TargetSum {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var dp = Array(repeating: [Int: Int](), count: nums.count + 1)
        dp[0][0] = 1
        for i in 0..<nums.count {
            for (sum, cnt) in dp[i] {
                /// Plus number to new sum.
                let valplus = dp[i + 1][sum + nums[i]]
                dp[i + 1][sum + nums[i]] = (valplus != nil ? valplus! + cnt : cnt)
                
                /// Minus number to new sum.
                let valminus = dp[i + 1][sum - nums[i]]
                dp[i + 1][sum - nums[i]] = (valminus != nil ? valminus! + cnt : cnt)
            }
        }
        return dp[nums.count][S] ?? 0
    }
    
    func findTargetSumWaysEX(_ nums: [Int], _ S: Int) -> Int {
        var dp = [Int: Int]()
        dp[0] = 1
        for num in nums {
            var map = [Int: Int]()
            for (sum, cnt) in dp {
                var count = map[sum + num] ?? 0
                map[sum + num] = count + cnt
                
                count = map[sum - num] ?? 0
                map[sum - num] = count + cnt
            }
            dp = map
        }
        return dp[S] ?? 0
    }
    
    /**
     * Question Link: https://leetcode.com/problems/target-sum/
     * Primary idea: DP[N][S] 表示从前 N 个元素中选择，若凑成背包重量为 S 则最多有 DP[N][S] 种可能
     *
     * Time Complexity: O(n^2), Space Complexity: O(n)
     */
    func findTargetSumWaysBackpack(_ nums: [Int], _ S: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: S + 1), count: nums.count + 1)
        /// base case，当背包重量为 0 时，选择都不装就是唯一的解法
        for i in 0...nums.count {
            dp[i][0] = 1
        }
        
        /// i 代表第 i 个物品，即 nums[i - 1]
        for i in 1...nums.count {
            for j in 0...S {
                if j >= nums[i - 1] {
                    /// 两种选择，不放入背包和放入背包，nums[i - 1] 为第 i 个物品
                    dp[i][j] = dp[i - 1][j] + dp[i - 1][j - nums[i - 1]]
                } else {
                    /// 背包空间不足，只能选择不装物品 i
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[nums.count][S]
    }
}
