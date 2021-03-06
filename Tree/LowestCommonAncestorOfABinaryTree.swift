//
//  LowestCommonAncestorOfABinaryTree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * Primary idea: DFS the tree to find p and q.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LowestCommonAncestorOfABinaryTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left != nil && right != nil {
            return root
        }
        return left ?? right
    }
}
