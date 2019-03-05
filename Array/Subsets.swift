//
//  Subsets.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/5.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subsets/
 * Primary idea: Make decision on each index recusively, include or exclude element to a subset.
 *
 * Time Complexity: O(2^n), Space Complexity: O(2^n)
 */
class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()  /// Sort is not required.
        var combinations = [[Int]]()
        backtracking(&combinations, &nums, [], 0)
        return combinations
    }
    
    private func backtracking(_ combinations: inout [[Int]], _ nums: inout [Int], _ result: [Int], _ start: Int) -> Void {
        var result = result
        combinations.append(result)
        for index in start..<nums.count {
            /// Include the current element to previous subset.
            result.append(nums[index])
            backtracking(&combinations, &nums, result, index + 1)
            /// Exclude the element and go to next loop
            result.removeLast()
        }
    }
}
