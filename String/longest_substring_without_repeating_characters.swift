//
//  longest_substring_without_repeating_characters.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/17.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/ (3)
 * Primary idea: Store (char, index) to a dictionary while traversing the array, update the sliding window and the current maximum value
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let s = [Character](s)
        var hash = [Character: Int]()
        var start = -1, res = 1   /// res 至少为 1，代表单字符

        for (i, char) in s.enumerated() {
            if let index = hash[char], index > start {
                start = index
            }
            /// 记录当前字符的索引
            hash[char] = i
            res = max(res, i - start)
        }
        
        return res
    }
}
