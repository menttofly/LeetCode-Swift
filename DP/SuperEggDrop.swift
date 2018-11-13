//
//  SuperEggDrop.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/13.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/super-egg-drop/
 * Primary idea: DP(K, N) means the minimum number of moves that you need to know with certainty what F is.
 *
 * State Transition Equation: DP(K, N) = min(1 + max(DP(K - 1, N - 1), DP{K, N - x))), x in [1...N]
 *
 * Time Complexity: O(K * N * N), Space Complexity: O(K * N)
 */
class SuperEggDrop {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        if K < 2 || N < 2 {
            return N
        }
        var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: K + 1)
        for n in 1...N {
            dp[1][n] = n
        }
        for k in 1...K {
            dp[k][1] = 1
        }
        for k in 2...K {
            for n in 2...N {
                var result = Int.max
                /// Drop egg from floor x
                for x in 1...n {
                    let broken = dp[k - 1][x - 1]
                    let unbroken = dp[k][n - x]
                    let maxtry = max(broken, unbroken) + 1
                    result = min(maxtry, result)
                }
                dp[k][n] = result
            }
        }
        return dp[K][N]
    }
}
