//
//  valid_parentheses.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/valid-parentheses/
 * Primary idea: 遇到开括号入栈，遇到闭括号时和栈顶开括号比较，若字典中开括号 key 对应的闭括号与当前一致，则有效继续比较全部字符
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        let pattern: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        let s = [Character](s)
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                if let top = stack.popLast(), pattern[top] == char {
                    continue
                } else {
                    return false
                }
            }
        }
        /// 最终栈空才代表 valid，单个字符如 '[' 不是 valid，且没有出栈行为栈不为空
        return stack.isEmpty
    }
}
