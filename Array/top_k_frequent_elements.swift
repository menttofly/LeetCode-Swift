//
//  top_k_frequent_elements.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/top-k-frequent-elements/
 * Primary idea: 字典存储每个数字出现次数，然后把次数作为下标，数字为值放到 bucket 数组中，从后往前遍历依次获取 k 个最频繁的数字
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class TopKFrequentElements {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        /// 如果数组元素都相同，下标就是 nums.count，数组大小需为 nums.count + 1
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        var hash = [Int: Int]()
        
        /// 保存 (num, frequency) 的映射关系
        for num in nums {
            hash[num, default: 0] += 1
        }
        
        /// 按出现频率作为 buckets 数组索引入桶，频率相同放入同一个下标的桶中
        for (num, freq) in hash {
            buckets[freq].append(num)
        }
        
        var topk = [Int]()
        /// 从后往前数字出现频率递减，所以倒序遍历 buckets 数组
        for bucket in buckets.reversed() {
            if !bucket.isEmpty {
                topk.append(contentsOf: bucket)
            }
            /// 已经足够 k 个 most frequent elements
            if topk.count >= k {
                break
            }
        }
        
        return topk
    }
}
