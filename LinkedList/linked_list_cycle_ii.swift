//
//  linked_list_cycle_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/8.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/linked-list-cycle-ii/
 * Primary idea: 使用快慢指针达到相交点，再分别从相交点和起点走相同距离直到相遇，就是环入口
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class LinkedListCycleII {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return nil;
        }
        
        var fast = head, slow = head, entry = head
        while fast != nil {
            fast = fast?.next?.next  /// 快指针每次走两步
            slow = slow?.next        /// 慢指针每次走一步
            if (fast === slow) {
                /// 从起点和交点走相同距离，就到了环的入口
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
