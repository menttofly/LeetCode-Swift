//
//  sort_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/8.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/sort-list/
 * Primary idea: Because sort a linked list by using constant space complexity, so use merge sort.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class SortList {
    var merger = MergeTwoSortedLists()
    
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        /// Cut the linked list into two parts.
        var fast = head, slow = head
        var prev: ListNode?
        while fast?.next != nil {
            prev = slow
            fast = fast?.next?.next
            slow = slow?.next
        }
        prev?.next = nil
        
        /// Sort each half part.
        let left = sortList(head)
        let right = sortList(slow)
        
        /// Merge left and right parts.
        return merger.mergeTwoLists(left, right)
    }
    
    
    /// Space Complexity: O(n) which is not meet the requirements.
    func sortListQuick(_ head: ListNode?) -> ListNode? {
        var vals = [Int]()
        var pointer = head
        while pointer != nil {
            vals.append(pointer!.val)
            pointer = pointer?.next
        }
        pointer = head
        vals.sort()
        for val in vals {
            pointer?.val = val
            pointer = pointer?.next
        }
        return head
    }
}
