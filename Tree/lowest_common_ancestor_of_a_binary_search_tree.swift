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
 * Primary idea: Recursively iterating over the tree according to BST's nature.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LowestCommonAncestorOfABinarySearchTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        let rootVal = root.val, pVal = p.val, qVal = q.val
        if (pVal > rootVal && qVal > rootVal) {
            return lowestCommonAncestor(root.right, p, q);
        } else if (pVal < rootVal && qVal < rootVal) {
            return lowestCommonAncestor(root.left, p, q);
        } else {
            return root;
        }
    }
}
