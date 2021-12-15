//
//  two_sum_ii_input_array_is_sorted.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/18.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/ (167)
 * Primary idea: 数组有序，使用双指针逼近 target
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */

class TwoSumII {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0, right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum == target {
                return [left + 1, right + 1]
            } else if (sum < target) {
                left += 1
            } else if (sum > target) {
                right -= 1
            }
        }
        
        return [-1, -1]
    }
}
