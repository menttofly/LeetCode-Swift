//
//  symmetric_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/symmetric-tree/
 * Primary idea: 左右子树对称的二叉树为镜像树
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SymmetricTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirrorTree(root, root)
    }
    
    private func isMirrorTree(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        /// 都为空，符合 mirror 树条件
        if root1 == nil && root2 == nil {
            return true
        }
        /// 有一个为空，不符合镜像条件
        guard let root1 = root1, let root2 = root2 else {
            return false
        }
        
        if root1.val != root2.val {
            return false
        }
        /// 比较 root1 和 root2 对称位置是否符合镜像条件
        return isMirrorTree(root1.left, root2.right) && isMirrorTree(root1.right, root2.left)
    }
}
