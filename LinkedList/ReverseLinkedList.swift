//
//  ReverseLinkedList.swift
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
 * Time Complexity: O(n)
 */
class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var reversed: ListNode?
        var previous: ListNode?
        var current = head
        while current != nil {
            let next = current?.next
            if next == nil {
                reversed = current
            }
            current?.next = previous
            previous = current
            current = next
        }
        return reversed
    }
}
