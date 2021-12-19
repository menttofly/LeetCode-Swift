//
//  palindrome_linked_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/palindrome-linked-list/ (234)
 * Primary idea: Reverse right half part of linked list, and compare from head one by one.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class PalindromeLinkedList {
    let reverser = ReverseLinkedList()
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        /// 使用快慢指针查找中心点
        var slow = head, fast = head
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        /// 从 slow 开始反转链表
        var reversed = reverser.reverseList(slow)
        /// 将前面和后面反转的部分进行比较
        var begin = head
        while reversed != nil {
            if begin!.val != reversed!.val {
                return false
            }
            reversed = reversed?.next
            begin = begin?.next
        }
        
        return true
    }
}

/// 通过后序遍历技巧，实现链表头指针和尾指针相互比较
class PalindromeLinkedList2 {
    var left: ListNode?
    func isPalindrome(_ head: ListNode?) -> Bool {
        left = head
        return traverse(head)
    }
    
    func traverse(_ right: ListNode?) -> Bool {
        guard let right = right else {
            return true
        }
        
        var res = traverse(right.next)
        res = res && (left!.val == right.val)
        
        if !res { return false }
        
        left = left?.next
        return res
    }
}
