//
//  ClimbingStairs.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/6.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/climbing-stairs/
 * Primary idea: DP(n) represent the number of ways to jump on n steps
 *
 * State Transition Equation: DP(n) = DP(n-1) + DP(n-2), n > 1
 *
 * Note: If change the question to find minimum times to jump on n steps, it become to "Coin Change"
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ClimbingStairs {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var dp = Array(repeating: 1, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}























