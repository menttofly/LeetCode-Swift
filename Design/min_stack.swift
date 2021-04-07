//
//  min_stack.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/min-stack/
 * Primary idea: If push a value that is less or equal than min, then push the min into stack first so keep previous min always below current min.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class MinStack {
    
    var min: Int
    var stack: [Int]
    
    /** initialize your data structure here. */
    init() {
        min = Int.max
        stack = [Int]()
    }
    
    func push(_ x: Int) {
        if x <= min {
            stack.append(min)
            min = x
        }
        stack.append(x)
    }
    
    func pop() {
        if stack.removeLast() == min {
            min = stack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return min
    }
}
