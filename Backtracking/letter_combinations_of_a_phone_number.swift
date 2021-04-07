//
//  letter_combinations_of_a_phone_number.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/2/25.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 * Primary idea: Backtracking to find all solutions by exploring all potential candidates.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LetterCombinationsOfAPhoneNumber {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        let dict: [Character: String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"]
        
        /// Get all letters match to the digits
        var letters: [String] = []
        for digit in digits {
            if let s = dict[digit] {
                letters.append(s)
            }
        }
        var combinations: [String] = []
        backtracking(letters, 0, "", &combinations)
        return combinations
    }
    
    private func backtracking(_ letters: [String], _ index: Int, _ result: String, _ combinations: inout [String]) -> Void {
        if index >= letters.count {
            combinations.append(result)
            return
        }
        for letter in letters[index] {
            backtracking(letters, index + 1, result + String(letter), &combinations)
        }
    }
}
