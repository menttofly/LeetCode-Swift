//
//  jump_game_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/28.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/jump-game-ii/ (45)
 * Primary idea: 贪心算法
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class JumpGameII {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0
        /// [curBegin, curEnd] 代表可选择的跳跃区间
        var curEnd = 0
        /// [curBegin, curEnd] 中所有选择后能够跳到的最远位置
        var curFarthest = 0
        
        for i in 0..<nums.count - 1 {
            curFarthest = max(curFarthest, i + nums[i])
            /// 当 i 到达 curEnd 时，代表前一位置可跳跃区间都处理过，开始下一次跳跃
            if i == curEnd {
                jumps += 1
                /// 更新 curEnd
                curEnd = curFarthest
            }
        }
        
        return jumps
    }
}
