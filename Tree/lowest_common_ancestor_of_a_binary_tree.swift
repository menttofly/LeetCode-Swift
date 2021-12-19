//
//  lowest_common_ancestor_of_a_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/ (236)
 * Primary idea: DFS the tree to find p and q.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LowestCommonAncestorOfABinaryTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root === p || root === q {
            return root
        }
        
        /// 并非返回 p、q 的 LCA，而是在左右子树中查找 p、q 节点
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left != nil && right != nil {
            return root
        }
        
        return left ?? right
    }
}
