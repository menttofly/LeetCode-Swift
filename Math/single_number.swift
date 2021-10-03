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
 * Primary idea: A XOR A = 0，出现两次的异或操作后被消除，剩下的就是出现一次的元素
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
        
        return res
    }
}
