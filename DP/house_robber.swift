//
//  house_robber.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/house-robber/ (198)
 * Primary idea: DP[i] 代表 nums[0..i] 所有 house 能够打劫的最多钱财
 *
 * State Transition Equation: DP(i) = max{DP(i-1), DP(i-2) + num(i)}
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class HouseRobber {
    func rob(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.isEmpty ? 0 : nums[0]
        }
        
        var dp = Array(repeating: 0, count: nums.count)
        /// base case
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            /// dp[i-1] 代表不打劫 i 节点
            /// dp[i-2] + nums[i] 代表打劫 i 节点
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        }
        
        return dp[nums.count - 1]
    }
}
