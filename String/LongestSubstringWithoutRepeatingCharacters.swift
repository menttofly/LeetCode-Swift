//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/17.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
 * Primary idea: Store (char, index) to a dictionary while traversing the array, update the sliding window and the current maximum value
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let characters = [Character](s)
        var hash = [Character: Int]()
        var start = -1, max = 1

        for (i, char) in characters.enumerated() {
            if let index = hash[char], index > start {
                start = index
            }
            hash[char] = i
            if i - start > max {
                max = i - start
            }
        }
        return max
    }
}
