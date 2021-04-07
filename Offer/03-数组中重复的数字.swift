//
//  数组中重复的数字.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/3/1.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class FindRepeatNumber {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var hash = [Int: Int](), res = 0
        for num in nums {
            if let _ = hash[num] {
                res = num
                break
            } else {
                hash[num] = 1
            }
        }
        return res
    }
}
