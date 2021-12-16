//
//  climbing_stairs.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/6.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/climbing-stairs/ (70)
 * Primary idea: DP(n) 代表有 n 个台阶的楼梯，有多少中不同的跳跃方式到达楼顶
 *
 * State Transition Equation: DP(n) = DP(n-1) + DP(n-2), n > 1
 *
 * Note: If change the question to find minimum times to jump on n steps, it become to "Coin Change"
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ClimbingStairs {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        
        var dp = Array(repeating: 1, count: n + 1)
        /// base case
        dp[1] = 1
        
        for i in 2...n {
            /// 最后一次跳跃跳，分别跳 1 级合和 2 级
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        return dp[n]
    }
}























