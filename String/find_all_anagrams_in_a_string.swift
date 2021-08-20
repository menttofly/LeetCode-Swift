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
 * Primary idea: Hash table and slide window.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class FindAllAnagramsInAString {
    /// 滑动窗口
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = [Character](s)
        var window = [Character: Int]()
        var target = [Character: Int]()
        for c in [Character](p) {
            target[c] = (target[c] ?? 0) + 1
        }
        
        var left = 0, right = 0
        /// valid 记录已满足条件的字符个数
        var valid = 0, res = [Int]()
        
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
            
            while right - left >= p.count {
                if valid == target.count {
                    res.append(left)
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
        
        return res
    }
    
    func findAnagrams1(_ s: String, _ p: String) -> [Int] {
        if s.isEmpty {
            return []
        }
        var hash = Array(repeating: 0, count: 256)
        for letter in p {
            hash[letter.ascii] += 1
        }
        let s = [Character](s), p = [Character](p)
        var left = 0, right = 0, count = p.count
        var result = [Int]()
        
        while right < s.count {
            let index = s[right].ascii
            if hash[index] >= 1 {
                count -= 1
            }
            hash[index] -= 1   /// 字符串p中存在的话对应index哈希值降为0，不存在则小于0
            right += 1
            
            /// When the count is down to 0, means we found the right anagram.
            /// Then add window's left to result list.
            if count == 0 {
                result.append(left)
            }
            
            /// If find the window's size equals to p, then we have to move left forward to find the new match window.
            if right - left == p.count {
                let leftIndex = s[left].ascii
                /// 原属于字符串p中的字符
                if hash[leftIndex] >= 0 {
                    count += 1
                }
                /// 把left对应的字符踢出窗口，所以重置哈希值
                hash[leftIndex] += 1
                left += 1
            }
        }
        return result
    }
}


fileprivate extension Character {
    var ascii: Int {
        let utf8 = String(self).utf8
        return Int(utf8[utf8.startIndex])
    }
}
