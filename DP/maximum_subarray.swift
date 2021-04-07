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
 * Primary idea: sum[i] means num[x...i] which is the largest contiguous subsequence ending in i, then find the max sum[i]
 *
 * State Transition Equation: sum[i] = sum[i-1] + nums[i]
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MaximumSubarray {
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
