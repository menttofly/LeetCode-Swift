//
//  next_greater_element_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/12.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/next-greater-element-ii/ (503)
 * Primary idea: 使用单调递减栈对 x 元素索引持续入栈，维护单调递减特性，被弹出的栈的索引的下一更大值就是当前入栈索引对应的元素
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class NextGreaterElementsII {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let size = nums.count
        var res = Array(repeating: -1, count: size)
        var stack = [Int]()
        
        /// 假装将数组扩容一下，让后面元素可以访问到前面的元素
        for i in 0..<size * 2 {
            while !stack.isEmpty && nums[stack.last!] < nums[i % size] {
                res[stack.removeLast()] = nums[i % size]
            }
            
            stack.append(i % size)
        }
        
        return res
    }
}
