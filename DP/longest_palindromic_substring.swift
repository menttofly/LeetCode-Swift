//
//  longest_palindromic_substring.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-palindromic-substring/
 * Primary idea: DP[i][j] 代表 s[i..j] 是否构成回文字符串
 *
 * State Transition Equation: DP(i,j) = (DP(i+1,j−1) and Si == Sj)
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        let count = s.count
        if s.isEmpty || count == 1 { return s }
        
        var dp = Array(repeating: Array(repeating: false, count: count), count: count)
        let s = [Character](s)
        
        for i in 0..<count {
            for j in 0..<count {
                if i >= j {
                    /// 空串、单个字符就是回文字符串
                    dp[i][j] = true
                }
            }
        }
        
        var start = 0, end = 0, max = 1
        for len in 1..<count {
            for i in 0..<count - len {
                let j = i + len
                if s[i] == s[j] {
                    /// 如果首尾字符相同，则 s[i..j] 是否回文取决于 s[i+1..j-1]
                    dp[i][j] = dp[i + 1][j - 1]
                    if dp[i][j] && len + 1 > max {
                        max = len + 1
                        start = i
                        end = j
                    }
                }
            }
        }
        
        return String(s[start...end])
    }
}
