//
//  CountingBits.swift
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
    func countBits(_ num: Int) -> [Int] {
        if num == 0 {
            return [0]
        }
        var results = [0]
        for i in 1...num {
            if i % 2 == 0 {
                /// The number is even, it's bits 1's number equal to results[i / 2]
                results.append(results[i / 2])
            } else {
                /// The number is odd, it's bits 1's number equal to results[i / 2] + 1
                results.append(results[i / 2] + 1)
            }
        }
        return results
    }
}
