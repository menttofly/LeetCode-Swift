//
//  jump_game.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/jump-game/
 * Primary idea: Only interested to the furthest position we can reach, so use greedy algorithm.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        var furthest = 0
        for (index, num) in nums.enumerated() {
            /// If index > furthest, that means can't reach the current index position.
            if index > furthest || furthest >= nums.count - 1 {
                break
            }
            /// (index + num) means the furthest position jump from current position.
            furthest = max(furthest, index + num)
        }
        return furthest >= nums.count - 1
    }
}


/**
 * Primary idea: Knowing the fact that we can jump over the last position, so assume DP[i] represent the left step when arrive position i.
 * State Transition Equation: DP[i] = max(DP[i-1], num[i-1]) - 1
 *
 * Note: It's decided by previous position's left step and maximum jump length at position i-1.
 * Time Complexity: O(n), Space Complexity: O(n)
 */
fileprivate class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var dp = Array(repeating: 0, count: nums.count)
        for index in 1..<nums.count {
            dp[index] = max(dp[index - 1], nums[index - 1]) - 1
            if dp[index] < 0 {
                return false
            }
        }
        return true
    }
}
