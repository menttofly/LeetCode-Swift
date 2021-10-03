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
    /// 翻转区间 [head, tail) 内的元素
    func reverseBetween(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        var pre: ListNode?, cur = head
        
        while cur !== tail {
            let rear = cur?.next
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
            /// base case，不足 k 个 无需翻转
            if p == nil { return head }
            /// 让 p 前进到 k + 1 的位置，即下一组
            p = p?.next
        }
        /// 翻转 [head, p) 之间的元素
        let rhead = reverseBetween(head, p)
        /// 从 p 开始 k 个一组翻转链表，返回 reversed head，作为 head 节点的后继
        head.next = reverseKGroup(p, k)
        
        return rhead
    }
}
