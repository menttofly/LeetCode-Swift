//
//  decode_string.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/decode-string/ (394)
 * Primary idea: Decode substring behind "[" recursively.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class DecodeString {
    func decodeString(_ s: String) -> String {
        var index = 0, s = [Character](s)
        return decode(s, &index)
    }
    
    /// Decode substring after "[" recursively.
    ///
    /// - Parameters:
    ///   - s: origin string.
    ///   - index: start index after "[".
    /// - Returns: decoded substring.
    private func decode(_ s: [Character], _ index: inout Int) -> String {
        var substr = ""   /// Decoded substring.
        while index < s.count && s[index] != "]" {
            var character = String(s[index])
            /// If not a digit, then put it into decoded substring.
            if !character.isDigit {
                substr += character
                index += 1
            } else {
                /// "123" means repeat 123 times, here we get it's repeat count.
                var count = 0
                while character.isDigit {
                    count = count * 10 + character.digitVal
                    index += 1
                    character = String(s[index])
                }
                index += 1   // Meet '['
                let tail = decode(s, &index)
                index += 1   // Meet ']'
                
                /// Let tail repeat 'count' times.
                for _ in 0..<count {
                    substr += tail
                }
            }
        }
        return substr
    }
}


fileprivate extension String {
    var isDigit: Bool {
        return Int(self) != nil ? true : false
    }
    var digitVal: Int {
        if let val = Int(self) {
            return val
        } else {
            return 0
        }
    }
}
