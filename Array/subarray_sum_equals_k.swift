//
//  subarray_sum_equals_k.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subarray-sum-equals-k/ (560)
 * Primary idea: 前缀和数组，记录每个 [0..i] 区间的和。假设区间[left..right] 和为 k，则 sum[right] - sum[left] = k。
 *
 *Note: 扫描整个数组，用字典记录每个 sum[left] 的出现次数
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class SubarraySumEqualsK {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        /// 记录数组中的前缀和与出现次数 (prefixSum, count)
        var prefixMap = [Int: Int](), prefixSum = 0, count = 0
        prefixMap[0] = 1
        
        for num in nums {
            /// 更新当前的 sum[right]
            prefixSum += num
            /// sum[left] 存在且大于 0，则表明 [left..right] 区间和为 k
            if let cnt = prefixMap[prefixSum - k] {
                count += cnt
            }
            /// 更新当前位置的前缀和出现的次数
            /// 因为数组元素可能为 0 或者负数，所以同一前缀和可能出现多次，不能粗暴地设置为 1
            prefixMap[prefixSum, default: 0] += 1
        }
        
        return count
    }
}
