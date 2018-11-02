//
//  StringToInteger.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/string-to-integer-atoi/
 * Primary idea: Traversing string, trim leading space, judge positive and negative, judge character is digit
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class StringToInteger {
    func myAtoi(_ str: String) -> Int {
        let chs = [Character](str)
        var sign: Int64 = 1, index = 0
        /// Trim space
        while index < chs.count && chs[index] == " " {
            index += 1
        }
        if index == chs.count {
            return 0
        }
        if chs[index] == "-" {
            sign = -1
            index += 1
        } else if chs[index] == "+" {
            index += 1
        }
        var val: Int64 = 0
        var result: Int64 = 0
        let ascii0 = Character("0").ascii
        
        while index < chs.count && chs[index].digit {
            val = val * 10 + Int64(chs[index].ascii - ascii0)
            result = sign * val
            if result >= Int32.max {
                return Int(Int32.max)
            }
            if result <= Int32.min {
                return Int(Int32.min)
            }
            index += 1
        }
        return Int(result)
    }
}

fileprivate extension Character {
    /// Get the character's ASCII value
    var ascii: Int {
        let unicode = String(self).utf8
        return Int(unicode[unicode.startIndex])
    }
    /// Judge whether character is a digit or not
    var digit: Bool {
        return isdigit(Int32(self.ascii)) != 0
    }
}
