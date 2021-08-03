//
//  kth_mallest_element_in_a_bst.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/3.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/kth-smallest-element-in-a-bst/
 * Primary idea: 二叉树中序遍历结果是有序的
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class KthSmallest {
    var res = 0, rank = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        kthSmallestElement(root, k)
        return res
    }
    
    func kthSmallestElement(_ root: TreeNode?, _ k: Int) {
        guard let root = root else {
            return
        }
        kthSmallestElement(root.left, k)
        rank += 1
        if rank == k {
            res = root.val
            return
        }
        kthSmallestElement(root.right, k)
    }
}
