//
//  add_two_numbers.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/29.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

/**
 * Question Link: https://leetcode.com/problems/add-two-numbers/ (2)
 * Primary idea: 使用 sum 变量记录记录和，然后使用余数作为新链表当前和，同时在下一次计算中处理进位
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class AddTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        let list: ListNode? = ListNode(0);   /// As the head node
        var p1 = l1, p2 = l2, pcur = list
        var sum = 0
        
        while p1 != nil || p2 != nil {
            sum /= 10;   /// 加上之前的进位
            sum += p1?.val ?? 0
            sum += p2?.val ?? 0
            
            pcur?.next = ListNode(sum % 10)
            pcur = pcur?.next
            p1 = p1?.next
            p2 = p2?.next
        }
        /// 处理进位
        if sum / 10 > 0 {
            pcur?.next = ListNode(sum / 10)
        }
        
        return list?.next
    }
}
