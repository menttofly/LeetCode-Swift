//
//  count_complete_tree_nodes.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/count-complete-tree-nodes/ (222)
 * Primary idea: 当 root 的左右子树高度相同则为满二叉树，直接用 2^n - 1 得出，否则用常规的二叉树节点数计算方法
 *
 * Time Complexity: O(nlogn * nlogn), Space Complexity: O(n)
 */
class CountCompleteBinaryTreeNodes {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        /// 获取 root 左右子树的深度
        var lNode: TreeNode? = root, rNode: TreeNode? = root
        var lh = 0, rh = 0
        while lNode != nil {
            lNode = lNode?.left
            lh += 1
        }
        while rNode != nil {
            rNode = rNode?.right
            rh += 1
        }
        
        if lh == rh {
            return Int(pow(2.0, Double(lh))) - 1
        }
        
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}
