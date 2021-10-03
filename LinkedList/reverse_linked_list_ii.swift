//
//  reverse_linked_list_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/8.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list-ii/
 * Primary idea: 先实现反转前 n 个节点，然后确定问题 base case，即 left = 1 时就是 reverseFront
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class ReverseLinkedListII {
    /// 后继节点
    var successor: ListNode?
    
    /// 反转链表的left到right之间的节点，并返回翻转后的头节点
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseFront(head, right)
        }
        /// 从 head?.next 开始翻转，返回翻转后头节点，拼接到当前 head 之后
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    
    /// 反转链表的前 n 个节点，并返回翻转后的头节点
    func reverseFront(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            /// 记录第 n + 1 个节点
            successor = head?.next
            return head
        }
        
        let rhead = reverseFront(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor
        
        return rhead
    }
}
