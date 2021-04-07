//
//  find_the_duplicate_number.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-the-duplicate-number/
 * Primary idea: Inspired by Linked List Cycle II, the duplicate number's position must is the cycle's entry.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class FindTheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return -1
        }
        var slow = nums[0], fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        fast = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}
