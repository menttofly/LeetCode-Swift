//
//  flatten_binary_tree_to_linked_list.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
 * Primary idea: 后序遍历，先获取 root 的左右子树拉平后的链表，再根据要求将左链表接到右链表上
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class FlattenBinaryTreeToLinkedList {
    
    /// 以 root 为根的树拉平成一条链表
    /// - Parameter root: 根节点
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        flatten(root.left)
        flatten(root.right)
        /// 拉平后的左、右链表
        let left = root.left, right = root.right
        /// 置空左链表
        root.left = nil
        /// 将左链表接到 root 的右子树上
        root.right = left
        
        /// 找到当前右子树最后一个节点
        var p: TreeNode? = root
        while p?.right != nil {
            p = p?.right
        }
        /// 将原来的右子树接到左链表上
        p?.right = right
    }
}
