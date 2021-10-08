//
//  insert_into_a_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/3.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/insert-into-a-binary-search-tree/
 * Primary idea: 利用 BST 左小右大的特性，在适当的位置插入新值（该位置指针为空，需要创建新节点）
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class InsertIntoBST {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        /// val 不在树中，创建新的节点，值为 val
        guard let root = root else {
            return TreeNode(val)
        }
        
        if val < root.val {
            /// 在左子树中搜索
            root.left = insertIntoBST(root.left, val)
        } else if val > root.val {
            /// 在右子树中搜索
            root.right = insertIntoBST(root.right, val)
        }
        
        return root
    }
}
