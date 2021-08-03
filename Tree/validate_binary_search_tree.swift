//
//  validate_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/validate-binary-search-tree/
 * Primary idea: Recursively iterating over the tree, and defining interval <minVal, maxVal> for each node which value must fit in.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ValidateBinarySearchTree {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, Int64.min, Int64.max)
    }
    
    func isValidBST(_ root: TreeNode?, _ minVal: Int64, _ maxVal: Int64) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val <= minVal || root.val >= maxVal {
            return false
        }
        return isValidBST(root.left, minVal, Int64(root.val)) && isValidBST(root.right, Int64(root.val), maxVal)
    }
}
