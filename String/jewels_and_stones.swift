//
//  jewels_and_stones.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/jewels-and-stones/
 * Primary idea: 使用 Set 保存 jewels，遍历 stones 中的字符，如果在 jewels 中则 res 加一
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class JewelsAndStones {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jewels = J.reduce(into: [:]) { res, next in
            res[next] = true
        }
        
        var res = 0
        for s in S {
            if jewels[s] == true {
                res += 1
            }
        }
        
        return res
    }
    
    func numJewelsInStones1(_ J: String, _ S: String) -> Int {
        let jewels = Set(J); var res = 0
        for s in S {
            if jewels.contains(s) {
                res += 1
            }
        }
        
        return res
    }
}
