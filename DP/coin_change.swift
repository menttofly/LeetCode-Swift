//
//  coin_change.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/4.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/coin-change/ (322)
 * Primary idea: DP(i) 代表使用 coins 数组凑成价值 i 最少需要的硬币数量
 *
 * State Transition Equation: DP[i] = min{DP(i-c1]), DP(i-c2), ...} + 1
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class CoinChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        
        /// amount + 1 相当于正无穷大，因为凑成价值 amount 最多也就要 amount 枚硬币，即全使用面值为 1 的硬币
        var dp = Array(repeating: amount + 1, count: amount + 1)
        /// base case
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
