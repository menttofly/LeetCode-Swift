//
//  longest_common_subsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/25.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-common-subsequence/
 * Primary idea: 和 Edit Distance 这道题有点类似
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class LCS {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let s1 = [Character](text1), s2 = [Character](text2)
        let len1 = s1.count, len2 = s2.count
        
        /// dp[i][j] 代表 s1[0..i) 和 s2[0..j) 之间的 LCS 长度
        /// dp[len1][len2] 就表示 s1[0..len1) 和 s2[0..len2) 的 LCS 长度
        var dp = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)
        for i in 1...len1 {
            for j in 1...len2 {
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    /// s2[j-1] 或 s1[i-1] 至少有一个不在 LCS 中
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[len1][len2]
    }
}
