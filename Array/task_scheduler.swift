//
//  task_scheduler.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/task-scheduler/
 * Primary idea: Calmed analysis and think a little.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class TaskScheduler {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var buckets = Array(repeating: 0, count: 26)
        for task in tasks {
            let index = task.ascii - Character("A").ascii
            buckets[index] += 1
        }
        buckets = buckets.sorted()
        
        var index = 25
        while index >= 0 && buckets[index] == buckets[25] {
            index -= 1
        }
        return max(tasks.count, (buckets[25] - 1) * (n + 1) + 25 - index)
    }
}

fileprivate extension Character {
    var ascii: Int {
        let utf8 = String(self).utf8
        return Int(utf8[utf8.startIndex])
    }
}
