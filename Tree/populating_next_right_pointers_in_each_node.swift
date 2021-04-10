//
//  populating_next_right_pointers_in_each_node.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/10.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    init(_ val: Int) {
        self.val = val
    }
}

/**
 * Question Link: https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
 * Primary idea: 由于要连接的两个节点不一定有公共父节点，所以connectBetween用两个参数代表左右节点
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class PopulatingNextRightPointersInEachNode {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        connectBetween(root.left, root.right)
        return root
    }
    
    func connectBetween(_ node1: Node?, _ node2: Node?) {
        guard let node1 = node1, let node2 = node2 else {
            return
        }
        
        node1.next = node2
        connectBetween(node1.left, node1.right)
        connectBetween(node2.left, node2.right)
        connectBetween(node1.right, node2.left)
    }
}
