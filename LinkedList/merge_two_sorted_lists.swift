//
//  merge_two_sorted_lists.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/6.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/merge-two-sorted-lists/ (21)
 * Primary idea: 归并排序中 Merge 的实现思路
 *
 * Time Complexity: O(min(m,n)), Space Complexity: O(1)
 */
class MergeTwoSortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let list = ListNode(0)   /// Use as dummy node
        var p1 = l1, p2 = l2, ptr = list
        
        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                ptr.next = p1
                p1 = p1?.next
            } else {
                ptr.next = p2
                p2 = p2?.next
            }
            
            ptr = ptr.next!
        }
        /// 剩余部分
        ptr.next = p1 ?? p2
        return list.next
    }
}
