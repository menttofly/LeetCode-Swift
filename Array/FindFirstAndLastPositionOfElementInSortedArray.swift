//
//  FindFirstAndLastPositionOfElementInSortedArray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 * Primary idea: Find the first number that is greater than or equal to target with binary searching.
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */
class FindFirstAndLastPositionOfElementInSortedArray {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let leftmost = position(nums, target)
        
        /// Target too large or
        if leftmost == nums.count || nums[leftmost] != target {
            return [-1, -1]
        }
        let start = leftmost
        let end = position(nums, target + 1) - 1
        return [start, end]
    }
    
    /// Find the first number that is greater than or equal to target.
    /// It will return nums.count if target larger than nums[nums.count-1].
    private func position(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count, mid = 0
        while left < right {
            mid = (left + right) / 2
            if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
