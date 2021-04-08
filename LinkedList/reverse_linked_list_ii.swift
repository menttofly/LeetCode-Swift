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
 * Primary idea: 先实现反转前n个节点，然后确定问题base case，即left = 1时就是reverseFront
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class ReverseLinkedListII {
    var successor: ListNode?
    
    /// 反转链表的前num个节点，并返回翻转后的头节点
    func reverseFront(_ head: ListNode?, _ num: Int) -> ListNode? {
        if num == 1 {
            successor = head?.next
            return head
        }
        
        let rhead = reverseFront(head?.next, num - 1)
        head?.next?.next = head ?? nil
        head?.next = successor ?? nil
        
        return rhead
    }
    
    /// 反转链表的left到right之间的节点，并返回翻转后的头节点
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseFront(head, right)
        }
        
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
}
