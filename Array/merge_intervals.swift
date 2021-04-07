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
 * Primary idea: Quick sort the intervals by start ascending, then analysis interval overlap.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class MergeIntervals {
    func merge(_ intervals: [Interval]) -> [Interval] {
        /// Make intervals sorted by Interval.start ascending.
        let intervals = intervals.sorted { $0.start < $1.start }
        var results = [Interval]()
        
        for interval in intervals {
            if results.count == 0 {
                results.append(interval)
                continue
            }
            let previous = results.last!
            /// If current interval's start larger than previous, it mean no overlapping between this two interval.
            if interval.start > previous.end {
                results.append(interval)
            } else {
                /// [[1,4],[2,3]] this case.
                if interval.end > previous.end {
                    previous.end = interval.end
                }
                results[results.count - 1] = previous
            }
        }
        return results
    }
}


class Interval {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}
