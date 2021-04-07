//
//  coin_change.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/4.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/coin-change/
 * Primary idea: DP(i) represent minimum number of coins needed to make change for amount i using coin denominations [c0...cn-1]
 *
 * State Transition Equation: DP[i] = min{DP(i-c1]), DP(i-c2), ...} + 1
 *
 * Time Complexity: O(n*c), Space Complexity: O(n)
 */
class CoinChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for j in 0..<coins.count {
                if coins[j] <= i, dp[i - coins[j]] + 1 < dp[i] {
                    dp[i] = dp[i - coins[j]] + 1
                }
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}
