//
//  WordSearch.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/word-search/
 * Primary idea: Compare the character on board to word by DFS.
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
    
    /// index point to the position that next position to last matched character.
    func dfs(_ board: inout [[Character]], _ visited: inout [[Bool]], _ word: [Character], _ row: Int, _ col: Int, _ index: Int) -> Bool {
        /// The word is same as the string that combined by the characters on some path.
        if index == word.count {
            return true
        }
        if row < 0 || col < 0 || row >= board.count || col >= board[0].count {
            return false
        }
        /// This position has been visited or it's character is not equal to
        if visited[row][col] || board[row][col] != word[index] {
            return false
        }
        visited[row][col] = true
        /// DFS the four direction of current position.
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
        /// After recursion back, reset the point to not visited.
        visited[row][col] = false
        return false
    }
}
