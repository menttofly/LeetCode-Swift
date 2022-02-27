//
//  letter_combinations_of_a_phone_number.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/2/25.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/ (17)
 * Primary idea: Backtracking to find all solutions by exploring all potential candidates.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class LetterCombinationsOfAPhoneNumber {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        
        /// 号码和字母的映射关系
        let dict: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
                                         "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        /// 得到数字代表的所有字母串，如 "abc" "def"
        var letters = [String]()
        for num in digits {
            letters.append(dict[num]!)
        }
        
        var res: [String] = []
        backtracking(letters, 0, "", &res)
        return res
    }
    
    /// 使用递归树，对于当前 level 对应的字母串，选择所有的字母。如 "abc" 中选取任一字母 'a' 'b' 'c'，统计所有的字母组合
    /// - Parameters:
    ///   - letters: 字母串数组
    ///   - index: 当前位置，或者树中的层，每层只能选择对应顺序的字母串
    ///   - combine: 当前组合的结果
    ///   - res: 答案
    private func backtracking(_ letters: [String], _ level: Int, _ combine: String, _ res: inout [String]) {
        /// 到达叶子节点
        if level >= letters.count {
            res.append(combine)
            return
        }
        /// 当前位置的字母串，尝试每种字母
        for letter in letters[level] {
            backtracking(letters, level + 1, combine + String(letter), &res)
        }
    }
}
