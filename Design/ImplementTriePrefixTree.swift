//
//  ImplementTriePrefixTree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/implement-trie-prefix-tree/
 * Primary idea: Use TrieNode to store all child letter.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class ImplementTriePrefixTree {
    
    private let root: TrieNode
    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for letter in word {
            if node.childs[letter] == nil {
                node.childs[letter] = TrieNode()
            }
            node = node.childs[letter]!
        }
        node.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root
        for letter in word {
            if let current = node.childs[letter] {
                node = current
            } else {
                return false
            }
        }
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for letter in prefix {
            if let current = node.childs[letter] {
                node = current
            } else {
                return false
            }
        }
        return true
    }
}


class TrieNode {
    /// This node is marked as a word's end.
    var isEnd: Bool
    /// We don't use array because character to it's ascii code is difficult.
    var childs: [Character: TrieNode]
    
    init() {
        isEnd = false
        childs = [Character: TrieNode]()
    }
}
