//
//  maximum_frequency_stack.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/8.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/maximum-frequency-stack/
 * Primary idea: 如下
 *
 * Time Complexity: O(1), Space Complexity: O(n)
 */
class FreqStack {
    /// 记录 FreqStack 中元素的最大频率
    var maxFreq = 0
    /// VF 表，记录 FreqStack 中每个 val 出现的频率
    var valToFreq: [Int: Int] = [:]
    /// FV 表，记录频率 freq 对应的 val 栈（同样 freq 的多个元素按栈排序）
    var freqToVal: [Int: [Int]] = [:]

    init() {
        
    }
    
    func push(_ val: Int) {
        /// 修改 VF 表，val 对应的 freq 加 1
        let freq = (valToFreq[val] ?? 0) + 1
        valToFreq[val] = freq
        
        /// 修改 FV 表，在 freq 对应的栈加上 val
        var stack = freqToVal[freq] ?? []
        stack.append(val)
        freqToVal[freq] = stack
        
        /// 更新最大频率
        maxFreq = max(maxFreq, freq)
    }
    
    func pop() -> Int {
        /// 修改 FV 表，maxFreq 中对应 val 栈中 pop 出一个 val
        var stack = freqToVal[maxFreq] ?? []
        let val = stack.popLast() ?? 0
        freqToVal[maxFreq] = stack
       
        /// 如果 maxFreq 对应的 val 栈空了，更新 maxFreq
        if stack .isEmpty {
            maxFreq -= 1
        }
        
        /// 更新 VF 表，val 对应的 freq 减 1
        let freq = (valToFreq[val] ?? 0) - 1
        valToFreq[val] = freq
        
        return val
    }
}
