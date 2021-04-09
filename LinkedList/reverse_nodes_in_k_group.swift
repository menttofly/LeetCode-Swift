//
//  reverse_nodes_in_k_group.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/9.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-nodes-in-k-group/
 * Primary idea: 实现反转区间[a, b)之间的节点，然后每隔k个节点递归调用返回反转后的头节点，最后让head的next域指向这个头节点
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */

class ReverseNodesInKGroup {
    /// [a, b)
    func reverseBetween(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head, rear = head
        while cur !== tail {
            rear = rear?.next
            cur?.next = pre
            pre = cur
            cur = rear
        }
        
        return pre
    }
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var p: ListNode? = head
        for _ in 0..<k {
            if p == nil { return head }
            p = p?.next
        }
        
        let rhead = reverseBetween(head, p)
        head.next = reverseKGroup(p, k)
        
        return rhead
    }
}
