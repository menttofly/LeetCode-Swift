//
//  next_greater_element_i.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/11.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/next-greater-element-i/
 * Primary idea: 待补
 *
 * Time Complexity: 普通解法 O(n^2), 单调栈解法 O(m + n)
 */
class NextGreaterElement {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var res = Array(repeating: -1, count: nums1.count)
        
        for (i, val) in nums2.enumerated() {
            map[val] = i
        }
        
        for (i, val) in nums1.enumerated() {
            let start = map[val]!    /// num2 中的索引, nums1 是 nums2 子集，一定能找到
            
            for j in (start + 1)..<nums2.count {
                if nums2[j] > val {
                    res[i] = nums2[j]
                    break;
                }
            }
        }
        
        return res
    }
}
