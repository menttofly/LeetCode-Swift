//
//  HammingDistance.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/hamming-distance/
 * Primary idea: Bit XOR operation.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class HammingDistance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var res = 0
        for i in 0..<32 {
            /// At i position it's bit value is 1.
            let bit = 1<<i
            if (x & bit) ^ (y & bit) > 0 {
                res += 1
            }
        }
        return res
    }
    
    /// Use this to count number of 1 in bit value.
    func countBitOne(_ x: Int, _ y: Int) -> Int {
        var res = 0, xor = x ^ y
        while xor > 0 {
            res += 1
            xor &= xor - 1
        }
        return res
    }
}
