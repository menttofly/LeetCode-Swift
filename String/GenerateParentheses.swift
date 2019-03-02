//
//  GenerateParentheses.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/generate-parentheses/
 * Primary idea: Add brackets when it will remain a valid sequence through backtracking. Drawing the process of recursion to understand.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class GenerateParentheses {
    func generateParenthesis(_ n: Int) -> [String] {
        var combinations = [String]()
        backtracking(n, 0, 0, "", &combinations)
        return combinations
    }
    
    private func backtracking(_ max: Int, _ open: Int, _ close: Int, _ result: String, _ combinations: inout [String]) -> Void {
        if result.count >= max * 2 {
            combinations.append(result)
            return
        }
        if open < max {
            backtracking(max, open + 1, close, result + "(", &combinations)
        }
        if close < open {
            backtracking(max, open, close + 1, result + ")", &combinations)
        }
    }
}
