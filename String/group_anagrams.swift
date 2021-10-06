//
//  group_anagrams.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/group-anagrams/
 * Primary idea: 同母异位词排序后相同，可以作为哈希的 key，字符串保存到 key 对应的 value 数组
 *
 * Time Complexity: O(nklogk), Space Complexity: O(n)
 */
class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [String: [String]]()
        for str in strs {
            /// 同母异位词排序后为相同的字符串
            let sorted = Array(str).sorted()
            /// 作为字典的 key
            let key = String(sorted)
            if res.index(forKey: key) == nil {
                res[key] = []
            }
            
            res[key]?.append(str)
        }
        
        return Array(res.values)
    }
}
