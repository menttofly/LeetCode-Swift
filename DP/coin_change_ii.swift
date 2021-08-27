//
//  coin_change_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/27.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class CoinChangeII {
    /**
     * Question Link: https://leetcode.com/problems/coin-change-2/
     * Primary idea: DP[i][w] 表示对于 i 个物品，当背包容量为 w 时，可以凑成的组合数量（完全背包，硬币可重复选择）
     *
     * Time Complexity: O(n^2), Space Complexity: O(n^2)
     */
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else {
            return 1
        }
        
        let len = coins.count
        var dp = Array(repeating: Array(repeating: 0, count: amount + 1), count: len + 1)
        /// base case，背包容量为 0 时，只有一种凑法（什么都不放）
        for i in 0...len {
            dp[i][0] = 1
        }
        
        for i in 1...len {
            for w in 1...amount {
                if w < coins[i - 1] {
                    /// 背包空间不足，只能选择不放入背包
                    dp[i][w] = dp[i - 1][w]
                } else {
                    /// 第 i 个硬币 coin[i-1] 选择不放入背包，则继承 dp[i - 1][w] 的结果
                    /// 第 i 个硬币选择放入背包，则更新背包容量。同时硬币可重复选择，所以是 dp[i][w - coins[i - 1]]
                    /// 可凑成 w 的结果为两种情况之和
                    dp[i][w] = dp[i - 1][w] + dp[i][w - coins[i - 1]]
                }
            }
        }
        
        return dp[len][amount]
    }
}
