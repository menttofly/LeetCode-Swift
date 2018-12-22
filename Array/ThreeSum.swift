//
//  ThreeSum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/22.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/3sum/
 * Primary idea: Firstly sort the array, then scan the right part of 'index' with two pointers.
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]](), nums = nums.sorted()
        for (index, num) in nums.enumerated() {
            /// Skip the duplicates of target num.
            if index > 0 && nums[index] == nums[index - 1] {
                continue
            }
            let target = -num
            var front = index + 1, back = nums.count - 1
            /// Because the array is sorted, so scan it with two pointer.
            /// Similar to the idea of binary search.
            while front < back {
                let sum = nums[front] + nums[back]
                if sum < target {
                    front += 1
                } else if sum > target {
                    back -= 1
                } else {
                    let result = [num, nums[front], nums[back]]
                    results.append(result)
                    /// Moving the front pointer to the next different number forwards.
                    while front < back && nums[front] == result[1] {
                        front += 1
                    }
                    /// Moving the back pointer to the next different number backwards.
                    while front < back && nums[back] == result[2] {
                        back -= 1
                    }
                }
            }
        }
        return results
    }
}
