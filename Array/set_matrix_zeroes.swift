//
//  set_matrix_zeroes.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/7/13.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/set-matrix-zeroes/
 * Primary idea: 待补
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class SetMatrixZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.isEmpty || matrix[0].isEmpty {
            return
        }

        let row = matrix.count, col = matrix[0].count
        var firstColZero = false, firstRowZero = false
        /// 记录第一列中是否存在 0
        for i in 0..<row {
            if matrix[i][0] == 0 { firstColZero = true }
        }
        /// 记录第一行中是否存在 0
        for j in 0..<col {
            if matrix[0][j] == 0 { firstRowZero = true }
        }

        for i in 1..<row {
            for j in 1..<col {
                /// 如果 matrix[i][j] 为零
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0  /// 更新第一列当前行，代表当前行存在 0
                    matrix[0][j] = 0  /// 更新第一行当前列，代表当前列存在 0
                }
            }
        }
        /// 从第一行第一列开始遍历，因为第一列和第一行用来记录行列中是否存在 0
        for i in 1..<row {
            for j in 1..<col {
                /// 如果当前行或者当前列存在 0，则将 matrix[i][j] 设置为 0
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        /// 如果第一列存在 0，将该列全部置 0
        if firstColZero {
            for i in 0..<row { matrix[i][0] = 0 }
        }
        /// 如果第一行存在 0，将该行全部置 0
        if firstRowZero {
            for j in 0..<col { matrix[0][j] = 0 }
        }
    }
}
