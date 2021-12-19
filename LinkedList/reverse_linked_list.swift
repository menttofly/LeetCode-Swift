//
//  reverse_linked_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/13.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list/ (206)
 * Primary idea: 遍历链表时使用三个指针，分别存储 current、previous、next
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = head
        
        while cur != nil {
            let rear = cur?.next
            cur?.next = pre
            pre = cur
            cur = rear
        }
        /// cur 指向 nil 时，前驱节点 pre 指向尾节点，即翻转后的头节点
        return pre
    }
    
    /// 反转以 head 为头节点的链表，返回翻转后的头节点
    /// - Parameter head: 头节点
    /// - Returns: 翻转后的头节点
    func reverseListRecusive(_ head: ListNode?) -> ListNode? {
        /// base case，空节点或单个节点
        guard let _ = head?.next else {
            return head
        }
            
        let rhead = reverseListRecusive(head?.next)
        head?.next?.next = head
        head?.next = nil
            
        return rhead
    }
}
