//
//  MajorityElement.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/majority-element/
 * Primary idea: Neutralize when the elements are different, the majority element must survive at last.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority = 0, times = 0
        for i in 0..<nums.count {
            let elem = nums[i]
            if times == 0 {
                majority = elem
                times = 1
            } else if elem == majority {
                times += 1
            } else {
                times -= 1
            }
        }
        return majority
    }
}
