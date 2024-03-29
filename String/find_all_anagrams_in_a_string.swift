//
//  find_all_anagrams_in_a_string.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/13.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-all-anagrams-in-a-string/ (438)
 * Primary idea: 哈希表记录待满足的字符串，及次数信息，并使用固定窗口大小滑动，及左右指针间距为窗口大小时，left 指针就需要滑动
 *
 * Note: labuladong 的通用框架适合窗口大小不固定的问题，本题属于固定窗口，所以不用内层循环而是 if 判断窗口大小
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class FindAllAnagramsInAString {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        /// hash 记录字符串 p 中字符及次数。ascii 字符有 256 个，可以简单用一个数组实现哈希
        var hash = [Character: Int]()
        for char in p {
            hash[char, default: 0] += 1
        }
        
        /// 将字符串转为字符数组访问可以大幅提升性能，否则直接访问 p 的 count 属性在 lt 上效率极低！！！
        let s = [Character](s), p = [Character](p)
        /// 左右双指针划分窗口 [left, right)，count 记录未满足的字符个数
        var left = 0, right = 0, count = p.count
        var res = [Int]()
        
        while right < s.count {
            /// 移动 right 指针，如果 s[right] 中的字符在 hash 中存在次数大等于 1，则 count 计数减 1（表示满足条件字符又增加一个）
            /// value >= 1 表示当前字符在字符串 p 中存在
            if let value = hash[s[right]], value >= 1 {
                count -= 1
            }
            
            /// 可能使在 p 串中的字符次数小于 1，但是后面 left 指针移动会重新增长次数
            /// < 0 时代表窗口中的字符已经够多，超出需要的
            hash[s[right], default: 0] -= 1
            right += 1
            
            /// 当 count = 0，表示已发现一个 p 的同母异位词子串
            /// 窗口的 left 指针就是该子串的起始索引
            if count == 0 {
                res.append(left)
            }
            
            /// 当窗口大小和 p 长度一样时，移动 left 指针缩小窗口，以发现下一个匹配项
            if right - left == p.count {
                /// 如果 value >= 0，则表示 s[left] 字符就在原始的 hash 中，即在 p 中，因为其次数不会小于 0
                if let value = hash[s[left]], value >= 0 {
                    /// 此时 left 对应字符是需要的字符，因为在 p 串中
                    /// 由于将 left 踢出窗口，所以 count 计数需要加 1，表示满足条件字符又减少一个
                    count += 1
                }

                hash[s[left], default: 0] += 1
                left += 1
            }
        }
        
        return res
    }
    
    func findAnagramsAscii(_ s: String, _ p: String) -> [Int] {
        /// ascii 字符有 256 个，可以简单用一个数组实现 hash
        var hash = Array(repeating: 0, count: 256)
        for char in p {
            hash[Int(char.asciiValue!)] += 1
        }
        
        /// 将字符串转为字符数组访问可以大幅提升性能，否则直接访问 p 的 count 属性在 lt 上效率极低！！！
        let s = [Character](s), p = [Character](p)
        /// 左右双指针划分窗口 [left, right)，count 记录未满足的字符个数
        var left = 0, right = 0, count = p.count
        var res = [Int]()
        
        while right < s.count {
            /// 移动 right 指针，如果 s[right] 中的字符在 hash 中存在次数大等于 1，则 count 计数减 1（表示满足条件字符又增加一个）
            /// value >= 1 表示当前字符在字符串 p 中存在
            let index = Int(s[right].asciiValue!)
            if hash[index] >= 1 {
                count -= 1
            }
            
            /// 可能使在 p 串中的字符次数小于 1，但是后面 left 指针移动会重新增长次数
            /// < 0 时代表窗口中的字符已经够多，超出需要的
            hash[index] -= 1
            right += 1
            
            /// 当 count = 0，表示已发现一个 p 的同母异位词子串
            /// 窗口的 left 指针就是该子串的起始索引
            if count == 0 {
                res.append(left)
            }
            
            /// 当窗口大小和 p 长度一样时，移动 left 指针缩小窗口，以发现下一个匹配项
            if right - left == p.count {
                /// 如果 value >= 0，则表示 s[left] 字符就在原始的 hash 中，即在 p 中，因为其次数不会小于 0
                let index = Int(s[left].asciiValue!)
                if hash[index] >= 0 {
                    /// 此时 left 对应字符是需要的字符，因为在 p 串中
                    /// 由于将 left 踢出窗口，所以 count 计数需要加 1，表示满足条件字符又减少一个
                    count += 1
                }
                /// left 对应字符回到 hash 中，表示重新成为可用字符
                hash[index] += 1
                left += 1
            }
        }
        
        return res
    }
}

fileprivate extension Character {
    var asciiCode: Int {
        let utf8 = String(self).utf8
        return Int(utf8[utf8.startIndex])
    }
}
