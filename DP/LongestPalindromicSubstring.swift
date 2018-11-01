//
//  LongestPalindromicSubstring.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-palindromic-substring/
 * Primary idea: Define DP[i][j] to record whether a substring is palindromic or not by Dynamic Programming
 *
 * Note: State transition equation - DP(i,j) = (DP(i+1,j−1) and Si==Sj)
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        let count = s.count
        if s.isEmpty || count == 1 {
            return s
        }
        var dp = Array(repeating: Array(repeating: false, count: count), count: count)
        let chars = [Character](s)
        for i in 0..<count {
            for j in 0..<count {
                if i >= j {   /// A string has only one character, or empty is palindromic
                    dp[i][j] = true
                }
            }
        }
        var start = 0, end = 0, max = 1
        for len in 1..<count {
            for i in 0..<count - len {
                let j = i + len
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i + 1][j - 1]   /// Transfer state to previous one
                    if dp[i][j] && len + 1 > max {
                        max = len + 1
                        start = i
                        end = j
                    }
                }
            }
        }
        return String(chars[start...end])
    }
}
