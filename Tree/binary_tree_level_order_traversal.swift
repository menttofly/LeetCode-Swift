//
//  binary_tree_level_order_traversal.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/binary-tree-level-order-traversal/
 * Primary idea: Pre-Order traversing binary tree, put nodes in a queue and dequeue N times (N means queue current size).
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue = [root], result = [[Int]]()
        while !queue.isEmpty {
            var list = [Int]()
            for _ in 0..<queue.count {  /// In the same level.
                let node = queue.removeFirst()
                list.append(node.val)
                /// Put left node in queue in case of miss child node's info.
                /// Next level
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(list)
        }
        return result
    }
}
