//
//  queue.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/12.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/// 实现一个高效的队列，出队复杂度为 O(1)，粗暴直接使用数组实现队列的 dequeue 复杂度为 O(n)
/// https://github.com/andyRon/swift-algorithm-club-cn/tree/master/Queue
struct Queue<T> {
    /// 内部数组
    private var list = [T?]()
    /// 记录队头，head 之前的元素被设置为 nil
    private var head = 0
    
    /// 队列大小
    var size: Int {
        return list.count - head
    }
    
    /// 是否为空
    var isEmpty: Bool {
        return size == 0
    }
    
    /// 返回队头元素
    var front: T? {
        return isEmpty ? nil : list[head]
    }
    
    /// 队列尾元素
    var back: T? {
        return list.last ?? nil
    }
    
    
    /// 入队
    mutating func enqueue(_ val: T) {
        list.append(val)
    }
    
    /// 删除队头元素并返回
    /// 优化后的出队列策略，不是每次 dequeue 都删除数组第一个元素，避免每次 dequeue 都移动大量元素
    /// - Returns: 队首元素
    @discardableResult
    mutating func dequeue() -> T? {
        guard head < list.count else {
            return nil
        }
        
        let front = list[head]
        
        /// 将 head 处元素置空，并后移一位使得 head 前都是 nil 元素
        list[head] = nil
        head += 1
        
        /// head 前的 nil 元素达到一定条件后进行清理，这样就避免每次 removeFirst 导致的移动元素时间消耗 O(n)
        let percent = Double(head) / Double(list.count)
        if list.count > 50 && percent > 0.5 {
            list.removeFirst(head)
            head = 0  /// 重置队头位置
        }
        
        return front
    }
    
    /// 移除队列尾元素
    @discardableResult
    mutating func popBack() -> T? {
        return list.popLast() ?? nil
    }
}
