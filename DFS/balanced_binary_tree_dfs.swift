//
//  balanced_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/balanced-binary-tree/ (110)
 * Primary idea: 一个节点是否平衡，先后续遍历获取左右子节点的高度，返回 -1 代表不平衡，深度差超过 1 也是不平衡并返回 -1
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BalancedBinaryTreeDFS {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return DFSHeight(root) != -1
    }
    
    func DFSHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        /// 左子树已经不平衡，则当前 root 为根的树也不平衡
        let leftDepth = DFSHeight(root.left)
        if leftDepth == -1 {
            return -1
        }
        /// 右子树已经不平衡，则当前 root 为根的树也不平衡
        let rightDepth = DFSHeight(root.right)
        if rightDepth == -1 {
            return -1
        }
        /// 深度差超过 1，不平衡并返回 -1
        if abs(leftDepth - rightDepth) > 1 {
            return -1
        }
        /// 返回当前树高度
        return max(leftDepth, rightDepth) + 1
    }
}
