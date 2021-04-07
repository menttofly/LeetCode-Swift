//
//  intersection_of_two_linked_lists.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/intersection-of-two-linked-lists/
 * Primary idea: Instead of getting two list's length, just change pointer to other list's head when point to tail at first time.
 *
 * Time Complexity: O(m+n), Space Complexity: O(1)
 */
class IntersectionOfTwoLinkedLists {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var pa = headA, pb = headB
        /// Two pointer will go the same length which is (lenA + lenB). If there exists intersection, then pa, pb will pointer to intersection
        /// node. If not, pa, pb will both point to nil.(the loop can also exit).
        while pa !== pb {
            pa = pa != nil ? pa?.next : headB
            pb = pb != nil ? pb?.next : headA
        }
        return pa
    }
}
