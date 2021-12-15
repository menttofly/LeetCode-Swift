//
//  search_in_rotated_sorted_array.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/search-in-rotated-sorted-array/ (33)
 * Primary idea: 旋转数组在 pivot 两侧都是有序递增的，使用二分查找定位 target
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
            /// [left..mid] 单调递增，pivot 代表的旋转点 在 mid 右侧部分
            if nums[left] <= nums[mid] {
                /// 用 >= 确保 target 在 left part，否则 target = nums[left] 执行 else 分支错误丢弃 left part
                /// 而此时正确的行为是丢弃 right part
                if target >= nums[left] && target < nums[mid] {
                    /// 如果 target 在 [left..mid] 这个单调增区间内，则丢弃 mid 的 right part
                    right = mid - 1
                } else {
                    /// 否则丢弃 mid 的 left part
                    left = mid + 1
                }
            } else {
                /// mid 在旋转的部分，即 (mid..] 单调递增，pivot 旋转点在 mid 左侧部分
                /// 用 <= 确保 target 在 right part，否则 target = nums[right] 执行 else 分支错误丢弃 left part
                /// 而此时正确的行为是丢弃 left part
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
