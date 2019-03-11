//
//  PalindromeLinkedList.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/palindrome-linked-list/
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
        var slow = head, fast = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        if fast != nil {
            slow = slow?.next
        }
        slow = reverser.reverseList(slow)
        var begin = head
        while slow != nil {
            if begin!.val != slow!.val {
                return false
            }
            slow = slow?.next
            begin = begin?.next
        }
        return true
    }
}
