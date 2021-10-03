//
//  counting_bits.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/counting-bits/
 * Primary idea: Find it's mathematical law.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class CountingBits {
    func countBits(_ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n + 1)
        
        for i in 0...n {
            if i % 2 == 0 {
                /// i 是 偶数，比特位中 1 的数量和 res[i / 2] 相同
                res[i] = res[i / 2]
            } else {
                /// i 是奇数，比特位中 1 的数量和 res[i / 2] + 1 相同
                res[i] = res[i / 2] + 1
            }
        }
        
        return res
    }
}
