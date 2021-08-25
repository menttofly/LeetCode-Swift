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
 * Primary idea: https://leetcode.com/problems/edit-distance/discuss/25846/C%2B%2B-O(n)-space-DP
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class MinDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = [Character](word1), word2 = [Character](word2)
        if word1.count == 0 {
            return word2.count
        } else if (word2.count == 0) {
            return word1.count
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        
        /// base case
        /// i 从 1 开始，因为 word[0...0) 没有意义
        for i in 1...word1.count {
            dp[i][0] = i
        }
        
        for j in 1...word2.count {
            dp[0][j] = j
        }
        
        for i in 1...word1.count {
            for j in 1...word2.count {
                if word1[i - 1] == word2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
                }
            }
        }
        
        return dp[word1.count][word2.count]
    }
}
