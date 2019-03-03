//
//  CombinationSum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/combination-sum/
 * Primary idea: Backtracking to find all matched combinations and filter the same case.
 *
 * Time Complexity: O(n^3), Space Complexity: O(n^2)
 */
class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations = [[Int]]()
        backtracking(candidates, target, [], 0, &combinations)
        return combinations
    }
    
    /// In order to remove the duplication case, we use 'start' parameter to make sure combined with the number after current(start).
    private func backtracking(_ candidates: [Int], _ target: Int, _ result: [Int], _ start: Int, _ combinations: inout [[Int]]) -> Void {
        if target == 0 {
            combinations.append(result)
            return
        }
        if target < 0 {
            return
        }
        for index in start..<candidates.count {
            var result = result
            result.append(candidates[index])
            backtracking(candidates, target - candidates[index], result, index, &combinations)
        }
    }
}
