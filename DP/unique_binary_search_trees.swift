//
//  unique_binary_search_trees.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/unique-binary-search-trees/ (96)
 * Primary idea: DP(i) 表示 [1..i] 区间的数字组成 unique BST 的数量
 *
 * Note: 结果为选择任意一个数作为节点后，其左右子树的乘积就是一个选择的 BST 数量，全部相加即为结果
 * G(n) = G(0) * G(n-1) + G(1) * G(n-2) + … + G(n-1) * G(0)
 *
 * State Transition Equation: DP(i) = sum{DP(j, i-j-1), j in [0..i)}
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class UniqueBinarySearchTrees {
    /// 自底向上
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        /// 每个数都可以作为 root 节点
        for i in 1...n {
            for j in 0..<i {  /// The number set as root node. (j + 1)
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
    
    /// 自顶向下，结合备忘录消除子问题重复计算
    func numTrees1(_ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        return bstCount(1, n, &memo)
    }
        
    /// 计算闭区间 [lo, hi] 的数字能组成的 BST 数量
    /// - Parameters:
    ///   - lo: 起始值
    ///   - hi: 结束值
    ///   - memo: 缓存（备忘录），避免子问题重复计算
    /// - Returns: 组成的 BST 数量
    func bstCount(_ lo: Int, _ hi: Int, _ memo: inout [[Int]]) -> Int {
        if lo >= hi {
            return 1
        }
            
        if (memo[lo][hi] != 0) { return  memo[lo][hi] }
        var res = 0
        for i in lo...hi {
            /// 以节点 i 为当前根节点
            let left = bstCount(lo, i - 1, &memo)
            let right = bstCount(i + 1, hi, &memo)
            /// 左右子树组合数的乘积就是 BST 的总数
            res += left * right
        }
            
        memo[lo][hi] = res
        return res
    }
}
