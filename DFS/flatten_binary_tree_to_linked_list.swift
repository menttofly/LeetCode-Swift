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
 * Primary idea: Assuming a binary tree has flatten it's left and right subtree, then flatten it to a linked list with DFS.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class FlattenBinaryTreeToLinkedList {
    func flatten(_ root: TreeNode?) {
        dfs(root)
    }
    
    @discardableResult
    /// Return the tail node after flatten the tree.
    private func dfs(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        /// Flatten root node's left and right subtree.
        let leftTail = dfs(root?.left)
        let rightTrail = dfs(root?.right)
        
        /// If left subtree exsists, then insert left flatten subtree to right part.
        if root?.left != nil {
            let temp = root?.right
            root?.right = root?.left
            root?.left = nil
            leftTail?.right = temp
        }
        /// After left subtree merge to right part, right trail is the tail for root's parent node.
        if let right = rightTrail {
            return right
        }
        /// There is no right subtree.
        if let left = leftTail {
            return left
        }
        return root
    }
}
