//
//  ReverseInteger.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-integer/
 * Primary idea: Using x % 10 to get the current reversely number, and use x / 10 to cut down the visited tail
 *
 * Note: Int64 to maintain the value that possibly overflow in Int32
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var num = Int64(x)
        var val: Int64 = 0
        while num != 0 {
            val = val * 10 + (num % 10)
            num /= 10
        }
        return (val > Int32.max || val < Int32.min) ? 0 : Int(val)
    }
}

/**
 * Primary idea: Using x % 10 to get the current reversely number, and use x / 10 to cut down the visited tail
 * Note: Using '&*' and '&+' to allow overflow in Int32, then judge the result / 10 to see if it is still the original value
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
fileprivate class Solution {
    func reverse(_ x: Int) -> Int {
        var num = Int32(x)
        var val: Int32 = 0
        while num != 0 {
            let result = val &* 10 &+ (num % 10)
            if result / 10 != val {   /// a = b * 10, if a / 10 != b, a overflow
                return 0
            }
            val = result
            num /= 10
        }
        return Int(val)
    }
}




























