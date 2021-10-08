//
//  minimum_depth_of_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/minimum-depth-of-binary-tree/
 * Primary idea: 二叉树的最小深度，为左右子树的最小深度 + 1
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MinimumDepthOfBinaryTree {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        guard let left = root.left else {
            return minDepth(root.right) + 1
        }

        guard let right = root.right else {
            return minDepth(root.left) + 1
        }

        let leftDepth = minDepth(left)
        let rightDepth = minDepth(right)
        
        return min(leftDepth, rightDepth) + 1
    }
}
