//
//  HouseRobberIII.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/house-robber-iii/
 * Primary idea: DFS record the value which include and exclude the node of it's left right subtree.
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */
class HouseRobberIII {
    func rob(_ root: TreeNode?) -> Int {
        let result = robSubtree(root)
        return max(result.exclude, result.include)
    }
    
    private func robSubtree(_ root: TreeNode?) -> (exclude: Int, include : Int) {
        guard let root = root else {
            return (0, 0)
        }
        let left = robSubtree(root.left)
        let right = robSubtree(root.right)
        
        var result: (exclude: Int, include : Int) = (0, 0)
        /// Don't rob this node.
        result.exclude = max(left.exclude, left.include) + max(right.exclude, right.include)
        /// Rob this node.
        result.include = left.exclude + right.exclude + root.val
        
        return result
    }
}
