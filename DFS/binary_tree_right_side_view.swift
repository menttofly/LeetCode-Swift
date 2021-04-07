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
 * Question Link: https://leetcode.com/problems/binary-tree-right-side-view/
 * Primary idea: Always visit the right subtree first by Depth-first Search, then store the first node we visited at each depth
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class BinaryTreeRightSideView {
    private func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root != nil {
            rightSideDFS(root, 0, &result)
        }
        return result
    }
    private func rightSideDFS(_ node: TreeNode?, _ depth: Int, _ result: inout [Int]) -> Void {
        if let val = node?.val, result.count <= depth {
            result.append(val)
        }
        if let right = node?.right {
            rightSideDFS(right, depth + 1, &result)
        }
        if let left = node?.left {
            rightSideDFS(left, depth + 1, &result)
        }
    }
}
