//
//  house_robber_iii.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/11.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/house-robber-iii/
 * Primary idea: 对以 root 为根的树，选择 rob 或者不 rob，返回两种情况的最大值
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class HouseRobberIII {
    func rob(_ root: TreeNode?) -> Int {
        let res = robSubtree(root)
        return max(res.not, res.rob)
    }
    
    /// 选择抢劫或者不抢劫 root 节点，分别返回能抢劫这颗树获得最多的钱
    /// - Parameter root: 当前子树的根节点
    /// - Returns: 元组，分别为 rob 或者不 rob 当前 root 节点能获得得最多的钱
    private func robSubtree(_ root: TreeNode?) -> (not: Int, rob : Int) {
        guard let root = root else {
            return (0, 0)
        }
        
        let left = robSubtree(root.left)
        let right = robSubtree(root.right)
        
        var res: (not: Int, rob : Int)
        /// 不抢劫 root 节点，左右子节点均可抢可不抢
        res.not = max(left.not, left.rob) + max(right.not, right.rob)
        /// 抢劫 root 节点，则左右子节点都不能 rob
        res.rob = left.not + right.not + root.val
        
        return res
    }
}
