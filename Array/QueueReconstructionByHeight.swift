//
//  QueueReconstructionByHeight.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/queue-reconstruction-by-height/
 * Primary idea: Sort by people's h descending and k ascending, then inset people at k into queue.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */
class QueueReconstructionByHeight {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sorted = people.sorted { (left, right) -> Bool in
            /// Sort by people's h descending and k ascending
            return left[0] > right[0] || (left[0] == right[0] && left[1] < right[1])
        }
        var queue = [[Int]]()
        for people in sorted {
            /// people[1] is the insert position.
            queue.insert(people, at: people[1])
        }
        return queue
    }
}
