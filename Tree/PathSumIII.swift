//
//  PathSumIII.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/13.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/path-sum-iii/
 * Primary idea: DFS
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class PathSumIII {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        return find(root, sum) + pathSum(root?.left, sum) + pathSum(root?.right, sum)
    }
    
    /// Path start from current root node.
    private func find(_ root: TreeNode?, _ target: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 0
        if root.val == target {
            res += 1
        }
        res += find(root.left, target - root.val)
        res += find(root.right, target - root.val)
        return res
    }
}
