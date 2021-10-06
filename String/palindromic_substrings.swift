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
 * Primary idea: 遍历字符串，从当前索引向两端拓展，计算回文串的数量
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
            /// 回文子串长度是奇数，从 i 向两边拓展
            palindromic(&s, &res, i, i)
            /// 回文子串长度是偶数，从 [i, i+1] 向两边拓展
            palindromic(&s, &res, i, i + 1)
        }
        
        return res
    }
    
    private func palindromic(_ s: inout [Character], _ res: inout Int, _ l: Int, _ r: Int) {
        var l = l, r = r
        while l >= 0 && r < s.count && s[l] == s[r] {
            l -= 1
            r += 1
            res += 1
        }
    }
}
