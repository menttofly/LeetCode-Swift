//
//  sliding_window_maximum.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/12.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/// 单调队列，从队头到队尾大小递减，[5,4,3,2,1] <- 5 当 5 入队时，删除 [4,3,2,1] 保持单调性
/// 内部使用优化后的数组
struct OptimizedMonotonicQueue {
    private var queue = Queue<Int>()
    
    /// 队列中的最大值
    var peek: Int {
        return queue.front ?? Int.min
    }
    
    /// 入队
    /// - Parameter val: 待入队元素
    mutating func push(_ val: Int) {
        while !queue.isEmpty && queue.back! < val {
            queue.popBack()
        }
        
        queue.enqueue(val)
    }
    
    /// 指定 val 出队，如果队头元素不等于 val，说明已经不存在则不出队
    /// - Parameter val: 要出队的元素
    mutating func pop(_ val: Int) {
        if val == queue.front {
            queue.dequeue()
        }
    }
}

struct MonotonicQueue {
    private var queue = [Int]()
    
    /// 队列中的最大值
    var peek: Int {
        return queue.first ?? Int.min
    }
    
    /// 入队
    /// - Parameter val: 待入队元素
    mutating func push(_ val: Int) {
        while !queue.isEmpty && queue.last! < val {
            queue.removeLast()
        }
        
        queue.append(val)
    }
    
    /// 指定 val 出队，如果队头元素不等于 val，说明已经不存在则不出队
    /// - Parameter val: 要出队的元素
    mutating func pop(_ val: Int) {
        if val == queue.first {
            queue.removeFirst()
        }
    }
}

/**
 * Question Link: https://leetcode.com/problems/sliding-window-maximum/
 * Primary idea: 使用单调递减队列，窗口滑动时入队 nums[i]，出队 nums[i - k + 1]，其中当前窗口最大值就是单调队列的最大值
 *
 * Time Complexity: O(n), Space Complexity: O(k)
 */
class MaxSlidingWindow {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var window = MonotonicQueue()
        
        for (i, val) in nums.enumerated() {
            if i < k - 1 {
                window.push(val)
            } else {
                window.push(val)
                res.append(window.peek)
                /// 移除 k 大小的窗口的开始元素，保持队列的大小为窗口大小（有可能小于 k，因为队尾一些元素不满足单调性被移出队列）
                window.pop(nums[i - k + 1])
            }
        }
        
        return res
    }
}
