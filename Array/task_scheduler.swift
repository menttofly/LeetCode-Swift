//
//  task_scheduler.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/15.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/task-scheduler/ (621)
 * Primary idea: https://www.cnblogs.com/grandyang/p/7098764.html
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class TaskScheduler {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        /// 统计 26 中任务（英文字幕）出现的频率并排序
        /// 如：AAAABBBEEFFGG 3，在 A 之间加入 3 个空位：A---A---A---A
        /// 按出现频率分别插入 B、E、F、G，尽量均匀填满空位
        var buckets = Array(repeating: 0, count: 26)
        for task in tasks {
            let index = task.asciiValue! - Character("A").asciiValue!
            buckets[Int(index)] += 1
        }
        /// 排序后出现频率最高的放在末尾，即：buckets[25]
        buckets.sort()
        
        /// 统计出现频率最高的所有字母（任务）
        var count = 0
        /// 从后往前遍历
        for freq in buckets.reversed() {
            if freq == buckets[25] {
                count += 1
            }
        }
        
        /// 每个小单元长度为 n + 1，对上述例子就是 3 + 1 = 4
        /// 共有 maxFreq - 1 个这样的小单元，还要加上尾部频率最高的字母个数 count 
        /// 最小的完成时间不能小于任务的数量，此时 n = 0
        return max(tasks.count, (buckets[25] - 1) * (n + 1) + count)
    }
}
