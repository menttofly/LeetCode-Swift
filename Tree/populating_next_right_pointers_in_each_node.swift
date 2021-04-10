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
