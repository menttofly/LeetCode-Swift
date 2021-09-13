//
//  next_greater_element_i.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/11.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class NextGreaterElement {
    /**
     * Question Link: https://leetcode.com/problems/next-greater-element-i/
     * Primary idea: 暴力解法，用字典记录数和索引的关系，nums1 中寻找 val 的下一个更大元素时，先取得在 num2 中的索引，然后向后查找
     *
     * Time Complexity: O(n^2)
     */
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var res = Array(repeating: -1, count: nums1.count)
        
        for (i, val) in nums2.enumerated() {
            map[val] = i
        }
        
        for (i, val) in nums1.enumerated() {
            /// 找到 val 在 nums2 中的位置
            let start = map[val]!
            /// 在 num2 中从 start + 1 处开始寻找下一个比 val 大的数
            for j in (start + 1)..<nums2.count {
                if nums2[j] > val {
                    res[i] = nums2[j]
                    break;
                }
            }
        }
        
        return res
    }
    
    /**
     * Primary idea: 使用单调递减栈对 num2 数组持续入栈，维护单调递减特性，被弹出的栈元素的下一更大值就是当前入栈元素
     *
     * Time Complexity: O(m+n)
     */
    func nextGreaterElement1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()  /// 元素 x 和其下一个更大元素的映射
        var res = Array(repeating: -1, count: nums1.count)
        var stack = [Int]()
        
        /// 对 num2 数组元素持续入栈
        for num in nums2 {
            /// num 入栈时，移除不满足维持单调递减（栈底->栈顶）特性的元素，也就是比 num 更小的元素
            while !stack.isEmpty && stack.last! < num {
                /// 这些比 num 小的元素的下一个更大值就是 num，保存起来
                map[stack.removeLast()] = num
            }
            /// 弹完后入栈，此时栈依然是单调递减的
            stack.append(num)
        }
            
        for (index, num) in nums1.enumerated() {
            res[index] = map[num] ?? -1
        }
            
        return res
    }
}
