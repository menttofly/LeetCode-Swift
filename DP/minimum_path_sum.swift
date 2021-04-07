//
//  minimum_path_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/minimum-path-sum/
 * Primary idea: DP(i,j) represent the minimum path sum of arriving at point (i,j).
 *
 * State Transition Equation: DP[i][j] = min(DP[i-1][j], DP[i][j-1]) + DP[i][j]
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class MinimumPathSum {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: grid[0][0], count: n), count: m)
    
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j > 0 {
                    /// This point is exactly on the horizontal line.
                    dp[0][j] = dp[0][j - 1] + grid[0][j]
                } else if j == 0 && i > 0 {
                    /// This point is exactly on the vertical line.
                    dp[i][0] = dp[i - 1][0] + grid[i][0]
                } else if i > 0 && j > 0 {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
}
