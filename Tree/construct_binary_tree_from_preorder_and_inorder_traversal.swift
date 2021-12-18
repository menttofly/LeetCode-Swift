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
 * Primary idea: 根据先序遍历特征，定位当前 root 节点，然后在中序遍历中定位 root，以此分割左右子树
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
        if ps > pe {  /// 如果 ps = pe 则表示序列中只剩下一个节点
            return nil
        }
        /// 从先序序列中获取当前 root 节点
        let root = TreeNode(preorder[ps])
        var pos = ins
        /// 定位 root 节点在中序序列中的位置
        while pos <= ine && inorder[pos] != root.val {
            pos += 1
        }
        
        root.left = build(&preorder, &inorder, ps + 1, ps + pos - ins, ins, pos - 1)
        root.right = build(&preorder, &inorder, ps + pos - ins + 1, pe, pos + 1, ine)
        return root
    }
}
