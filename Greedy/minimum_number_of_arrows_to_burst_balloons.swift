//
//  minimum_number_of_arrows_to_burst_balloons.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/28.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/ (452)
 * Primary idea: 贪心算法之区间调度(Interval Scheduling)，按区间 end 升序排列，下一不重叠的区间 start 要大于上一区间的 end
 *
 * Note: 不重叠的区间数量就是需要的 Arrow 数量
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class FindMinArrowShots {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        if points.isEmpty {
            return 0
        }
        
        let points = points.sorted { $0[1] < $1[1] }
        var preEnd = points[0][1], count = 1
        
        for point in points {
            let start = point[0]
            /// 当前区间 start 必须大于前一个区间的 end，因为相等的时候箭头碰到就会爆，相当于重叠区间
            if start > preEnd {
                count += 1
                preEnd = point[1]
            }
        }
        
        return count
    }
}
