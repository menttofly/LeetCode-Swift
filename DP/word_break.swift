//
//  word_break.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/word-break/ (139)
 * Primary idea: DP(i) 代表 s[0..i) 字符串是否能被拆分为 wordDict 中的元素组成
 *
 * State Transition Equation: DP[i] true --> {DP[j] = true, s[j..<i] in wordDict}
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let s = [Character](s)
        var dp = Array(repeating: false, count: s.count + 1)
        /// base case，空字符串始终可以由 wordDict 组成，即都不选择
        dp[0] = true
        
        for i in 1...s.count {
            for j in stride(from: i - 1, through: 0, by: -1) {
                /// [0..j) 可以 break，并且 wordDict 包括 s[j..i) 子字符串
                if dp[j] && wordDict.contains(String(s[j..<i])) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }
}
