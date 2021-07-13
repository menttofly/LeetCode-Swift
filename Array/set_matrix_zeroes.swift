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
        for i in 0..<row {
            if matrix[i][0] == 0 { firstColZero = true }
        }
        for j in 0..<col {
            if matrix[0][j] == 0 { firstRowZero = true }
        }

        for i in 1..<row {
            for j in 1..<col {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<row {
            for j in 1..<col {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if firstColZero {
            for i in 0..<row { matrix[i][0] = 0 }
        }
        if firstRowZero {
            for j in 0..<col { matrix[0][j] = 0 }
        }
    }
}
