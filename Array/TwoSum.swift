//
//  TwoSum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/29.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/two-sum/
 * Primary idea: Traversing the array and store (target - nums[i], i) as (key, value) in a dictionary
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            if let index = hash[target - num] {
                return [i, index]
            } else {
                hash[num] = i
            }
        }
        fatalError("No valid output")
    }
}
