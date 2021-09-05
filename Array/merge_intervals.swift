//
//  merge_intervals.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/4.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/merge-intervals/
 * Primary idea: 先按区间 start 升序排列, 然后分析区间重叠情况
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class MergeIntervals {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        /// 按区间 start 升序排列
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var res = [[Int]]()
        
        for interval in intervals {
            if res.count == 0 {
                res.append(interval)
                continue
            }
            var previous = res.last!
            /// 如果当前区间的 start 大于前一区间的 end，则代表这两个区间之间没有重叠，无需合并
            if interval[0] > previous[1] {
                res.append(interval)
            } else {
                /// 区间相交，当前区间 end 大于前一区间 end，则合并区间
                /// [[1,4],[2,5]] this case.
                if interval[1] > previous[1] {
                    previous[1] = interval[1]
                }
                res[res.count - 1] = previous
            }
        }
        return res
    }
}
