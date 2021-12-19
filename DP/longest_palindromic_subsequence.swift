//
//  longest_palindromic_subsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/26.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-palindromic-subsequence/ (516)
 * Primary idea: DP[i][j] 代表 s[i..j] 的最长回文子序列（不连续）
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class LPS {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s = [Character](s)
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        /// i 逆向遍历(从大到小)，保证需要的相邻 state 都已经计算出来
        ///     dp[i][j - 1] ->  dp[i][j]
        ///                  ↗️     ⬆️
        /// dp[i + 1][j - 1]     dp[i + 1][j]
        for i in (0..<s.count).reversed() {
            /// base case，长度为 1 的字符串的最长回文子序列为 1
            dp[i][i] = 1
            /// i > j 没有意义，所以 j 从 i + 1 开始遍历
            for j in i+1..<s.count {
                if s[i] == s[j] {
                    /// s[i..j] 的最长回文子序列 = s[i-1..j-1] 最长回文子序列 + 2（s[i] 和 s[j] 两个字符）
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    /// s[i] 和 s[j] 不能同时出现在 s[i..j] 最长回文子序列中
                    /// s[j] 不在 s[i..j] 最长回文子序列中
                    /// s[i] 不在 s[i..j] 最长回文子序列中
                    dp[i][j] = max(dp[i][j - 1], dp[i + 1][j])
                }
            }
        }
        
        return dp[0][s.count - 1]
    }
}
