//
//  binary_tree_maximum_path_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/7/30.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/binary-tree-maximum-path-sum/ (124)
 * Primary idea: 明确从当前结点开始的单条分叉路经的最大和定义，计算根节点、左右分叉路径和
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class BinaryTreeMaximumPathSum {
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = Int.min
        singleBranchMaxSum(root, &res)
        return res
    }
    
    /// 计算当前结点开始的单条路径最大和，即 root + max(root.left, root.right)
    /// - Parameters:
    ///   - root: 当前结点
    ///   - res: 二叉树最大路径和
    /// - Returns: 单条分叉最大路径和
    @discardableResult
    func singleBranchMaxSum(_ root: TreeNode?, _ res: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
            
        let left = max(0, singleBranchMaxSum(root.left, &res))
        let right = max(0, singleBranchMaxSum(root.right, &res))
        res = max(res, left + right + root.val)
            
        return max(left, right) + root.val
    }
}
