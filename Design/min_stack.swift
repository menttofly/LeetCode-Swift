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
 *
 * Primary idea: 当 push 一个小等于当前 min 的数时，先再 push 一个 min，然后 push 当前数 x，再更新 min 为 x
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
        /// 入栈的新元素会导致 min 变化，则先把旧的 min 值入栈，保持旧的 min 在新的 min 之下
        if x <= min {
            stack.append(min)
            min = x
        }
        /// 再 push 新值
        stack.append(x)
    }
    
    func pop() {
        /// 栈顶元素为当前 min，则下面还压着 pre min
        if stack.removeLast() == min {
            /// 移除 pre min，并更新当前 min 为 pre min
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
