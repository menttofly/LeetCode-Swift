//
//  07_重建二叉树.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/3/2.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

fileprivate class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0, inorder.count > 0 else {
            return nil
        }

        var preorder = preorder, inorder = inorder
        return construct(&preorder, &inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    }

    func construct(_ preorder: inout [Int], _ inorder: inout [Int], _ s1: Int, _ e1: Int, _ s2: Int, _ e2: Int) -> TreeNode? {
        if s1 > e1 { return nil }

        let node = TreeNode(preorder[s1]); var find = s2
        while find < inorder.count && inorder[find] != node.val {
            find += 1
        }

        let pre_div = s1 + find - s2
        node.left = construct(&preorder, &inorder, s1 + 1, pre_div, s2, find - 1)
        node.right = construct(&preorder, &inorder, pre_div + 1, e1, find + 1, e2)

        return node
    }
}
