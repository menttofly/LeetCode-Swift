//
//  AddTwoNumbers.swift
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
 * Question Link: https://leetcode.com/problems/add-two-numbers/
 * Primary idea: Keep track of the carry using a variable and simulate digits-by-digits sum starting from the head of list
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
        let list = ListNode(0);   /// As the head node
        var p1 = l1, p2 = l2, pcur = list
        var sum = 0
        
        while p1 != nil || p2 != nil {
            sum /= 10;
            sum += p1?.val ?? 0
            sum += p2?.val ?? 0
            
            pcur.next = ListNode(sum % 10)
            pcur = pcur.next!
            p1 = p1?.next ?? nil
            p2 = p2?.next ?? nil
        }
        if sum / 10 > 0 {   /// Processing carry
            pcur.next = ListNode(sum / 10)
        }
        return list.next
    }
}
