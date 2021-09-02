//
//  best_time_to_buy_and_sell_stock.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * Primary idea: 一次买入，一次卖出，直接选择 k 线图中的最低谷抄底，选择波峰抛出，这样收益最大
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BestTimeToBuyAndSellStock {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max, maxProfit = 0
        for price in prices {
            if price < minPrice {
                /// 更新最低值
                minPrice = price
            } else if price - minPrice > maxProfit {
                /// 对比当前收益和 maxProfit，更大则更新 maxProfit
                maxProfit = price - minPrice
            }
        }
        
        return maxProfit
    }
}
