//
//  remove_duplicates_from_sorted_array.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/22.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * Primary idea: 原地修改数组，使用快慢指针，在 nums[0..slow] 之间的就是不重复的元素
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var slow = 0, fast = 0
        while fast != nums.count {
            /// fast 和 slow 的值不一样时，更新 slow 指针，并将 nums[slow] 的值设定为 nums[fast]
            if nums[slow] != nums[fast] {
                /// 因为第一个元素必选，所以要先 slow + 1 再赋值
                slow += 1
                nums[slow] = nums[fast]
            }
            
            fast += 1
        }
        
        return slow + 1
    }
}
