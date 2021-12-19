//
//  diameter_of_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/diameter-of-binary-tree/ (543)
 * Primary idea: 将问题转换为二叉树所有节点的最大左右子树高度
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class DiameterOfBinaryTree {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        depth(root, &res)
        return res
    }
    
    /// 计算 root 二叉树的高度，即左右子树高度的较大者
    /// - Parameters:
    ///   - root: 根结点
    ///   - res: 结果
    /// - Returns: 当前树的高度
    @discardableResult
    private func depth(_ root: TreeNode?, _ res: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = depth(root.left, &res)
        let rightDepth = depth(root.right, &res)
        res = max(res, leftDepth + rightDepth)
        
        return max(leftDepth, rightDepth) + 1
    }
}
