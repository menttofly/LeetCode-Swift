//
//  path_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/13.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/path-sum/
 * Primary idea: Deep-first-seaching and compare the root's value with target sum.
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class PathSum {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        /// Root is a leaf node.
        if root.left == nil && root.right == nil && root.val == sum {
            return true
        }
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
}
