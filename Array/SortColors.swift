//
//  SortColors.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/sort-colors/
 * Primary idea: Swap 0 to front and 2 to back, then (0...left) is sorted, and (right..<end) is sorted.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SortColors {
    func sortColors(_ nums: inout [Int]) {
        var left = 0, right = nums.count - 1, index = 0
        while index <= right {
            if nums[index] == 0 {
                nums.swapAt(left, index)
                left += 1
                /// Left part must be ordered, so we increase index.
                index += 1
            } else if nums[index] == 2 {
                nums.swapAt(right, index)
                right -= 1
                /// After swapping 0 maybe at current index, and it can smaller the left sorted part.
                /// eg. [0, 1(left), 1, 0(index), 0, 2]
            } else {
                /// Do nothing if we meet white color.
                index += 1
            }
        }
    }
    
    /// Bucket sort by two pass solution.
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
