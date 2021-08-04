//
//  unique_binary_search_trees_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/4.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/unique-binary-search-trees-ii/
 * Primary idea: 穷举可能的 root 节点，递归构建左右子树合法 BST，对当前 root 节点穷举所有左右子树的组合
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return buildTraverse(1, n)
    }
    
    /// 构造闭区间 [lo, hi] 所有可能的 BST 组合，返回根节点 root 的集合
    /// - Parameters:
    ///   - lo: 起点
    ///   - hi: 终点
    /// - Returns: 根节点 root 所有可能的集合
    func buildTraverse(_ lo: Int, _ hi: Int) -> [TreeNode?] {
        if (lo > hi) {
            /// 返回 nil 数组，用于构建父节点的 left、right 域为 nil
            return [nil]
        }
        
        var res = [TreeNode?]()
        /// 穷举 root 节点所有的可能
        for i in lo...hi {
            /// 递归构造左右子树的所有合法 BST
            let leftBST = buildTraverse(lo, i - 1)
            let rightBST = buildTraverse(i + 1, hi)
            /// 给 root 节点穷举所有左右子树的组合
            for left in leftBST {
                for right in rightBST {
                    /// i 作为根节点 root 的值
                    let root = TreeNode(i)
                    /// 构建左右节点，最终构建整个 BST 结构
                    root.left = left
                    root.right = right
                    res.append(root)
                }
            }
        }
        
        return res
    }
}
