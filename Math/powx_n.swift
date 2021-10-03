//
//  powx_n.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/17.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/powx-n/
 * Primary idea: 幂运算规则，逐个相乘需要 n 次，优化后只需 log(n) 次
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
            /// x^5 = x * (x^2)^2
            return x * myPow(x * x, n >> 1)
        } else {
            /// x^4 = (x^2)^2
            return myPow(x * x, n >> 1)
        }
    }
}
