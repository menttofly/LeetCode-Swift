//
//  recover_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/recover-binary-search-tree/ (99)
 * Primary idea: 正常 BST 中序遍历会得到有序序列，
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class RecoverBinarySearchTree {
    /// first、second 记录被交换的两个节点，pre 记录遍历过程前一个值
    var first: TreeNode?, second: TreeNode?, pre = TreeNode(Int.min)
    
    func recoverTree(_ root: TreeNode?) {
        findExchangedNode(root)
        guard let first = first, let second = second else {
            return
        }
        
        let temp = first.val
        first.val = second.val
        second.val = temp
    }
    
    /// 从 root 为根的树中搜索被交换的两个节点
    /// - Parameter root: 根结点
    func findExchangedNode(_ root: TreeNode?) {
        guard let root = root else { return }
        
        findExchangedNode(root.left)
        /// 若前一个值比当前大，说明不符合 BST
        if (pre.val > root.val) {
            /// 若 first 无值，被交换的第一个节点为 pre
            first = first ?? pre
            /// 被交换的第二个节点为最新的 root
            second = root
        }
        /// 每次都更新 pre
        pre = root
        findExchangedNode(root.right)
    }
}
