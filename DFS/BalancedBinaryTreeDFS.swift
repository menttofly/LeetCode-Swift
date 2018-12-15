//
//  BalancedBinaryTreeDFS.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/
 * Primary idea: If current node's sub-tree loose balance, simply return -1 until call stack pop to root. Also use last-order traversal.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BalancedBinaryTreeDFS {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return DFSHeight(root) != -1
    }
    
    func DFSHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth = DFSHeight(root?.left)
        if leftDepth == -1 {
            return -1
        }
        let rightDepth = DFSHeight(root?.right)
        if rightDepth == -1 {
            return -1
        }
        if abs(leftDepth - rightDepth) > 1 {
            return -1
        }
        return max(leftDepth, rightDepth) + 1
    }
}
