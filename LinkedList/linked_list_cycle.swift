//
//  linked_list_cycle.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/linked-list-cycle/ (141)
 * Primary idea: 使用快慢指针，如果快指针追上慢指针，则存在环
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        
        var fast = head, slow = head
        while fast != nil {
            fast = fast?.next?.next  /// 每次走两步
            slow = slow?.next        /// 每次走一步
            if fast === slow {
                return true
            }
        }
        
        return false
    }
}
