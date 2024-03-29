//
//  permutation_in_string.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/20.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/permutation-in-string/ (567)
 * Primary idea: 固定窗口大小的滑动窗口，和 Group Anagrams 几乎完全相同
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class CheckInclusion {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        /// hash 记录字符串 p 中字符及次数（也可以用 ascii 数组实现 hash）
        var hash = [Character: Int]()
        for char in s1 {
            hash[char, default: 0] += 1
        }
        
        let s = [Character](s2), t = [Character](s1)
        /// 左右双指针划分窗口 [left, right)，count 记录未满足的字符个数
        var left = 0, right = 0, count = t.count
        
        while right < s.count {
            /// 移动 right 指针，如果 s[right] 中的字符在 hash 中存在次数大等于 1，则 count 计数减 1（表示满足条件字符又增加一个）
            /// value >= 1 表示当前字符在字符串 p 中存在
            if let value = hash[s[right]], value >= 1 {
                count -= 1
            }
            hash[s[right], default: 0] -= 1
            right += 1
            
            /// 当 count = 0，表示已发现一个 p 的一种组合子串
            /// 窗口的 left 指针就是该子串的起始索引
            if count == 0 {
                return true
            }
            
            /// 当窗口大小和 p 长度一样时，移动 left 指针缩小窗口，以发现下一个匹配项
            if right - left == t.count {
                /// s[left] 字符就在原始的 hash 中，即在 p 中，其次数不会小于 0
                if let value = hash[s[left]], value >= 0 {
                    /// 由于将 left 踢出窗口，所以 count 计数需要加 1，表示满足条件字符又减少一个
                    count += 1
                }

                hash[s[left], default: 0] += 1
                left += 1
            }
        }
        
        return false
    }
    
    func checkInclusionAscii(_ s1: String, _ s2: String) -> Bool {
        /// hash 记录字符串 p 中字符及次数，这里用 ascii 数组实现 hash
        var hash = Array(repeating: 0, count: 256)
        for char in s1 {
            hash[Int(char.asciiValue!)] += 1
        }
        
        let s = [Character](s2), t = [Character](s1)
        /// 左右双指针划分窗口 [left, right)，count 记录未满足的字符个数
        var left = 0, right = 0, count = t.count
        
        while right < s.count {
            /// 移动 right 指针，如果 s[right] 中的字符在 hash 中存在次数大等于 1，则 count 计数减 1（表示满足条件字符又增加一个）
            /// value >= 1 表示当前字符在字符串 p 中存在
            let index = Int(s[right].asciiValue!)
            if hash[index] >= 1 {
                count -= 1
            }
            
            hash[index] -= 1
            right += 1
            
            /// 当 count = 0，表示已发现一个 p 的一种组合子串
            /// 窗口的 left 指针就是该子串的起始索引
            if count == 0 {
                return true
            }
            
            /// 当窗口大小和 p 长度一样时，移动 left 指针缩小窗口，以发现下一个匹配项
            if right - left == t.count {
                /// s[left] 字符就在原始的 hash 中，即在 p 中，其次数不会小于 0
                let index = Int(s[left].asciiValue!)
                if hash[index] >= 0 {
                    /// 由于将 left 踢出窗口，所以 count 计数需要加 1，表示满足条件字符又减少一个
                    count += 1
                }
                /// left 对应字符回到 hash 中，表示重新成为可用字符
                hash[index] += 1
                left += 1
            }
        }
        
        return false
    }
}
