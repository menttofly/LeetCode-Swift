//
//  delete_node_in_a_bst.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/3.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/delete-node-in-a-bst/
 * Primary idea: 找到待删除的节点后，需要保持 BST 特性，所以从右子树中找最小值替换到待删除的节点中
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class DeleteBSTNode {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val == key {
            /// 待删除节点为叶子节点，或 left、right 中只有一个有值
            if root.left == nil { return root.right }
            if root.right == nil { return root.left }
            
            /// 待删除节点左右子节点都有值，则从右子树寻找最小值
            let minNode = bstMinNode(root.right!)
            root.val = minNode.val
            root.right = deleteNode(root.right, minNode.val)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            root.left = deleteNode(root.left, key)
        }
        
        return root
    }
    
    /// 返回 BST 中的最小值
    func bstMinNode(_ root: TreeNode) -> TreeNode {
        var minNode = root
        while minNode.left != nil {
            minNode = minNode.left!
        }
        return minNode
    }
}
