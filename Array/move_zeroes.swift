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
 * Primary idea: Swap zero from front to back.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        var r = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, r)
                r += 1
            }
        }
    }
}
