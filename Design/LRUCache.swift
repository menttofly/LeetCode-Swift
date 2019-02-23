//
//  LRUCache.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/2/23.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/lru-cache/
 * Primary idea: Use hash table to visit node, and doubly linked list to implement LRU strategy.
 *
 * Time Complexity: O(1), Space Complexity: O(n)
 */
class LRUCache {
    var count: Int = 0
    var table: [Int: LRUNode] = [:]
    let capacity: Int
    let head: LRUNode
    let tail: LRUNode

    init(_ capacity: Int) {
        self.capacity = capacity
        
        head = LRUNode(0)
        tail = LRUNode(0)
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = table[key] else {
            return -1
        }
        /// move
        top(node: node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = table[key] {
            node.val = value
            top(node: node)
        } else {
            let node = LRUNode(value)
            node.key = key
            table[key] = node
            insert(node: node)
            count += 1
            
            if count > capacity {
                let last = pop()
                table.removeValue(forKey: last.key)
                count -= 1
            }
        }
    }
    
    // MARK:- Operate Doubly Linked List
    private func remove(node: LRUNode) -> Void {
        if let pre = node.pre, let next = node.next {
            pre.next = next
            next.pre = pre
        }
    }
    
    /// Always insert new node after head.
    private func insert(node: LRUNode) -> Void {
        node.pre = head
        node.next = head.next
        
        head.next?.pre = node
        head.next = node
    }
    
    /// Move an existing node to the top if need.
    private func top(node: LRUNode) -> Void {
        if head.next! === node {
            return
        }
        remove(node: node)
        insert(node: node)
    }
    
    /// Pop the last node before tail.
    private func pop() -> LRUNode {
        let last = tail.pre!
        remove(node: last)
        return last
    }
}


class LRUNode {
    var val: Int
    var key: Int = 0
    var pre: LRUNode?
    var next: LRUNode?
    init(_ val: Int) {
        self.val = val
    }
}
