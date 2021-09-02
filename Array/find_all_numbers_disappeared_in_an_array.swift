//
//  find_all_numbers_disappeared_in_an_array.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/14.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
 * Primary idea: 如果数组中存在 num，则设置 index = num - 1 处的值为 -1，表示该元素在数组中存在
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class FindAllNumbersDisappearedInAnArray {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums, result = [Int]()
        for num in nums {
            /// 数组元素从 1 开始，将 num - 1 位置的元素设置为 - 1，代表在数组中出现过
            nums[num - 1] = -1
        }
        
        for i in 0..<nums.count {
            /// 收集所有值为正数的位置，即缺失值（出现过则值被设置为 -1）
            /// 索引从 0 开始，+1 后才为缺失的元素
            if nums[i] != -1 {
                result.append(i + 1)
            }
        }
        return result
    }
}
