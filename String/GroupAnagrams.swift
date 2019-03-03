//
//  GroupAnagrams.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/group-anagrams/
 * Primary idea: Store sorted string key and list value in hash table.
 *
 * Time Complexity: O(nklogk), Space Complexity: O(n)
 */
class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]()
        for str in strs {
            var characters = Array(str)
            characters.sort()
            
            let key = String(characters)
            if result.index(forKey: key) == nil {
                result[key] = []
            }
            result[key]?.append(str)
        }
        return Array(result.values)
    }
}
