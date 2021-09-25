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
     * Primary idea: DP[i][w] 表示对于前 i 个硬币，当背包容量为 w 时，可以凑成的组合数量（完全背包，硬币可重复选择）
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
        dp[0][0] = 1
        
        for i in stride(from: 1, through: len, by: 1) {
            /// base case，背包容量为 0 时，只有一种凑法（什么都不放）
            dp[i][0] = 1
            
            for w in 1...amount {
                if w < coins[i - 1] {
                    /// 背包空间不足，只能选择不放入背包
                    dp[i][w] = dp[i - 1][w]
                } else {
                    /// 第 i 个硬币 coin[i-1] 选择不放入背包，则继承 dp[i - 1][w] 的结果，用前 i-1 枚硬币凑出价值 w
                    /// 第 i 个硬币选择放入背包，则更新背包容量。同时硬币可重复选择，所以是 dp[i][w - coins[i - 1]]
                    /// 可凑成 w 的结果为两种情况之和
                    dp[i][w] = dp[i - 1][w] + dp[i][w - coins[i - 1]]
                }
            }
        }
        
        return dp[len][amount]
    }
    
    /**
     * Question Link: https://leetcode.com/problems/coin-change-2/
     * Primary idea: DP[w] 表示对于 coins 数组中的的部分元素，当背包容量为 w 时，可以凑成的组合数量
     * Note: 状态压缩版，从二维数组矩阵形状理解，dp[i][w] 需要的状态都是上一行 dp[i-1][..] 中的，再之前的都不会再使用到，所以使用一维数组记录行
     *
     * Time Complexity: O(n^2), Space Complexity: O(n)
     */
    func changeCompressSpace(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else {
            return 1
        }
        
        var dp = Array(repeating: 0, count: amount + 1)
        /// base case，背包空间为 0，有一种装法（什么都不放）
        dp[0] = 1
        
        /// 使用 [0..coin] 之间的硬币
        for coin in coins {
            /// coin...amount 区间有可能 coin(下界) > amount(上界) 导致 crash，所以应该用 stride 可以避免闪退
            /// 因为是完全背包问题，硬币可重复使用，正向遍历即可，不需要像 01 背包内层需要反向遍历避免上一行结果被冲掉
            for w in stride(from: coin, through: amount, by: 1) {
                dp[w] += dp[w - coin]
            }
        }
        
        return dp[amount]
    }
}
