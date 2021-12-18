//
//  subtree_of_another_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subtree-of-another-tree/ (572)
 * Primary idea: Recursively iterating over the tree, and by comparison of nodes.
 *
 * Time Complexity: O(m * n), Space Complexity: O(1)
 */
class SubtreeOfAnotherTree {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        /// 都为空节点，返回 true
        if s == nil && t == nil {
            return true
        }
        /// 有一个为空，返回 false
        guard let s = s, let t = t else {
            return false
        }
        
        let res = isSubtree(s.left, t) || isSubtree(s.right, t)
        return res || isMatch(s, t)
    }
    
    /// 判断 s 和 t 是否完全一致
    /// - Parameters:
    ///   - s: 二叉树
    ///   - t: 二叉树
    /// - Returns: 匹配结果
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
