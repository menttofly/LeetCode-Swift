//
//  word_search.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/word-search/ (79)
 * Primary idea: 通过 dfs 判断某条路径是否可以组成 word
 *
 * Time Complexity: O(M!N!), Space Complexity: O(MN)
 */
class WordSearch {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty || board[0].isEmpty {
            return false
        }
        let word = Array(word)
        var board = board
        /// 判断是否在当前 dfs 路径中
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if dfs(&board, &visited, word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    /// 从矩阵 (row, col) 开始深度优先搜索，经过的路径是否可以组成 word
    /// - Parameters:
    ///   - index: 当前已经匹配 word 的字母数量
    /// - Returns: 是否有这样一条路径可以
    func dfs(_ board: inout [[Character]], _ visited: inout [[Bool]], _ word: [Character], _ row: Int, _ col: Int, _ index: Int) -> Bool {
        /// 已匹配的字符数量和 word 长度相同，代表可以找到这样一条路径
        if index == word.count {
            return true
        }
        if row < 0 || col < 0 || row >= board.count || col >= board[0].count {
            return false
        }
        /// 当前 dfs 路径中该节点被访问过，或者当前字符和 word 中 index 处字符不同
        if visited[row][col] || board[row][col] != word[index] {
            return false
        }
        /// 标记该节点已访问
        visited[row][col] = true
        /// 对当前位置的 4 个方向进行 dfs 搜索
        if dfs(&board, &visited, word, row - 1, col, index + 1) {
            return true
        }
        if dfs(&board, &visited, word, row + 1, col, index + 1) {
            return true
        }
        if dfs(&board, &visited, word, row, col - 1, index + 1) {
            return true
        }
        if dfs(&board, &visited, word, row, col + 1, index + 1) {
            return true
        }
        /// dfs 返回（递归返回原先树的层级），重置该位置状态为未访问
        visited[row][col] = false
        
        return false
    }
}
