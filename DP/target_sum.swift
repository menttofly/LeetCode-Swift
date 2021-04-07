//
//  target_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/target-sum/
 * Primary idea: DP(S) means how many ways to assign symbols to make sum of integers equal to target S
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
}
