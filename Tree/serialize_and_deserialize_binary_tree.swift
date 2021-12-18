//
//  serialize_and_deserialize_binary_tree.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/7.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/ (297)
 * Primary idea: 通过后续遍历获取左右子树字符串，再结合当前节点生成序列化字符串；反序列化时，最后一个节点是根节点，同时要先构造 root.right
 * Note：left:(#,#,#,4,2) right:(#,#,3) root:(1)
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class BinaryTreeCodec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "#"
        }
        
        let left =  serialize(root.left)
        let right = serialize(root.right)
        
        return "\(left),\(right),\(root.val)"
    }

    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = data.components(separatedBy:",")
        return deserialize(&nodes)
    }
    
    /// 根据二叉树序列化后的数组构建二叉树（因为有代表空节点的 '#'，所以不需要其它遍历顺序也能构建）
    /// - Parameter nodes: 二叉树序列化后的字符数组
    /// - Returns: 二叉树根节点
    func deserialize(_ nodes: inout [String]) -> TreeNode? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        let lastNode = nodes.removeLast()
        if lastNode == "#" {
            return nil
        }
        
        let root = TreeNode(Int(lastNode)!)
        root.right = deserialize(&nodes)
        root.left = deserialize(&nodes)
        
        return root
    }
}
