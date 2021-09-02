//
//  container_with_most_water.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/15.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/container-with-most-water/
 * Primary idea: 使用左右双指针, 移动高度叫小的指针直到相遇，由于木桶效应能容纳的水取决于较短的木板
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, water = 0
        while left < right {
            let len = right - left
            let val = len * min(height[left], height[right])
            water = max(water, val)
            
            /// Keep bigger height[index] as one side of interval.
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return water
    }
}
