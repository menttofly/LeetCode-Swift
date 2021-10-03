//
//  reverse_integer.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/reverse-integer/
 * Primary idea: 使用 x % 10 获取当前翻转的数字，使用 x / 10 取整减小数值
 *
 * Note: 使用 Int64 保存值避免 Int32 保存溢出的情况
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var val: Int64 = 0, num = Int64(x)
        while num != 0 {
            val = val * 10 + (num % 10)
            num /= 10
        }
        
        return (val > Int32.max || val < Int32.min) ? 0 : Int(val)
    }
}

/**
 * Primary idea: 使用 x % 10 获取当前翻转的数字，使用 x / 10 取整减小数值
 * Note: 使用 '&*' and '&+' 允许 Int32 溢出，再比较 val / 10 是否等于 res，不同则代表发生溢出
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ReverseInteger2 {
    func reverse(_ x: Int) -> Int {
        var res: Int32 = 0, num = Int32(x)
        while num != 0 {
            let val = res &* 10 &+ (num % 10)
            if val / 10 != res {   /// a = b * 10, if a / 10 != b, a overflow
                return 0
            }
            res = val
            num /= 10
        }
        
        return Int(res)
    }
}




























