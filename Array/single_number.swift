//
//  single_number.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/single-number/
 * Primary idea: XOR bit manipulation.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
