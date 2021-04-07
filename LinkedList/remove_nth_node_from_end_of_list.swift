//
//  remove_nth_node_from_end_of_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
 * Primary idea: Find the previous node that should be deleted using two pointer.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class RemoveNthNodeFromEndOfList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let list: ListNode = ListNode(0)  /// Use as dummy node
        list.next = head
        
        var slow: ListNode = list
        var fast: ListNode? = list
        for _ in 0...n {
            fast = fast?.next
        }
        /// Let slow pointer point to the previous node of delete node.
        while fast != nil {
            slow = slow.next!
            fast = fast?.next
        }
        slow.next = slow.next?.next
        return list.next
    }
}
