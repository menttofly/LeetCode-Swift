//
//  maximum_sum_bst_in_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/5.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-sum-bst-in-binary-tree/
 * Primary idea: 通过后续遍历，获取左右子树是否为 BST，所有节点和等信息，判断当前 root 树是否为 BST，是则更新 BST 的最大值并返回当前树信息
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class MaxSumBST {
    func maxSumBST(_ root: TreeNode?) -> Int {
        var maxSum = 0
        traverse(root, &maxSum)
        return maxSum
    }
    
    /// 判断以当前为 root 的二叉树是否是 BST，并返回一个 (isBST, minVal, maxVal, bstSum) 元组
    /// - Parameters:
    ///   - root: 当前跟节点
    ///   - maxSum: 最大 BST 的节点之和
    /// - Returns: 对当前二叉树的判断（是否是BST，BST的最小值，BST的最大值，BST节点之和）
    @discardableResult
    func traverse(_ root: TreeNode?, _ maxSum: inout Int) -> (Bool, Int, Int, Int) {
        guard let root = root else {
            return (true, Int.max, Int.min, 0)
        }
        /// 后序遍历
        let left = traverse(root.left, &maxSum)
        let right = traverse(root.right, &maxSum)
        /// 左右子树为 BST，且以 root 为根结点的树为 BST
        if left.0 && right.0, root.val > left.2 && root.val < right.1 {
            let minVal = min(left.1, root.val)
            let maxVal = max(right.2, root.val)
            let bstSum = left.3 + right.3 + root.val
            maxSum = max(maxSum, bstSum)
            return (true, minVal, maxVal, bstSum)
        } else {
            return (false, 0, 0, 0)
        }
    }
}
