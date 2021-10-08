//
//  recover_binary_search_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/recover-binary-search-tree/
 * Primary idea: In-Order traversing.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class RecoverBinarySearchTree {
    var first: TreeNode?, second: TreeNode?, pre = TreeNode(Int.min)
    
    func recoverTree(_ root: TreeNode?) {
        traverse(root)
        guard let first = first, let second = second else {
            return
        }
        
        let temp = first.val
        first.val = second.val
        second.val = temp
    }
    
    func traverse(_ root: TreeNode?) {
        guard let root = root else { return  }
        
        traverse(root.left)
        if (pre.val > root.val) {
            first = first ?? pre
            second = root
        }
        
        pre = root
        traverse(root.right)
    }
}
