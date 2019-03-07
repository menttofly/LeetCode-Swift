//
//  LinkedListCycleII.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/8.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/linked-list-cycle-ii/
 * Primary idea: Determine whether there is a cycle, if there is one then return the entry location of the cycle.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LinkedListCycleII {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return nil;
        }
        var fast = head, slow = head, entry = head
        while (fast != nil && slow != nil ) {
            fast = fast?.next?.next
            slow = slow?.next
            if (fast === slow) {
                while (slow !== entry) {
                    slow = slow?.next
                    entry = entry?.next;
                }
                return entry;
            }
        }
        return nil;
    }
}
