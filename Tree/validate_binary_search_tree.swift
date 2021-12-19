//
//  validate_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/validate-binary-search-tree/ (98)
 * Primary idea: 递归遍历二叉树所有节点，满足动态更新区间 (minVal..maxVal) 的节点为 BST
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ValidateBinarySearchTree {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, Int64.min, Int64.max)
    }
    
    func isValidBST(_ root: TreeNode?, _ minVal: Int64, _ maxVal: Int64) -> Bool {
        guard let root = root else {
            return true
        }
        /// val 不在 (minVal..maxVal) 区间内，则不符合 BST 性质（root 大于左子树，小于右子树）
        if root.val <= minVal || root.val >= maxVal {
            return false
        }
        /// root 符合 BST 性质， 且左右子树均为 BST
        /// left 子树若为 BST，其所有节点值小于 root.val
        /// right 子树若为 BST，其所有节点值大于 root.val
        return isValidBST(root.left, minVal, Int64(root.val)) && isValidBST(root.right, Int64(root.val), maxVal)
    }
}
