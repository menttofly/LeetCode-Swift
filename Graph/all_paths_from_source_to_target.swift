//
//  all_paths_from_source_to_target.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/4.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/all-paths-from-source-to-target/
 * Primary idea: 将当前节点加入路径，递归遍历邻接顶点，结束对当前顶点访问后，将顶点从路径移除（类似重置 visited 数组元素）
 *
 * Time Complexity: O(n^2), Space Complexity: O(n^2)
 */
class AllPathsSourceTarget {
    var res: [[Int]] = []
    
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var path = [Int]()
        path.append(0)
        dfs(graph, 0, &path)
        return res
    }
    
    func dfs(_ graph: [[Int]], _ vertex: Int, _ path: inout [Int]) {
        /// 把当前节点添加到路径
        path.append(vertex)
        /// 抵达终点
        if vertex == graph.count - 1 {
            res.append(path)
            path.removeLast()
            return
        }
        
        /// 递归遍历邻接顶点
        for neighbor in graph[vertex] {
            dfs(graph, neighbor, &path)
        }
        
        /// 离开节点，将当前节点从路径中移除。类似 visited 数组的元素，结束访问时会重置为 false
        path.removeLast()
    }
}
