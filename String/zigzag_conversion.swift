//
//  zigzag_conversion.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/1.
//  Copyright © 2018年 menttofly. All rights reserved.
//


import Foundation

/**
 * Question Link: https://leetcode.com/problems/zigzag-conversion/ (6)
 * Primary idea: Visit the characters by row in the same order as reading the Zig-Zag pattern line by line
 *
 * Note: Frequent access to s.count of string is very inefficient in Swift
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ZigZagConversion {
    func convert(_ s: String, _ numRows: Int) -> String {
        let len = s.count
        if numRows == 1 || len <= numRows {
            return s
        }
        let chs = [Character](s)
        var result = [Character]()
        let period = 2 * numRows - 2   /// Distance between character in the vertical direction
        for row in 0..<numRows {
            var index = row
            while index < len {
                result.append(chs[index])
                if row != 0 && row != numRows - 1 {
                    let distance = period - 2 * row   /// Distance between internal character and its adjacent characters on left
                    let position = index + distance
                    if position < len {
                        result.append(chs[position])
                    }
                }
                index += period
            }
        }
        return String(result)
    }
}
































