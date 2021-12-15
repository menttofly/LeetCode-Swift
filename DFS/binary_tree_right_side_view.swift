//
//  binary_tree_right_side_view.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/4.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/**
 * Question Link: https://leetcode.com/problems/binary-tree-right-side-view/ (199)
 * Primary idea: 总是通过 dfs 先访问右子树，然后在每一层存储第一个节点（右侧节点）
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class BinaryTreeRightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        dfs(root, 0, &res)
        return res
    }
    
    private func dfs(_ node: TreeNode?, _ depth: Int, _ res: inout [Int]) -> Void {
        /// 保证每一层只保存一个最右侧节点
        if let val = node?.val, res.count <= depth {
            res.append(val)
        }
        
        if let right = node?.right {
            dfs(right, depth + 1, &res)
        }
        
        if let left = node?.left {
            dfs(left, depth + 1, &res)
        }
    }
}
