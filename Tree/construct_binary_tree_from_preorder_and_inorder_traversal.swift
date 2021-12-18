//
//  construct_binary_tree_from_preorder_and_inorder_traversal.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/ (105)
 * Primary idea: 根据先序遍历特征，定位当前 root 节点，然后在中序序列中定位 root 位置，以此分割左右子树
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
    
    private func build(_ preorder: inout [Int], _ inorder: inout [Int], _ pre_start: Int, _ pre_end: Int, _ in_start: Int, _ in_end: Int) -> TreeNode? {
        if pre_start > pre_end {  /// 如果 pre_start = pre_end 则表示序列中只剩下一个节点
            return nil
        }
        /// 从先序序列中获取当前 root 节点
        let root = TreeNode(preorder[pre_start])
        var pos = in_start
        /// 定位 root 节点在中序序列中的位置
        while pos <= in_end && inorder[pos] != root.val {
            pos += 1
        }
        
        root.left = build(&preorder, &inorder, pre_start + 1, pre_start + pos - in_start, in_start, pos - 1)
        root.right = build(&preorder, &inorder, pre_start + pos - in_start + 1, pre_end, pos + 1, in_end)
        return root
    }
}
