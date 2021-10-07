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
 * Primary idea: 寻找所有非叶子节点，将其左右子树互相调换
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class InvertBinaryTree {
    @discardableResult
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        invertTree(root.left)
        invertTree(root.right)
        
        return root
    }
}
