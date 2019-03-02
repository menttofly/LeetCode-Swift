//
//  ValidParentheses.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/valid-parentheses/
 * Primary idea: Push character into stack if it's open brackets, and pop element when meet close brackets while traversing string.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        let pattern: [Character: Character] = ["(":")", "[":"]", "{":"}"]
        let characters = [Character](s)
        var stack = [Character]()
        
        for char in characters {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            }
            if char == ")" || char == "]" || char == "}" {
                if let top = stack.popLast(), pattern[top] == char {
                    continue
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
