//
//  lowest_common_ancestor_of_a_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 * Primary idea: 根据 BST 性质进行递归遍历
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LowestCommonAncestorOfABinarySearchTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }
        
        let rootVal = root.val, pVal = p.val, qVal = q.val
        
        if (pVal > rootVal && qVal > rootVal) {
            /// p 和 q 在 root 的右子树中
            return lowestCommonAncestor(root.right, p, q);
        } else if (pVal < rootVal && qVal < rootVal) {
            /// p 和 q 在 root 的左子树中
            return lowestCommonAncestor(root.left, p, q);
        } else {
            /// p 和 q 分别在 root 的左右子树中，则 root 为 LCA
            return root;
        }
    }
}
