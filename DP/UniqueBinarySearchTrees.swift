//
//  UniqueBinarySearchTrees.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/6.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/unique-binary-search-trees/
 * Primary idea: DP(i) represent the number of unique BST, and the root value can be any number in (1...n).
 *
 * State Transition Equation: DP(i) = sum{DP(j, i-j-1), j in [0..<i]}
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 */
class UniqueBinarySearchTrees {
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...n {  /// The number of tree nodes.
            for j in 0..<i {  /// The number set as root node. (j + 1)
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
}
