//
//  BinaryTreeInorderTraversal.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/binary-tree-inorder-traversal/
 * Primary idea: Classic binary tree traversing.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class BinaryTreeInorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var nodes = [Int]()
        inorderTraversal(root, &nodes)
        return nodes
    }
    
    func inorderTraversal(_ root: TreeNode?, _ nodes: inout [Int]) {
        if root == nil {
            return
        }
        inorderTraversal(root?.left, &nodes)
        nodes.append(root!.val)
        inorderTraversal(root?.right, &nodes)
    }
}
