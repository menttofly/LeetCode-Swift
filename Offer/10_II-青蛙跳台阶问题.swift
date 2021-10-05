//
//  10_II-青蛙跳台阶问题.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class JumpNumWays {
    func numWays(_ n: Int) -> Int {
        if (n == 0) { return 1 }
        if (n == 1) { return 1 }

        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1; dp[1] = 1
        for i in 2...n {
            dp[i] = (dp[i - 1] + dp[i - 2]) % 1000000007
        }
        
        return dp[n]
    }
}
