//
//  MergeTwoSortedLists.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/6.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/merge-two-sorted-lists/
 * Primary idea: Inspired by Merge Sort
 *
 * Time Complexity: O(min(m,n)), Space Complexity: O(1)
 */
class MergeTwoSortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let list = ListNode(0)   /// Use as dummy node
        var ls1 = l1, ls2 = l2, ptr = list
        while ls1 != nil && ls2 != nil {
            if ls1!.val < ls2!.val {
                ptr.next = ls1
                ls1 = ls1?.next
            } else {
                ptr.next = ls2
                ls2 = ls2?.next
            }
            ptr = ptr.next!
        }
        ptr.next = ls1 ?? ls2
        return list.next
    }
}
