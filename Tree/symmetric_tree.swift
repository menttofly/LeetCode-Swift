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
 * Primary idea: A tree is symmetric if the left subtree is a mirror reflection of the right subtree.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SymmetricTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirrorTree(root, root)
    }
    
    private func isMirrorTree(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        guard let root1 = root1, let root2 = root2 else {
            return false
        }
        if root1.val != root2.val {
            return false
        }
        return isMirrorTree(root1.left, root2.right) && isMirrorTree(root1.right, root2.left)
    }
}
