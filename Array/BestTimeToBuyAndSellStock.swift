//
//  BestTimeToBuyAndSellStock.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/7.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * Primary idea: Focus on the peaks and valleys in the prices graph.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BestTimeToBuyAndSellStock {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max, maxProfit = 0
        for price in prices {
            if price < minPrice {
                minPrice = price
            } else if price - minPrice > maxProfit {
                maxProfit = price - minPrice
            }
        }
        return maxProfit
    }
}
