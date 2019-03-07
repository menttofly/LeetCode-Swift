//
//  LinkedListCycle.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/linked-list-cycle/
 * Primary idea: Use two pointer to race in linked list, if fast one catch slow one then it has cycle.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head, slow = head
        while fast != nil && slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        return false
    }
}
