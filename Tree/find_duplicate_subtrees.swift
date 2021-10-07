//
//  find_duplicate_subtrees.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/4/14.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-duplicate-subtrees/
 * Primary idea: 先确定如何描述一个树，即用`left+right+node`形式的字符串表示，在递归过程中缓存所有tree的出现次数，次数>=1时说明有重复
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class FindDuplicateSubtrees {
    var res = [TreeNode](), hash = [String: Int]()
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traverse(root)
        return res
    }
    
    /// 将二叉树以字符串的形式表示
    /// - Parameter root: 当前 root 节点
    /// - Returns: 代表树的字符串
    @discardableResult
    func traverse(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "#"
        }
        
        let left = traverse(root.left)
        let right = traverse(root.right)
        let tree = "\(left),\(right),\(root.val)"
    
        if let count = hash[tree] {
            /// 重复多次，也只需要添加一次
            if count == 1 { res.append(root) }
            hash[tree] = count + 1
        } else {
            hash[tree] = 1
        }
        
        return tree
    }
}
