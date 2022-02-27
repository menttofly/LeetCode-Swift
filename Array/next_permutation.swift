//
//  next_permutation.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/2.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/next-permutation/ (31)
 * Primary idea: 在数组从后往前找到第一个非增长的 pivot，将 privot 和其右边的数组中的最小值交换。最后，反转右半部分序列
 *
 * arr = [1,2,3], 下一排列分别为 [1,2,3]、[1,3,2]、[3,1,2]、[2,3,1]，从中找规律
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        /// i 记录 pivot 的位置
        var i = nums.count - 2, j = nums.count - 1
        /// 跳过从后往前递增的部分，最终 i 为 pivot
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        if i >= 0 {
            /// 在 right part 中寻找 pivot(nums[i]) 的下一字典序数字
            while nums[j] <= nums[i] {
                j -= 1
            }
            /// 交换 pivot 和该数字
            nums.swapAt(i, j)
        }
        /// 反转右半部分
        nums[i+1..<nums.count].reverse()
    }
}
