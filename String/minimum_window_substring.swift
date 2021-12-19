//
//  minimum_window_substring.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/20.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/minimum-window-substring/ (76)
 * Primary idea: 滑动窗口
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class MinWindow {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = [Character](s)
        var window = [Character: Int]()
        var target = [Character: Int]()
        for c in t {
            target[c] = (target[c] ?? 0) + 1
        }
        
        var left = 0, right = 0
        /// valid 记录已满足条件的字符个数
        var valid = 0, start = 0, len = Int.max
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
            
            while valid == target.count {
                if right - left < len {
                    start = left
                    len = right - start
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
        
        return len == Int.max ? "" : String(s[start..<start + len])
    }
}
