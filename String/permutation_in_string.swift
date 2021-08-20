//
//  permutation_in_string.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/20.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/permutation-in-string/
 * Primary idea: 滑动窗口
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class CheckInclusion {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s = [Character](s2)
        var window = [Character: Int]()
        var target = [Character: Int]()
        for c in [Character](s1) {
            target[c] = (target[c] ?? 0) + 1
        }
        
        var left = 0, right = 0
        /// valid 记录已满足条件的字符个数
        var valid = 0
        while right < s.count {
            let c = s[right]
            right += 1
            
            if let count = target[c] {
                window[c, default: 0] += 1
                /// 同一字符串出现多次时，只有窗口中该字符数等于目标字符串中该字符存在次数，才更新 valid
                if window[c] == count {
                    valid += 1
                }
            }
            
            while right - left >= s1.count {
                if valid == target.count {
                    return true
                }
                
                let c = s[left]
                left += 1
                if let count = target[c] {
                    if window[c] == count {
                        valid -= 1
                    }
                    window[c, default: 0] -= 1
                }
            }
        }
        
        return false
    }
}
