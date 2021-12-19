//
//  wildcard_matching.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/3.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/wildcard-matching/ (44)
 * Primary idea: A classic Two-Dimensional Dynamic Programming
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class WildcardMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let ss = Array(s), sp = Array(p)
        let m = ss.count, n = sp.count
        if n == 0 {
            return m == 0
        }
        if n == 1 && sp[0] == "*" {  /// '*' Matches any sequence of characters (including the empty sequence).
            return true
        }
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        for i in 0...m {
            for j in 1...n {
                if sp[j - 1] == "*" {
                    let zero = dp[i][j - 1]   /// '*' Matches empty sequence
                    let onemore = i > 0 && dp[i - 1][j]   /// '*' Matches at least once
                    dp[i][j] = zero || onemore
                } else {
                    dp[i][j] = i > 0 && (ss[i - 1] == sp[j - 1] || sp[j - 1] == "?") && dp[i - 1][j - 1]
                }
            }
        }
        return dp[m][n]
    }
}
