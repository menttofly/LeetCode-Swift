//
//  sort_colors.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/sort-colors/
 * Primary idea: 将 0 交换到头部，2交换到尾部，那么 [0..left) 都是 red， (right..end] 都是 blue.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SortColors {
    func sortColors(_ nums: inout [Int]) {
        /// [left..right] 代表中间未正确排序部分，也就是包含 0 和 2 且并未交换到头尾的部分
        var left = 0, right = nums.count - 1, mid = 0
        while mid <= right {
            if nums[mid] == 0 {
                /// 交换 1 到头部，并更新 left 排除左侧已排序部分，缩小中间区间
                nums.swapAt(left, mid)
                left += 1
                mid += 1
            } else if nums[mid] == 2 {
                /// 交换 2 到尾部，并更新 right 排除右侧已排序部分，缩小中间区间
                nums.swapAt(right, mid)
                right -= 1
            } else {
                /// 1 在中间部分位置正确，不需要交换
                mid += 1
            }
        }
    }
    
    /// 两次遍历，桶排序
    private func sortColorsBucketSort(_ nums: inout [Int]) {
        var bucket = Array(repeating: 0, count: 3)
        for num in nums {
            bucket[num] += 1
        }
        
        var index = 0
        for (i, count) in bucket.enumerated() {
            for _ in 0..<count {
                nums[index] = i
                index += 1
            }
        }
    }
}
