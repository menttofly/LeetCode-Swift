//
//  regular_expression_matching.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/regular-expression-matching/
 * Primary idea: A classic Two-Dimensional Dynamic Programming
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class RegularExpressionMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count, n = p.count
        if n == 0 {
            return m == 0
        }
        var chs = [Character](s), chp = [Character](p)
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        for i in 0...m {
            for j in 1...n {
                if chp[j - 1] == "*" {
                    /// None macth, a* count zero time
                    let none = dp[i][j - 2]
                    /// One or more macth, a* count at least one time
                    let onemore = (i > 0 && (chs[i - 1] == chp[j - 2] || chp[j - 2] == ".") && dp[i - 1][j])
                    dp[i][j] = none || onemore
                } else {
                    /// With no wildcard "*", only if characters on tail matche can transfer state to dp[i - 1][j - 1]
                    dp[i][j] = i > 0 && (chs[i - 1] == chp[j - 1] || chp[j - 1] == ".") && dp[i - 1][j - 1]
                }
            }
        }
        return dp[m][n]
    }
}





















