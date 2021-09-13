//
//  daily_temperatures.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/12.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/daily-temperatures/
 * Primary idea: 使用单调递减栈对温度 T 的索引持续入栈，维护单调递减特性，被弹出的栈的索引的下一更大值就是当前入栈索引对应的温度
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class DailyTemperatures {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        
        /// 持续对 T 中元素的索引入栈
        for (i, val) in temperatures.enumerated() {
            /// 维持单调递减特性，将小于 val 的元素对应索引出栈
            while !stack.isEmpty && temperatures[stack.last!] < val {
                /// 出栈的索引下一个更高温度就是 val，两者之间距离为 i - idx
                let idx = stack.removeLast()
                res[idx] = i - idx
            }
            
            /// 索引入栈
            stack.append(i)
        }
        
        return res
    }
}
