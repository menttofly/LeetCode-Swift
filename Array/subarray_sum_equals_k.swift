//
//  subarray_sum_equals_k.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subarray-sum-equals-k/
 * Primary idea: Prefix sum array, store prefix sum and it's frequency in hash table.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class SubarraySumEqualsK {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        /// Prefix sum map which record (prefixSum, count) in array.
        var prefixMap = [Int: Int](), prefixSum = 0, count = 0
        prefixMap[0] = 1
        for num in nums {
            prefixSum += num
            /// If (prefixSum - k) exists, then there is a subarray's sum is k.
            if let cnt = prefixMap[prefixSum - k] {
                count += cnt
            }
            /// Update prefix sum map.
            let thiscnt = prefixMap[prefixSum] ?? 0
            prefixMap[prefixSum] = thiscnt + 1
        }
        return count
    }
}
