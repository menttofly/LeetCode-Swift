//
//  balanced_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/
 * Primary idea: 后序遍历框架，递归时记录左右子树深度。先判断左右子树是否平衡，再判断当前 root 节点是否平衡（左右子树深度差不超过一）
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BalancedBinaryTree {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var depth = 0
        return isBalanced(root, depth: &depth)
    }
    
    func isBalanced(_ root: TreeNode?, depth: inout Int) -> Bool {
        guard let root = root else {
            depth = 0; return true
        }
        
        var leftDepth = 0, rightDepth = 0
        if isBalanced(root.left, depth: &leftDepth) && isBalanced(root.right, depth: &rightDepth) {
            if abs(leftDepth - rightDepth) < 2 {
                depth = max(leftDepth, rightDepth) + 1
                return true
            }
        }
        
        return false
    }
}

/// Store node's balance nature and depth with tuple.
class BalancedBinaryTreeTuple {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return isBalancedTree(root).0
    }
    
    func isBalancedTree(_ root: TreeNode?) -> (Bool, Int) {
        guard let root = root else {
            return (true, 0)
        }
        
        let left = isBalancedTree(root.left)
        let right = isBalancedTree(root.right)
        
        if left.0 && right.0 {
            if abs(left.1 - right.1) < 2 {
                let depth = max(left.1, right.1) + 1
                return (true, depth)
            }
        }
        
        return (false, -1)
    }
}
