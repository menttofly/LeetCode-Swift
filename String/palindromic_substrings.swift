//
//  palindromic_substrings.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/palindromic-substrings/
 * Primary idea: Expand character around center to both sides.
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class PalindromicSubstrings {
    func countSubstrings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var res = 0, s = [Character](s)
        for i in 0..<s.count {
            /// Palindromic substring length is odd.
            palindromic(&s, &res, i, i)
            /// Palindromic substring length is even.
            palindromic(&s, &res, i, i + 1)
        }
        return res
    }
    
    private func palindromic(_ s: inout [Character], _ res: inout Int, _ l: Int, _ r: Int) -> Void {
        var l = l, r = r
        while l >= 0 && r < s.count && s[l] == s[r] {
            l -= 1
            r += 1
            res += 1
        }
    }
}
