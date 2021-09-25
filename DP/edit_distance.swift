//
//  edit_distance.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/25.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/edit-distance/
 * Primary idea: dp[i][j] 代表将 word1[0..i) 转为 word2[0..j) 的最少操作次数
 *
 * Note: https://leetcode.com/problems/edit-distance/discuss/25846/C%2B%2B-O(n)-space-DP
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class MinDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = [Character](word1), word2 = [Character](word2)
        let len1 = word1.count, len2 = word2.count
        
        /// base case，word1 为空插入 len2 次，word2 为空删除 len1 次
        if len1 == 0 {
            return len2
        } else if (len2 == 0) {
            return len1
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)
        
        /// base case，i 从 1 开始，因为 word[0..0) 为空字符串
        /// string 和空字符串互转，操作次数为 string 长度
        for i in 1...len1 {
            dp[i][0] = i
        }
        
        for j in 1...len2 {
            dp[0][j] = j
        }
        
        for i in 1...len1 {
            for j in 1...len2 {
                if word1[i - 1] == word2[j - 1] {
                    /// 如果 word1[i-1] = word2[j-1]，直接由 dp[i-1][j-1] 推导出来，不需要转换操作
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    /// 用 word2[j-1] 替换 word1[i-1]（dp[i-1][j-1] + 1）
                    /// 若 word1[0..i-1) = word2[0..j)，删除 word1[i-1]（dp[i - 1][j] + 1）
                    /// 若 word2[0..j-1) = word1[0..i)，插入 word2[j-1] 到 word1[0..i) 中（dp[i][j - 1] + 1）
                    /// 取三者的最小值，即为 dp[i][j] 最少的操作次数
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
                }
            }
        }
        
        return dp[len1][len2]
    }
}
