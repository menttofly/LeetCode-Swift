//
//  shortest_unsorted_continuous_subarray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/shortest-unsorted-continuous-subarray/ (581)
 * Primary idea: 将数组进行排序后，和原数组逐一比较确定最左边和最右边不匹配的元素，相减即得到最短的未排序数组
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class ShortestUnsortedContinuousSubarray {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
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
