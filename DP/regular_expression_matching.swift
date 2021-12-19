//
//  regular_expression_matching.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/regular-expression-matching/ (10)
 * Primary idea: 如果 s[0..i) 和 p[0..j) 匹配，则 DP[i][j] = true 否则 false
 *
 * Note: https://leetcode.com/problems/regular-expression-matching/discuss/5684/C%2B%2B-O(n)-space-DP
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class RegularExpressionMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count, n = p.count
        if n == 0 {
            return m == 0
        }
        let s = [Character](s), p = [Character](p)
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        for i in 0...m {
            for j in 1...n {
                if p[j - 1] == "*" {
                    /// None macth, a* count zero time
                    let none = dp[i][j - 2]
                    /// One or more macth, a* count at least one time
                    /// 为什么dp[i - 1][j] 中 j 不动？因为 '*' 前面都字符 p[j - 2] 可以匹配一次或多次
                    let onemore = (i > 0 && (s[i - 1] == p[j - 2] || p[j - 2] == ".") && dp[i - 1][j])
                    dp[i][j] = none || onemore
                } else {
                    /// With no wildcard "*", only if characters on tail matche can transfer state to dp[i - 1][j - 1]
                    dp[i][j] = i > 0 && (s[i - 1] == p[j - 1] || p[j - 1] == ".") && dp[i - 1][j - 1]
                }
            }
        }
        return dp[m][n]
    }
}





















