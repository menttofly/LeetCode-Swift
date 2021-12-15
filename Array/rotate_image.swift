//
//  rotate_image.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/rotate-image/ (48)
 * Primary idea: 以左上角到到右下角为轴对称线，将左下方元素交换到右上方，再将每行数字翻转得其逆序
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */
class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        /// Let's swap matrix lower left corner to upper right corner first.
        /// 将矩阵中轴对称线下方的交换到上方
        for i in 0..<matrix.count {
            for j in 0..<i {
                swap(&matrix, i, j)
            }
        }
        /// Then reverse matrix every single line.
        for index in 0..<matrix.count {
            var line = matrix[index]
            line.reverse()
            matrix[index] = line
        }
    }
    
    /// maxtrix[i][j] <-> maxtrix[j][i]
    private func swap(_ matrix: inout [[Int]], _ row: Int, _ column: Int) {
        let temp = matrix[row][column]
        matrix[row][column] = matrix[column][row]
        matrix[column][row] = temp
    }
}
