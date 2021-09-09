//
//  combination_sum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/combination-sum/
 * Primary idea: 通过回溯法尝试所有可能的选项，过滤重复的情况
 *
 * Time Complexity: O(n^3), Space Complexity: O(n^2)
 */
class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        backtracking(candidates, target, [], 0, &res)
        return res
    }
    
    /// 为了过滤重复的 case，使用 start 来确保和 start 之后的数字组合
    private func backtracking(_ candidates: [Int], _ target: Int, _ combine: [Int], _ start: Int, _ res: inout [[Int]]) {
        /// 需要凑的的数字等于0，则表明当前 combination 满足条件
        if target == 0 {
            res.append(combine); return
        }
        /// 需要的数字小于 0，说明 combine 和超过原有的目标值，丢弃
        if target < 0 {
            return
        }
        /// 从当前树节点开始，尝试每个可选项，并且下一个可选项的索引不能小于 start，否则会重复
        for i in start..<candidates.count {
            var combine = combine
            combine.append(candidates[i])
            /// 用减法，更新剩余的 target
            backtracking(candidates, target - candidates[i], combine, i, &res)
        }
    }
}
