//
//  JewelsAndStones.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/jewels-and-stones/
 * Primary idea: Classic hash table solution.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class JewelsAndStones {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var dict = [Character: Bool]()
        for j in J {
            dict[j] = true
        }
        var res = 0
        for s in S {
            if let _ = dict[s] {
                res += 1
            }
        }
        return res
    }
}
