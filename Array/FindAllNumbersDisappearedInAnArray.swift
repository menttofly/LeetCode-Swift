//
//  FindAllNumbersDisappearedInAnArray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
 * Primary idea: If num in array, make array's value at index(num - 1) to -1, means it appear in array.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class FindAllNumbersDisappearedInAnArray {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums, result = [Int]()
        for num in nums {
            /// Make it's value on -1(or other) at position (num - 1) to take position, which means it appeared.
            nums[num - 1] = -1
        }
        for i in 0..<nums.count {
            if nums[i] != -1 {
                result.append(i + 1)
            }
        }
        return result
    }
}
