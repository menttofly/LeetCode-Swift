//
//  04_二维数组中的查找.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/3/1.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

fileprivate class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }
        
        for row in matrix {
            guard target >= row[0] || target <= row[row.count - 1] else {
                continue
            }
            
            var low = 0, high = row.count - 1
            while low <= high {
                let mid = (low + high) / 2
                if row[mid] == target {
                    return true
                } else if row[mid] > target {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }
        
        return false
    }
}
