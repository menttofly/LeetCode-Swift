//
//  maximum_depth_of_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/ (104)
 * Primary idea: Recursively iterating over the tree, the depth of node is maxinum of it's two sub-tree depth.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MaximumDepthOfBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
