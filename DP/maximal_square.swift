//
//  maximal_square.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximal-square/ (221)
 * Primary idea: DP(i,j) 代表以 matrix[i][j] 为右下角能形成的 square 最大边长
 *
 * State Transition Equation: DP(i,j) = min{dp(i-1,j-1), dp(i-1,j), dp(i,j-1)}
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class MaximalSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty {
            return 0
        }
        
        /// 记录所有能形成正方形的最大边长
        var size = 0
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if i == 0 || j == 0 {
                    /// 在第一行或者第一列，matrix[i][j] = 1 时最大正方形为自身，否则为 0
                    dp[i][j] = matrix[i][j] == "1" ? 1 : 0
                } else if matrix[i][j] == "1" {
                    /// 与其相邻的三个元素 [i-1][j-1]、[i-1][j]、[i][j-1] 形成的三个重叠 square 的最短边
                    /// 因为要以 matrix[i][j] 形成矩形充要条件，就是重重正方形部分，每条边都是 '1' 组成的
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
                }
                
                size = max(size, dp[i][j])
            }
        }
        
        return size * size
    }
}
