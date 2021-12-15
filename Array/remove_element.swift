//
//  remove_element.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/23.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
* Question Link: https://leetcode.com/problems/remove-element/ (27)
* Primary idea: 使用快慢指针，当 fast 指向的元素不为 val，就赋值给 slow，否则跳过
*
* Time Complexity: O(n), Space Complexity: O(1)
*/
class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0, fast = 0
        while fast != nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            
            fast += 1
        }
        return slow
    }
    
    /// 单指针，遍历过程中的 i 就相当于 fast 指针，begin 相当于 slow 指针
    func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
        var begin = 0
        for (_, num) in nums.enumerated() {
            if num != val {
                nums[begin] = num
                begin += 1
            }
        }
        return begin
    }
}
