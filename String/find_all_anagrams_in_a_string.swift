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
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
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
