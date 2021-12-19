//
//  maximum_product_subarray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/8.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-product-subarray/ (152)
 * Primary idea: MAX[i] 表示以 nums[i] 结尾最大乘积子数组，MIN[i] 表示以 nums[i] 结尾最小乘积子数组
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MaximumProductSubarray {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        /// nums[i] 存在负数，dp[min] * nums[i] 可能负负得正，取得最大值
        var dpmax = nums[0], dpmin = nums[0]
        var res = nums[0]
        
        for i in 1..<nums.count {
            /// 保存更新前的 dpmax
            let temp = dpmax
            dpmax = max(dpmax * nums[i], dpmin * nums[i], nums[i])
            dpmin = min(temp * nums[i], dpmin * nums[i], nums[i])
            res = max(res, dpmax)
        }
        
        return res
    }
}
