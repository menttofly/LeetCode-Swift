//
//  convert_bst_to_greater_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/convert-bst-to-greater-tree/
 * Primary idea: 利用 BST 的特性，使用中序遍历按大小倒序输出，当前节点的新值就是累加和
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ConvertBSTToGreaterTree {
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        return convertBST(root, &sum)
    }
    
    @discardableResult
    func convertBST(_ root: TreeNode?, _ sum: inout Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        convertBST(root.right, &sum)
        sum += root.val
        root.val = sum
        convertBST(root.left, &sum)
        return root
    }
}
