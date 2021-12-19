//
//  jump_game.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/jump-game/ (55)
 * Primary idea: 贪心算法，每次计算当前位置可跳跃的最远距离，并和之前的 furthest 对比
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        /// 能跳跃的最远距离
        var furthest = 0
        
        for (index, num) in nums.enumerated() {
            /// 如果 furthest < index，表示无法到达当前 index 位置
            if furthest < index || furthest >= nums.count - 1 {
                break
            }
            /// index + num 代表从当前位置 index 能跳跃的最远距离
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
class JumpGame2 {
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
