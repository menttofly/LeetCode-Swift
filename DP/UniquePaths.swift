//
//  UniquePaths.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/unique-paths/
 * Primary idea: DP(i,j) represent the number of paths to arrive at point (i,j), and robot can only move either down or right.
 *
 * State Transition Equation: DP(i,j) = DP(i-1,j) + DP(i,j-1)
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
}
