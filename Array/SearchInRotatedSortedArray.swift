//
//  SearchInRotatedSortedArray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/search-in-rotated-sorted-array/
 * Primary idea: Rotated array is ordered on both sides of the pivot, so through binary search to find target
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */
class SearchInRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, mid = 0
        while left <= right {
            mid = (left + right) / 2
            if target == nums[mid] {
                return mid
            }
            if nums[left] <= nums[mid] {
                /// Left part ascending array.
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                /// Right part ascending array.
                if target <= nums[right] && target > nums[mid] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}
