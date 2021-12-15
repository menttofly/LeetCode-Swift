//
//  lru_cache.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/2/23.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/lru-cache/ (146)
 * Primary idea: 使用哈希表快速访问元素 node，双向链表实现 LRU 淘汰策略
 *
 * Time Complexity: O(1), Space Complexity: O(n)
 */
class LRUCache {
    var count: Int = 0
    var table: [Int: LRUNode] = [:]
    
    /// 哑节点，方便操作双向链表
    let head = LRUNode(0)
    let tail = LRUNode(0)
    
    /// 当前缓存容量
    let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = table[key] else {
            return -1
        }
        /// 标记为最新访问的
        top(node: node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = table[key] {
            node.val = value
            /// 标记为最新访问的
            top(node: node)
        } else {
            let node = LRUNode(value)
            node.key = key
            table[key] = node
            insert(node: node)
            count += 1
            
            /// 超过最大容量，移除队尾元素
            if count > capacity {
                let last = pop()
                table.removeValue(forKey: last.key)
                count -= 1
            }
        }
    }
    
    // MARK:- 双向链表操作
    /// 删除某一节点
    private func remove(node: LRUNode) -> Void {
        if let pre = node.pre, let next = node.next {
            pre.next = next
            next.pre = pre
        }
    }
    
    /// 使用头插法始终在哑节点 head 之后插入，作为队头元素
    private func insert(node: LRUNode) -> Void {
        node.pre = head
        node.next = head.next
        
        head.next?.pre = node
        head.next = node
    }
    
    /// 将一个节点移动到队头
    private func top(node: LRUNode) -> Void {
        /// node 是否和 head 的 next 为同一实例
        if head.next! === node {
            return
        }
        remove(node: node)
        insert(node: node)
    }
    
    /// pop 哑节点 tail 的前一个元素，即队尾元素
    private func pop() -> LRUNode {
        let last = tail.pre!
        remove(node: last)
        return last
    }
}

/// 节点定义
class LRUNode {
    var val: Int
    var key: Int = 0
    var pre: LRUNode?
    var next: LRUNode?
    init(_ val: Int) {
        self.val = val
    }
}
