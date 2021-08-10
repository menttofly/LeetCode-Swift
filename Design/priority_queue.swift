//
//  priority_queue.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/9.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/// 堆数据结构
class Heap<T> {
    /// 存储堆节点的数组
    var nodes = [T]()
    /// 排序规则，决定是 max-heap 还是 min-heap
    let order: (T, T) -> Bool
    /// 堆大小
    var size: Int {
        return nodes.count
    }
    /// 堆是否为空
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    init(items: [T], order: @escaping (T, T) -> Bool) {
        self.order = order
        buildHeap(from: items)
    }
    
    /// 构建堆，从倒数第一个非叶子节点往前遍历，
    /// - Parameter items: 用于生成堆的数组
    private func buildHeap(from items:[T]) {
        nodes = items
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    /// 往堆插入元素
    /// - Parameter val: 待插入元素
    func insert(_ val: T) {
        /// 先添加到尾部，如果不符合堆属性，则上浮该元素
        nodes.append(val)
        shiftUp(nodes.count - 1)
    }
    
    /// 删除堆顶元素
    /// - Returns: 堆顶元素
    func remove() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let val = nodes[0]             /// 返回数组第一个元素（堆顶元素）
        nodes[0] = nodes.removeLast()  /// 将最后一个元素放到堆顶，如果不符合堆属性，则将其下沉
        shiftDown(0)
        return val
    }
    
    /// 删除堆中任意一个节点
    /// - Parameter index: 待删除节点的索引
    /// - Returns: 被删除的元素
    func remove(at index: Int) -> T? {
        guard index < size else {
            return nil
        }
        
        /// index 如果为最后一个元素，直接删除就行
        if index != size - 1 {
            nodes.swapAt(index, size - 1)         /// 将最后一个元素和被删除元素交换，保持完全二叉树的性质
            shiftDown(from: index, to: size - 1)  /// 如果新元素和子节点破坏堆属性则下沉（注意交换后实际上堆大小为 size - 1）
            shiftUp(index)                        /// 如果新元素和父节点破坏堆属性则上浮
        }
        
        return nodes.removeLast()
    }
    
    /// 返回堆顶元素，但不删除
    /// - Returns: max-heap 返回最大值，min-heap 返回最小值
    func peek() -> T? {
        return nodes.first
    }
    
    // MARK:- 节点上浮和下沉
    
    /// 对指定索引处的节点之行上浮操作
    /// - Parameter index: 节点索引
    func shiftUp(_ index: Int) {
        let val = nodes[index]
        var index = index, parentIndex = self.parentIndex(of: index)
        
        while index > 0 && order(val, nodes[parentIndex]) {
            nodes[index] = nodes[parentIndex]
            index = parentIndex
            parentIndex = self.parentIndex(of: index)
        }
        
        nodes[index] = val
    }
    
    /// 对指定索引index 对应的元素执行下沉操作，直到满足堆属性（通常用来构建堆）
    /// - Parameter index: 需要下沉的节点索引
    func shiftDown(_ index: Int) {
        shiftDown(from: index, to: nodes.count)
    }
    
    /// 对指定索引index 对应的元素执行下沉操作，直到满足堆属性
    /// - Parameters:
    ///   - start: 需要开始下沉的节点索引
    ///   - end: 开区间，结束位置为 end - 1
    func shiftDown(from start: Int, to end: Int)  {
        let val = nodes[start]
        var index = start, childIndex = leftChildIndex(of: index)
        
        /// 当左子节点不超过最后一个元素索引时，继续下沉
        while childIndex < end {
            /// 如果右孩子存在，对于 max-heap 选择左右子节点更大的那个，min-heap 选择左右子节点更小的那个
            if childIndex + 1 < end && order(nodes[childIndex + 1], nodes[childIndex]) {
                childIndex += 1
            }
            
            /// 当前 index 节点和子节点不满足堆属性
            if !order(val, nodes[childIndex]) {
                nodes[index] = nodes[childIndex]
            } else {
                break
            }
            
            index = childIndex
            childIndex = leftChildIndex(of: index)
        }
        
        nodes[index] = val
    }
    
    // MARK:- 节点关系

    /// 父节点
    @inline(__always) private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    /// 左孩子节点
    @inline(__always) private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    /// 右孩子节点
    @inline(__always) private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}
