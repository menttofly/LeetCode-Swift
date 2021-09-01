//
//  3sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/12/22.
//  Copyright © 2018 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/3sum/
 * Primary idea: 先对数组排序，遍历三元组中可能的第一个元素的索引，再对每个可能的第一个元素 'index'，从 index + 1 开始进行双向 2Sum 扫描.
 *
 * Time Complexity: O(n^2), Space Complexity: O(1)
 */
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]](), nums = nums.sorted()
        for (index, num) in nums.enumerated() {
            /// 如果第一个元素就大于 0，则 3Sum 不可能为 0
            if num > 0 {
                break
            }
            
            /// Input: [-1,0,1,2,-1,-4] => [-4,-1,-1,0,1,2]
            /// Output: [[-1,-1,2],[-1,0,1],[-1,0,1]] (没有去重)
            /// Expected: [[-1,-1,2],[-1,0,1]] (去重)
            /// 去除重复，因为遍历到 nums[1]=-1 时，在内层循环移动 front back 时已经添加 [-1,0,1]
            /// 所以在遍历到 nums[2]=-1 时，又会产生 [-1,0,1] 导致重复，所以必须检查 nums[i] 是否等于 nums[i-1]，相等则跳过避免重复
            if index > 0 && num == nums[index - 1] {
                continue
            }
            let target = -num
            var front = index + 1, back = nums.count - 1
            /// Because the array is sorted, so scan it with two pointer.
            /// Similar to the idea of binary search.
            while front < back {
                let sum = nums[front] + nums[back]
                if sum < target {
                    front += 1
                } else if sum > target {
                    back -= 1
                } else {
                    let result = [num, nums[front], nums[back]]
                    results.append(result)
                    /// Moving the front pointer to the next different number forwards.
                    while front < back && nums[front] == result[1] {
                        front += 1
                    }
                    /// Moving the back pointer to the next different number backwards.
                    while front < back && nums[back] == result[2] {
                        back -= 1
                    }
                }
            }
        }
        
        return results
    }
}
