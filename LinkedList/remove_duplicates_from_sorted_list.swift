//
//  remove_duplicates_from_sorted_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/23.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 * Primary idea: 快慢指针，遍历已排序的数组
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class DeleteDuplicates {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil {
            if fast!.val != slow!.val {
                /// 把当前 slow 的 next 指向下一个不重复元素 fast
                slow?.next = fast
                /// slow 指针前进
                slow = slow?.next
            }
            
            fast = fast?.next
        }
        
        /// 断开与后面重复元素的连接
        slow?.next = nil
        return head
    }
}
