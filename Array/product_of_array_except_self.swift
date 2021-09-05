//
//  product_of_array_except_self.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/product-of-array-except-self/
 * Primary idea: output(i) = output_before(i) * output_after(i)
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ProductOfArrayExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var output = Array(repeating: 1, count: nums.count)
        
        /// get ouput_before i
        for i in 1..<nums.count {
            output[i] = output[i - 1] * nums[i - 1]
        }
        /// right 记录 (i..n] 区间元素的乘积
        var right = 1
        /// get output after i
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            output[i] *= right
            right *= nums[i]
        }
        
        return output
    }
}
