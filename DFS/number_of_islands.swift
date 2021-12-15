//
//  number_of_islands.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/number-of-islands/ (200)
 * Primary idea: 对于数字1，通过 dfs 将 4 个方向 1 都置为 0（将 land 变成 water），直到遇到 0 停止，一次 dfs 结束代表发现一个岛
 *
 * Time Complexity: O(mn), Space Complexity: O(1)
 */
class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        
        var grid = grid, islands = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                /// 发现一块 land
                if grid[i][j] == "1" {
                    /// 通过 dfs 将所有接壤的 land(1) 变成 water(0)，直到遇到 water
                    dfs(&grid, i, j)
                    /// island 数量加一
                    islands += 1
                }
            }
        }
        
        return islands
    }
    
    /// 将矩阵中当前位置 (row, col) 接邻的 land 变成 water
    /// - Parameters:
    ///   - grid: 矩阵
    ///   - row: 行
    ///   - col: 列
    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count {
            return
        }
        /// 遇到 water，结束 dfs 返回
        if grid[row][col] == "0" {
            return
        }
        /// 将 land 变成 water
        grid[row][col] = "0"
        /// 上、下、左、右，四个方向遍历
        dfs(&grid, row - 1, col)
        dfs(&grid, row + 1, col)
        dfs(&grid, row, col - 1)
        dfs(&grid, row, col + 1)
    }
}
