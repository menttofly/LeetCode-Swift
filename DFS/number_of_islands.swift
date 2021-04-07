//
//  number_of_islands.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/number-of-islands/
 * Primary idea: DFS a land's adjacent to make all land become water, then we find a island and make it sink.
 *
 * Time Complexity: O(mn), Space Complexity: O(1)
 */
class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty {
            return 0
        }
        var grid = grid, count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    dfs(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }
    
    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int) -> Void {
        if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count {
            return
        }
        if grid[row][col] != "1" {
            return
        }
        grid[row][col] = "0"
        dfs(&grid, row - 1, col)
        dfs(&grid, row + 1, col)
        dfs(&grid, row, col - 1)
        dfs(&grid, row, col + 1)
    }
}
