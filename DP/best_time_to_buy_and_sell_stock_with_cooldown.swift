//
//  best_time_to_buy_and_sell_stock_with_cooldown.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
 * Primary idea: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/discuss/75927/Share-my-thinking-process
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class BestTimeToBuyAndSellStockWithCooldown {
    func maxProfit(_ prices: [Int]) -> Int {
        var sell = 0, prev_sell = 0, buy = Int.min, prev_buy = 0
        for price in prices {
            prev_buy = buy
            buy = max(prev_sell - price, prev_buy)
            prev_sell = sell;
            sell = max(prev_buy + price, prev_sell)
        }
        return sell
    }
}
