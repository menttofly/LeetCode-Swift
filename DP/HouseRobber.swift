//
//  HouseRobber.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/house-robber/
 * Primary idea: DP[i] means the maximum sum that can be formed by the number of neighbors when reach i position.
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
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            /// dp[i - 1] means don't rob house at i.
            /// dp[i - 2] + nums[i] rob house at i.
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        }
        return dp[nums.count - 1]
    }
}
