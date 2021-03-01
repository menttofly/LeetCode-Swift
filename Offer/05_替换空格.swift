//
//  05_替换空格.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/3/1.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/// 用python或者js重做
fileprivate class Solution {
    func replaceSpace(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        var empty = ""
        for character in s {
            if character == " " {
                empty.append(String(character))
                empty.append(String(character))
            }
        }
        
        var ss: String = s + empty
        
        var originIndex = s.count - 1;
        var newIndex = ss.count - 1
        
        while originIndex >= 0 && originIndex < newIndex {
            let originStringIndex = s.index(s.startIndex, offsetBy: originIndex)
            var newStringIndex = ss.index(ss.startIndex, offsetBy: newIndex)
            if s[originStringIndex] == " " {
                
                ss.replaceSubrange(newStringIndex...newStringIndex, with: "0")
                
                newIndex -= 1
                newStringIndex = ss.index(ss.startIndex, offsetBy: newIndex)
                
                ss.replaceSubrange(newStringIndex...newStringIndex, with: "2")
                
                newIndex -= 1
                newStringIndex = ss.index(ss.startIndex, offsetBy: newIndex)
                
                ss.replaceSubrange(newStringIndex...newStringIndex, with: "%")
                
                newIndex -= 1
                
            } else {
                let substring = s[originStringIndex]
                ss.replaceSubrange(newStringIndex...newStringIndex, with: String(substring))
                newIndex -= 1
            }
            
            originIndex -= 1
        }
        return ss
    }
}
