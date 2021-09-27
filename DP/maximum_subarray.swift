//
//  MaximumSubarray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/4.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-subarray/
 * Primary idea: dp[i] 以 nums[i] 结尾的最大连续子数组和
 *
 * State Transition Equation: dp[i] = max(nums[i], num[i] + dp[i-1])
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MaximumSubarray {
    /// 状态压缩版
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0, max = Int.min
        
        for num in nums {
            sum += num
            if sum > max {
                max = sum
            }
            if sum < 0 {
                sum = 0
            }
        }
        
        return max
    }
}
