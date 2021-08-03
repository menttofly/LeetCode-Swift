//
//  search_in_a_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/3.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/search-in-a-binary-search-tree/
 * Primary idea: 利用 BST 左小右大的特性，实现二分搜索
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SearchBST {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val == val {
            return root
        } else if root.val < val {
            return searchBST(root.right, val)
        } else {
            return searchBST(root.left, val)
        }
    }
}
