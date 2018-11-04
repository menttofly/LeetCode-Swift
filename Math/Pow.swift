//
//  Pow.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/17.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/powx-n/
 * Primary idea: Law of power operation
 *
 * Time Complexity: O(log(n)), Space Complexity: O(1)
 */
class Pow {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        if n == 1 {
            return x
        }
        if n < 0 {
            if n == Int.min {   /// Int.max can't hold -Int.min
                return 1 / (x * myPow(x, Int.max))
            }
            return 1 / myPow(x, -n)
        }
        if n % 2 == 1 {
            return x * myPow(x * x, n >> 1)
        } else {
            return myPow(x * x, n >> 1)
        }
    }
}
