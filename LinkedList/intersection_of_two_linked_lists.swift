//
//  intersection_of_two_linked_lists.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/intersection-of-two-linked-lists/ (160)
 * Primary idea: A 指针指向尾部时，重新指向 B 头部。B 指针指向尾部时，重新指向 A 头部，相交时会走过相同的长度 len(A) + len(B)
 *
 * Note: 这里不获取两条链表的长度，然后使用快慢指针
 *
 * Time Complexity: O(m+n), Space Complexity: O(1)
 */
class IntersectionOfTwoLinkedLists {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        /// 一条链表不存在，没有交点
        if headA == nil || headB == nil {
            return nil
        }
        
        var pa = headA, pb = headB
        /// 若存在交点，pa 和 pb 指向交点
        /// 若两者不相交，pa 和 pb 走过 len(A) + len(B) 长度后，均指向 nil
        while pa !== pb {
            pa = pa != nil ? pa?.next : headB
            pb = pb != nil ? pb?.next : headA
        }
        
        return pa
    }
}
