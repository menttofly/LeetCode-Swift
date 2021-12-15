//
//  queue_reconstruction_by_height.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/queue-reconstruction-by-height/ (406)
 * Primary idea: 按身高的降序和 k 的升序排序，然后将 people 插入队列中第 k 位置
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class QueueReconstructionByHeight {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sorted = people.sorted { (left, right) -> Bool in
            /// 按升高的降序和 k 的升序排序
            return left[0] > right[0] || (left[0] == right[0] && left[1] < right[1])
        }
        
        var queue = [[Int]]()
        for people in sorted {
            /// k 就是插入队列中的位置
            queue.insert(people, at: people[1])
        }
        
        return queue
    }
}
