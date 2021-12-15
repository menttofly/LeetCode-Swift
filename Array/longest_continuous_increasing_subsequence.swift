//
//  longest_continuous_increasing_subsequence.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/5.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/longest-continuous-increasing-subsequence/ (674)
 * Primary idea: 遍历数组，用 start 记录 CIS 的起始索引，如果 CIS 条件被破坏，则更新 start 为当前索引
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LongestContinuousIncreasingSubsequence {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        /// start 记录 CIS 的起始索引
        var res = 0, start = 0
        for i in 0..<nums.count {
            /// 不符合 CIS 条件时更新 start
            if i > 0, nums[i - 1] >= nums[i] {
                start = i
            }
            res = max(res, i - start + 1)
        }
        
        return res
    }
}

































