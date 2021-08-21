//
//  find_all_anagrams_in_a_string.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/13.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-all-anagrams-in-a-string/
 * Primary idea: 哈希表记录待满足的字符串，及次数信息，并使用固定窗口大小滑动，及左右指针间距为窗口大小时，left 指针就需要滑动
 * Note: labuladong 的通用框架适合窗口大小不固定的问题，本题属于固定窗口，所以不用内层循环而是 if 判断窗口大小
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class FindAllAnagramsInAString {
    func findAnagrams1(_ s: String, _ p: String) -> [Int] {
        /// hash 记录字符串 p 中字符及次数
        var hash = [Character: Int]()
        for char in [Character](p) {
            hash[char, default: 0] += 1
        }
        
        let s = [Character](s)
        /// 左右双指针划分窗口 [left, right)，count 记录未满足的字符个数
        var left = 0, right = 0, count = p.count
        var res = [Int]()
        
        while right < s.count {
            /// 移动 right 指针，如果 s[right] 中的字符在 hash 中存在次数大等于 1，则 count 计数减 1（表示满足条件字符又增加一个）
            /// value >= 1 表示当前字符在字符串 p 中存在
            if let value = hash[s[right]], value >= 1 {
                count -= 1
            }
            hash[s[right], default: 0] -= 1
            right += 1
            
            /// 当 count = 0，表示已发现一个 p 的同母异位词子串
            /// 窗口的 left 指针就是该子串的起始索引
            if count == 0 {
                res.append(left)
            }
            
            /// 当窗口大小和 p 长度一样时，移动 left 指针缩小窗口，以发现下一个匹配项
            if right - left == p.count {
                /// s[left] 字符就在原始的 hash 中，即在 p 中，其次数不会小于 0
                if let value = hash[s[left]], value >= 0 {
                    /// 由于将 left 踢出窗口，所以 count 计数需要加 1，表示满足条件字符又减少一个
                    count += 1
                }

                hash[s[left], default: 0] += 1
                left += 1
            }
        }
        
        return res
    }
}
