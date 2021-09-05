//
//  majority_element.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/16.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/majority-element/
 * Primary idea: 消除不同的元素，最后留下来的就是出现超过一半的元素
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        /// 当前元素
        var majority = 0
        /// 当前元素出现次数
        var times = 0
        
        for i in 0..<nums.count {
            if times == 0 {
                /// 更新当前元素
                majority = nums[i]
                times = 1
            } else if nums[i] == majority {
                /// 和当前元素相同时增加 times
                times += 1
            } else {
                /// 和当前元素不同时减少 times
                times -= 1
            }
        }
        
        return majority
    }
}
