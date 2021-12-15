//
//  find_the_duplicate_number.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-the-duplicate-number/ (287)
 * Primary idea: 受到 List Cycle II 启发, 重复元素的位置必定是环的入口.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class FindTheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return -1
        }
        
        /// 类似链表，把 index 视为当前节点，nums[index] 为下一个节点
        var slow = nums[0], fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        
        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}
