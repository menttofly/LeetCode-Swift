//
//  advantage_shuffle.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/14.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/advantage-shuffle/
 * Primary idea: 以 nums2 参照，对两个数组排序，如果 nums1 中的最大值 max(nums1) > nums2[i]（i 是 nums2 的索引），res[i] = max(nums1)
 * Note: 这是一个贪心算法。labuladong 使用有限队列排序 nums2，没有必要代码也比较冗余
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class AdvantageCount {
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /// 对 num1 降序排序
        let sorted = nums1.sorted(by: >)
        /// 对 nums2 降序排序，同时记录其对应的索引，生成一个元组
        let tuples = nums2.enumerated().sorted { $0.element > $1.element }  /// $0.1 > $1.1
        
        var res = Array(repeating: 0, count: nums1.count)
        var left = 0, right = res.count - 1
        
        /// 记录索引以便在对应的位置放置 num1 的最值
        /// left 和 right 不断移动，因为使用后的最值不能再次使用
        for (i, val) in tuples {
            if sorted[left] > val {
                /// 如果 num1 最大值大于 nums2 最大值，则将 nums1 最大值写入 res 中 num2 最大值所在的索引
                res[i] = sorted[left]
                left += 1
            } else {
                /// 否则 num1 中用小的值替代，同时移动 right（使用过的最小值不能再用）
                res[i] = sorted[right]
                right -= 1
            }
        }
        
        return res
    }
}
