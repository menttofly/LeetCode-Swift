//
//  merge_two_binary_trees.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/merge-two-binary-trees/ (617)
 * Primary idea: 递归遍历两个字数，分别合并对应节点
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class MergeTwoBinaryTrees {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1 = t1 else {
            return t2
        }
        
        guard let t2 = t2 else {
            return t1
        }

        t1.val += t2.val
        t1.left = mergeTrees(t1.left, t2.left)
        t1.right = mergeTrees(t1.right, t2.right)
        return t1
    }
}
