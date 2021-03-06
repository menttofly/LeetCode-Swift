//
//  ProductOfArrayExceptSelf.swift
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
        
        /// ouput_before i
        for i in 1..<nums.count {
            output[i] = output[i - 1] * nums[i - 1]
        }
        var right = 1, index = nums.count - 1
        /// output after i
        while index >= 0 {
            output[index] *= right
            right *= nums[index]
            index -= 1
        }
        return output
    }
}
