//
//  10-1-斐波那契数列  .swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

class FibonacciSequence {
    func fib(_ n: Int) -> Int {
        if (n == 0) { return 0 }
        if (n == 1) { return 1 }

        var pre = 0, cur = 1
        for _ in 2...n {
            let sum = (pre + cur) % 1000000007
            pre = cur
            cur = sum
        }
        return cur
    }
}
