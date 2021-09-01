//
//  best_time_to_buy_and_sell_stock_ii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/9/1.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 * Primary idea: 可以频繁操作股票，在每个低点买入，并在下一个波峰马上卖出，相当于站在上帝视角
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */

class StockMaxProfit {
    func maxProfit(_ prices: [Int]) -> Int {
        var pre_price = Int.max, maxProfit = 0
        for price in prices {
            if price > pre_price {
                maxProfit += price - pre_price
            }
            pre_price = price
        }
        
        return maxProfit
    }
}
