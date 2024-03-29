//
//  11_旋转数组的最小数字.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class RotatedArrayMinNumber {
    func minArray(_ numbers: [Int]) -> Int {
        if (numbers.count == 1) { return numbers[0] }

        var low = 0, high = numbers.count - 1
        while low < high {
            let mid = (low + high) / 2
            if numbers[mid] > numbers[high] {
                /// mid 索引处的值比 high 大，说明 high 在旋转的部分
                low = mid + 1
            } else if numbers[mid] < numbers[high] {
                /// mid 可能在未旋转部分，或者旋转部分
                high = mid
            } else {
                high -= 1
            }
        }
        
        return numbers[low]
    }
}
