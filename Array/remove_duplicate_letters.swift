//
//  remove_duplicate_letters.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/21.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/remove-duplicate-letters/
 * Primary idea: 数组去重，用栈记录无重复的字符，exist 字典用于字符去重，单调栈用于保持字典序
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class RemoveDuplicateLetters {
    func removeDuplicateLetters(_ s: String) -> String {
        /// 用来记录字符出现顺序
        var stack = [Character]()
        /// 记录某个字符是否放入栈中，用于去重
        var exist = [Character: Bool]()
        /// 记录字符的出现次数
        var hash = [Character: Int]()
        for char in s {
            hash[char, default: 0] += 1
        }
        
        for char in s {
            /// 每访问一个字符都要更新 hash，这样在判断是否应出栈时，可以知道该字符后面是否还会再次出现
            hash[char, default: 0] -= 1
            
            /// 字符已经放到 stack 中
            if exist[char] == true {
                continue
            }
            
            /// 把栈中字典序大于 char，并且后续还会出现的字符移出栈，保持字典序
            while !stack.isEmpty && stack.last! > char {
                /// 这个后续不会再出现，所以不出栈
                if hash[stack.last!] == 0 {
                    break
                }
                
                /// 后续还会出现，所以将其移除，并更新 exist 数组表示已不再栈中
                exist[stack.removeLast()] = false
            }
            
            /// 把当前字符 char 放入栈中，并更新 exist
            stack.append(char)
            exist[char] = true
        }
        
        return String(stack)
    }
}
