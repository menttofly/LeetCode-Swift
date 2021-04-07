//
//  invert_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/invert-binary-tree/
 * Primary idea: Pre-Order traversing binary tree, find all non-leaf nodes and exchange it's left and right child nodes.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class InvertBinaryTree {
    @discardableResult
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        invertTree(root?.left)
        invertTree(root?.right)
        return root
    }
}
