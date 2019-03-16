//
//  ThreeSumClosest.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/23.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/3sum-closest/
 * Primary idea: Firstly sort the array, then iterate it with two pointers.
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */
class ThreeSumClosest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        /// Let it has an initial value, any solution can do.
        var closest = nums[0] + nums[1] + nums[2], nums = nums.sorted()
        for (index, num) in nums.enumerated() {
            /// Skip the duplicates of target num.
            if index > 0 && nums[index] == nums[index - 1] {
                continue
            }
            var front = index + 1, back = nums.count - 1
            /// Because the array is sorted, so scan it with two pointer.
            /// Similar to the idea of binary search.
            while front < back {
                let sum = num + nums[front] + nums[back]
                if sum <= target {
                    front += 1
                } else {
                    back -= 1
                }
                if abs(sum - target) < abs(closest - target) {
                    closest = sum
                }
            }
        }
        return closest
    }
}
