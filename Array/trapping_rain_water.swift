//
//  trapping_rain_water.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/9/4.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/trapping-rain-water/ (42)
 * Primary idea: 经典接雨水问题，使用左右双指针解法
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class TrapRainWater {
    func trap(_ height: [Int]) -> Int {
        guard height.count >= 3 else {
            return 0
        }
        
        /// 左右双指针
        var left = 0, right = height.count - 1
        /// 记录 left 指针左边的最大值，以及 right 指针右边的最大值
        var leftMax = height[0], rightMax = height[height.count - 1]
        /// 记录结果
        var res = 0
        
        while left <= right {
            /// 更新 leftMost 和 rightMost
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])
            
            /// 只关心 l_max 与 r_max 之间的更小值，因为能盛的水只与两者中的更小值有关
            if leftMax < rightMax {
                res += leftMax - height[left]
                left += 1
            } else {
                res += rightMax - height[right]
                right -= 1
            }
        }
        
        return res
    }
}
