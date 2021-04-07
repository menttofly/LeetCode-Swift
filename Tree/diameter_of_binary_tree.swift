//
//  diameter_of_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/diameter-of-binary-tree/
 * Primary idea: Turn question to find the mostly depth of left and right tree.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class DiameterOfBinaryTree {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 1
        depth(root, &res)
        return res - 1
    }
    
    @discardableResult
    private func depth(_ root: TreeNode?, _ res: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let leftDepth = depth(root.left, &res)
        let rightDepth = depth(root.right, &res)
        res = max(res, leftDepth + rightDepth + 1)
        return max(leftDepth, rightDepth) + 1
    }
}
