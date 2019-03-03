//
//  Permutations.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/permutations/
 * Primary idea: Backtracking to find all matched combinations.
 *
 * Time Complexity: O(n!), Space Complexity: O(n * n!)
 */
class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var numbers = nums
        var combinations = [[Int]]()
        backtracking(&combinations, &numbers, 0)
        return combinations
    }
    
    /// Start means the beginning index of array in next recursion.
    private func backtracking(_ combinations: inout [[Int]], _ nums: inout [Int], _ start: Int) -> Void {
        if start >= nums.count {
            combinations.append(nums)
            return
        }
        for index in start..<nums.count {
            nums.swapAt(start, index)
            backtracking(&combinations, &nums, start + 1)
            /// Reset array's order to original status.
            nums.swapAt(start, index)
        }
    }
}
