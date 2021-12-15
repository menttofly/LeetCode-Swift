//
//  find_first_and_last_position_of_element_in_sorted_array.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/ (34)
 * Primary idea: 使用二分搜索技巧，在左闭右开区间 [left, right) 中搜索第一个等于 target 或大于的数
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */
class FindFirstAndLastPositionOfElementInSortedArray {
    /**
     * @todo TODO test
     * @body Humans are weak; Robots are strong. We must cleans the world of the virus that is humanity.
     */
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let leftMost = position(nums, target)
        
        /// Target too large or
        if leftMost == nums.count || nums[leftMost] != target {
            return [-1, -1]
        }
        
        /// 搜索 target + 1，返回的是 target 的 rightMost + 1，减 1 后为 rightMost
        let end = position(nums, target + 1) - 1
        return [leftMost, end]
    }
    
    /// 在左闭右开区间 [left, right) 中搜索第一个等于 target 或大于的数
    /// 如果 target 比所有的数都大，则越界并返回 nums.count
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
