//
//  construct_binary_tree_from_preorder_and_inorder_traversal.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 * Primary idea: Analyzing the laws of the pre-order sequence and in-order sequence.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ConstructBinaryTreeFromPreorderAndInorderTraversal {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        var preorder = preorder, inorder = inorder
        return build(&preorder, &inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    private func build(_ preorder: inout [Int], _ inorder: inout [Int], _ ps: Int, _ pe: Int, _ ins: Int, _ ine: Int) -> TreeNode? {
        if ps > pe {  /// If ps = pe means that there is only one node in the sequence.
            return nil
        }
        let root = TreeNode(preorder[ps])
        var divide = ins
        /// Find the root node in inorder sequence, which is divide.
        while divide <= ine && inorder[divide] != root.val {
            divide += 1
        }
        root.left = build(&preorder, &inorder, ps + 1, ps + divide - ins, ins, divide - 1)
        root.right = build(&preorder, &inorder, ps + divide - ins + 1, pe, divide + 1, ine)
        return root
    }
}
