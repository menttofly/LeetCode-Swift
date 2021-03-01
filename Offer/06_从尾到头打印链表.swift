//
//  06_从尾到头打印链表.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/3/1.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

fileprivate class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        recursion(&res, head)
        return res
    }

    func recursion(_ res: inout [Int], _ p: ListNode?) {
        guard let p = p else {
            return
        }

        recursion(&res, p.next)
        res.append(p.val)
    }
}
