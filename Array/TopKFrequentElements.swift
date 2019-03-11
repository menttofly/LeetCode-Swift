//
//  TopKFrequentElements.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/top-k-frequent-elements/
 * Primary idea: Hash table and bucket sort, you can also done it with min-heap.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class TopKFrequentElements {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        var map = [Int: Int]()
        
        /// Put (num, frequency) into a hash table.
        for num in nums {
            map[num] = map[num] != nil ? map[num]! + 1 : 1
        }
        
        /// Put the number which have same frequency into one bucket, and frequency used as index in buckets array.
        for (num, frequency) in map {
            buckets[frequency].append(num)
        }
        
        var topk = [Int]()
        /// Most frequent elements must at the end, so traversing from back to front.
        for bucket in buckets.reversed() {
            if !bucket.isEmpty {
                topk.append(contentsOf: bucket)
            }
            if topk.count >= k {
                break
            }
        }
        return topk
    }
}
