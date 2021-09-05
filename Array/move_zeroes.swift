//
//  move_zeroes.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/12.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/move-zeroes/
 * Primary idea: 将 0 从从数组头部交换到尾部
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        /// 当前可放置非零元素的位置
        var r = 0
        for i in 0..<nums.count {
            /// 将非零元素交换到头部
            if nums[i] != 0 {
                nums.swapAt(i, r)
                /// 更新 r，下一个非零元素放在 r 的位置
                r += 1
            }
        }
    }
}
