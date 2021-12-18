//
//  maximum_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/10.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-binary-tree/ (654)
 * Primary idea: 先定位数组最大元素以构建根节点，然后递归build函数分别构建左右子树，注意使用lo、hi双指针而不是截取数组
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class MaximumBinaryTree {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return build(nums, 0, nums.count - 1)
    }
    
    func build(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi {
            return nil
        }
        /// 获取 nums[lo..hi] 中的最大值
        var index = -1, maxVal = Int.min
        for i in lo...hi {
            if maxVal < nums[i] {
                maxVal = nums[i]
                index = i
            }
        }
        
        let root = TreeNode(maxVal)
        root.left = build(nums, lo, index - 1)
        root.right = build(nums, index + 1, hi)
        
        return root
    }
}
