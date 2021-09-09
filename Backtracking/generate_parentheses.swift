//
//  generate_parentheses.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/generate-parentheses/
 * Primary idea: Add brackets when it will remain a valid sequence through backtracking.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class GenerateParentheses {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        backtracking(n, 0, 0, "", &res)
        return res
    }
    
    /// 基于当前的开闭括号数量，组合新的 valid 括号，画出递归树分析
    /// - Parameters:
    ///   - pair: 括号对的数量
    ///   - open: 当前使用了几个 '('
    ///   - close: 当前使用了几个 ')'
    ///   - combine: 当前括号组合
    ///   - res: 结果集
    private func backtracking(_ pair: Int, _ open: Int, _ close: Int, _ combine: String, _ res: inout [String]) {
        /// base case
        /// 括号总数量达到 2n
        if combine.count >= pair * 2 {
            res.append(combine); return
        }
        /// 左括号数量比右括号少，不满足条件，剪枝
        if open < close {
            return
        }
        /// 尝试所有括号选项，即 '(' 和 ')'
        /// 选择放 '(' ，数量不超过 pair
        if open < pair {
            backtracking(pair, open + 1, close, combine + "(", &res)
        }
        /// 选择放 ')' ，数量不超过 pair
        if close < pair {
            backtracking(pair, open, close + 1, combine + ")", &res)
        }
    }
}
