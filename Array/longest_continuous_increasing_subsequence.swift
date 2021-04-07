//
//  longest_continuous_increasing_subsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/5.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-continuous-increasing-subsequence/
 * Primary idea: Traverse the array until an element breaks the condition 'continuous-increasing-subsequence', then update anchor point
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LongestContinuousIncreasingSubsequence {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var max = 0, start = 0
        for i in 0..<nums.count {
            if i > 0, nums[i - 1] >= nums[i] {
                start = i
            }
            if i - start + 1 > max {
                max = i - start + 1
            }
        }
        return max
    }
}

































