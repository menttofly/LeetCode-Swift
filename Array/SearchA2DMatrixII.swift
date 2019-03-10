//
//  SearchA2DMatrixII.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/search-a-2d-matrix-ii/
 * Primary idea: Search target from top-right, and exclude row or colume by compareing current value with target.
 *
 * Time Complexity: O(m+n), Space Complexity: O(1)
 */
class SearchA2DMatrixII {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }
        var row = 0, col = matrix[0].count - 1
        while row < matrix.count && col >= 0 {
            if target == matrix[row][col] {
                return true
            } else if target > matrix[row][col] {
                /// Exclude current row.
                row += 1
            } else {
                /// Exclude current colume.
                col -= 1
            }
        }
        return false
    }
}
