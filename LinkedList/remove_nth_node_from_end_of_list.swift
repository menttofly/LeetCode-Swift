//
//  remove_nth_node_from_end_of_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/ (19)
 * Primary idea: 使用快慢指针，让 slow 指针指向待删除节点的前驱节点
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class RemoveNthNodeFromEndOfList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let list = ListNode(0)  /// Use as dummy node
        list.next = head
        
        var slow: ListNode = list
        var fast: ListNode? = list
        /// 让 fast 指针先走 n + 1 步
        for _ in 0...n {
            fast = fast?.next
        }
        /// fast 指向 nil 的时候， slow 指针指向倒数第 n 个节点的前驱
        while fast != nil {
            slow = slow.next!
            fast = fast?.next
        }
        
        slow.next = slow.next?.next
        return list.next
    }
}
