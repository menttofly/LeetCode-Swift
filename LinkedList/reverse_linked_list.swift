//
//  reverse_linked_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/13.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list/
 * Primary idea: While traversing the linked list, use three pointers to store current and previous and next node.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var current = head, rear = head
        while current != nil {
            rear = rear?.next
            current?.next = pre
            pre = current
            current = rear
        }
        return pre
    }
    
    /// 使用递归的方式
    func reverseListRecusive(_ head: ListNode?) -> ListNode? {
            guard let _ = head?.next else {
                return head
            }
            
            let rhead = reverseListRecusive(head?.next)
            head?.next?.next = head
            head?.next = nil
            
            return rhead
        }
}
