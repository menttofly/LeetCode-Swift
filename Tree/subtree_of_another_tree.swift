//
//  subtree_of_another_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subtree-of-another-tree/
 * Primary idea: Recursively iterating over the tree, and by comparison of nodes.
 *
 * Time Complexity: O(m * n), Space Complexity: O(1)
 */
class SubtreeOfAnotherTree {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        guard let s = s, let t = t else {
            return false
        }
        let result = isSubtree(s.left, t) || isSubtree(s.right, t)
        return result || isMatch(s, t)
    }
    
    /// Require tree's structure exactly match.
    func isMatch(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        guard let s = s, let t = t else {
            return false
        }
        if s.val != t.val {
            return false
        }
        return isMatch(s.left, t.left) && isMatch(s.right, t.right)
    }
}
