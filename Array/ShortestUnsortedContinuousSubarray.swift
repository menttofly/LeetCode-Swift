//
//  ShortestUnsortedContinuousSubarray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
 * Primary idea: Sort and compare one by one.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class ShortestUnsortedContinuousSubarray {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var sorted = nums.sorted()
        var start = nums.count, end = 0
        for i in 0..<nums.count {
            if nums[i] != sorted[i] {
                start = min(start, i)
                end = max(end, i)
            }
        }
        return end - start > 0 ? end - start + 1 : 0
    }
}
