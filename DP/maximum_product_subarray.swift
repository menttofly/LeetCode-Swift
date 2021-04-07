//
//  maximum_product_subarray.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/8.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-product-subarray/
 * Primary idea: The maximum product subarray dicided by both max/min product subarray end with A[i].
 *
 * State Transition Equation: MAX[i] = max{max(MAX[i-1], MIN(i-1)), A[i-1]}
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MaximumProductSubarray {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var result = nums[0], dpmax = nums[0], dpmin = nums[0]
        for i in 1..<nums.count {
            let temp = dpmax
            dpmax = max(max(dpmax * nums[i], dpmin * nums[i]), nums[i])
            dpmin = min(min(temp * nums[i], dpmin * nums[i]), nums[i])
            result = max(dpmax, result)
        }
        return result
    }
}
