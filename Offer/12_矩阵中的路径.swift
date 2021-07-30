//
//  12_矩阵中的路径.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class MitrixPathExist {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board, word = Array(word)
        /// 用来记录是否达到一条路径的叶子结点，visited = true 代表回到节点本身，即上一个就是叶子结点
        var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if dfs(&board, &visited, &word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }

    func dfs(_ board: inout [[Character]], _ visited: inout [[Bool]], _ word: inout [Character], _ row: Int, _ col: Int, _ matched: Int) -> Bool {
        if matched == word.count {
            return true
        }
        if row < 0 || col < 0 || row >= board.count || col >= board[0].count {
            return false
        }
        if visited[row][col] || board[row][col] != word[matched] {
            return false
        }
        visited[row][col] = true
        if dfs(&board, &visited, &word, row - 1, col, matched + 1) {
            return true
        }
        if dfs(&board, &visited, &word, row + 1, col, matched + 1) {
            return true
        }
        if dfs(&board, &visited, &word, row, col + 1, matched + 1) {
            return true
        }
        if dfs(&board, &visited, &word, row, col - 1, matched + 1) {
            return true
        }
        visited[row][col] = false
        return false
    }
}
