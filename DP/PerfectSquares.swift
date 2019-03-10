//
//  PerfectSquares.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/perfect-squares/
 * Primary idea: DP[i] represent the least number of perfect square numbers which sum to i.
 *
 * State Transition Equation: DP(i+j*j) = min{DP(i+j*j), DP(i) + 1, i in [0...n], i+j*j <=n }
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class PerfectSquares {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        for i in 0...n {
            var j = 1
            while i + j * j <= n {
                dp[i + j * j] = min(dp[i + j * j], dp[i] + 1)
                j += 1
            }
        }
        return dp[n]
    }
}
