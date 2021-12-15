//
//  permutations.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/3.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/permutations/ (46)
 * Primary idea: 全排列问题 f(n) = n!，即 n * n-1 * n-2 * .. * 1，nums 采用引用类型传递，所以需要在回溯时撤销选择
 *
 * Time Complexity: O(n!), Space Complexity: O(n * n!)
 */
class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var numbers = nums
        var res = [[Int]]()
        backtracking(&res, &numbers, 0)
        return res
    }
    
    /// 回溯法遍历递归树，在树进入下一层时尝试所有的选择，树的深度每增加一层可选择数量都会减 1
    /// - Parameters:
    ///   - res: 存储结果
    ///   - nums: 所有的数字，注意这是引用类型不是值类型，所以在回溯到上一层时需要撤销选择
    ///   - start: 当前层级
    private func backtracking(_ res: inout [[Int]], _ nums: inout [Int], _ start: Int) {
        /// base case
        /// 没有可选择的数，即已经在叶子节点了，添加到结果集中
        if start >= nums.count {
            res.append(nums)
            return
        }
        /// 每层从 [start..count) 区间选择数字
        /// 第一层在 [1,2,3] 中选择 1，第二层只能选 [2,3]
        /// 第一层在 [1,2,3] 中选择 2，第二层只能选 [1,3]
        /// 第一层在 [1,2,3] 中选择 3，第二层只能选 [1,2]
        for i in start..<nums.count {
            /// 将当前选择 index 和 start 交换，让下一层有正确的可选项
            nums.swapAt(start, i)
            backtracking(&res, &nums, start + 1)
            /// 回溯到当前层后，需要撤销选择，交换 start 和 index 的数字，在下一次循环中重新选择
            /// 如果 nums 是值类型，就不需要撤销
            nums.swapAt(start, i)
        }
    }
}
