//
//  PalindromeNumber.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/11/2.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/palindrome-number/
 * Primary idea: Reverse half part of number, compare the reversed number and current number
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */
class PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || x > 0 && x % 10 == 0 {
            return false
        }
        if x < 10 {
            return true
        }
        var reverse = 0, num = x
        while num > reverse {
            reverse = reverse * 10 + num % 10
            num /= 10
        }
        return num == reverse || num == reverse / 10
    }
}



























