//
//  subsets.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/5.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/subsets/ (78)
 * Primary idea: 回溯法，在递归树每层尝试所有选择，将数字放入 subset 子集中，并直接添加 subset 到结果 res 中，不需要到叶节点才保存
 *
 * Time Complexity: O(2^n), Space Complexity: O(2^n)
 */
class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var res = [[Int]]()
        backtracking(&res, &nums, [], 0)
        return res
    }
    
    /// 回溯法遍历递归树，在树进入下一层时尝试所有的选择，树的深度每增加一层可选择区间的下界 start 都会右移
    /// @warning 和常规回溯问题有所不同，不必在到达叶节点才保存结果，而是每次到下一层时收集上一层结果，因为要求的是 subset 子集
    /// - Parameters:
    ///   - res: 结果集合
    ///   - nums: 所有的数字
    ///   - sets: 经过一系列选择后到达的路径，即当前数字的组合，非引用类型不需要撤销选择（引用类型需要撤销）
    ///   - start: 可选择区间的下界，也可以代表树当前的层级
    private func backtracking(_ res: inout [[Int]], _ nums: inout [Int], _ sets: [Int], _ start: Int) {
        /// 保存当前 sets
        res.append(sets)
        /// 从 [start..count) 区间中选取
        for i in start..<nums.count {
            backtracking(&res, &nums, sets + [nums[i]], i + 1)
        }
    }
}
