//
//  binary_tree_level_order_traversal.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/binary-tree-level-order-traversal/ (102)
 * Primary idea: 使用队列记录每一层节点顺序，队列不为空时出队列
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = [root], res = [[Int]]()
        while !queue.isEmpty {
            var list = [Int]()
            /// 遍历当前队列中，即同一个层级的所有节点
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                list.append(node.val)
                /// 保存下一层的所有节点信息
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(list)
        }
        
        return res
    }
}
