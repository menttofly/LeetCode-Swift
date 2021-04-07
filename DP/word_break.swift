//
//  word_break.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/word-break/
 * Primary idea: DP(i) represent the substring in range [0..<i] whether can break.
 *
 * State Transition Equation: DP[i] true --> {DP[j] = true, s[j..<i] in wordDict}
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            var j = i - 1
            /// From back to front to speed up.
            while j >= 0 {
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                if dp[j] && wordDict.contains(String(s[start..<end])) {
                    dp[i] = true
                    break
                }
                j -= 1
            }
        }
        return dp[s.count]
    }
}
