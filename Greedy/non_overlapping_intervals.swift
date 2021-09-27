//
//  non_overlapping_intervals.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/28.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/non-overlapping-intervals/
 * Primary idea: 贪心算法之区间调度(Interval Scheduling)，按区间 end 升序排列，下一不重叠的区间 start 要大等于上一区间的 end
 *
 * Note: 同时参考 labuladong 的解法
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class EraseOverlapIntervals {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else {
            return 0
        }
        
        let intervals = intervals.sorted { $0[1] < $1[1] }
        /// 记录上一个区间的结尾
        var preEnd = intervals[0][1]
        /// 记录不重叠区间的数量
        var count = 1
        
        for interval in intervals {
            let start = interval[0]
            /// 当前区间 start 和上一个区间的 end 重叠，不算重叠区间，所以用大等于号
            if start >=  preEnd {
                count += 1
                /// 更新 end
                preEnd = interval[1]
            }
        }
        
        return intervals.count - count
    }
}
