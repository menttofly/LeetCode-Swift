//
//  MaximalSquare.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximal-square/
 * Primary idea: DP(i,j) represent the length of max square that reach at bottom right corner (i,j).
 *
 * State Transition Equation: DP(i,j) = min{dp(i-1,j-1), min{dp(i-1,j), dp(i,j-1)}}
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class MaximalSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty {
            return 0
        }
        var result = 0
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if i == 0 || j == 0 {
                    /// At first row or first colume.
                    dp[i][j] = matrix[i][j] == "1" ? 1 : 0
                } else if matrix[i][j] == "1" {
                    /// If position at (i,j) is "1", then it possible for us to make a square.
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1])) + 1
                }
                result = max(result, dp[i][j])
            }
        }
        return result * result
    }
}
