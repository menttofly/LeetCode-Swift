//
//  number_of_1_bits.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/31.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/number-of-1-bits/
 * Primary idea: n & n - 1 可以消除二进制位中的最后一个 1，有多少个 1 就可以进行多少次 & 操作
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class HammingWeight {
    func hammingWeight(_ n: Int) -> Int {
        var res = 0, n = n
        while n != 0 {
            n &= n - 1
            res += 1
        }
        
        return res
    }
}
