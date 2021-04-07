//
//  09_用两个栈实现队列.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class CQueue {
    var pushStack = [Int](), popStack = [Int]()

    func appendTail(_ value: Int) {
        pushStack.append(value)
    }
    
    func deleteHead() -> Int {
        if !popStack.isEmpty {
            return popStack.removeLast()
        }
        while !pushStack.isEmpty {
            popStack.append(pushStack.removeLast())
        }
        return popStack.isEmpty ? -1 : popStack.removeLast()
    }
}
