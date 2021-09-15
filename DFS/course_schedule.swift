//
//  course_schedule.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/course-schedule/
 * Primary idea: 通过 dfs 检测课程依赖关系形成的有向图, 如果存在环则无法完成所有课程
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class CourseSchedule {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        /// 通过邻接表构建有向图
        var graph = Array(repeating: [Int](), count: numCourses)
        for pre in prerequisites {
            /// pre[1] 是起始顶点，pre[0] 是结束顶点
            var array = graph[pre[1]]
            array.append(pre[0])
            graph[pre[1]] = array
        }
        
        /// 0: unvisited, 1: visited, -1: visiting
        var visited = Array(repeating: 0, count: numCourses)
        /// 遍历图
        for i in 0..<numCourses {
            /// 如果发现存在环，则无法完成所有课程
            if dfs(&graph, &visited, i) {
                return false
            }
        }
        
        return true
    }
    
    /// 检测有向图中以 index 为起始顶点是否存在环
    ///
    /// - Parameters:
    ///   - graph: 邻接表代表的有向图
    ///   - visited: 标记顶点访问状态
    ///   - index: 起始顶点
    /// - Returns: 有向图中是否存在环
    func dfs(_ graph: inout [[Int]], _ visited: inout [Int], _ index: Int) -> Bool {
        /// 如果一个顶点处于 visiting 状态，再通过 dfs 回到当前节点，代表有向图中存在环
        if visited[index] == -1 {
            return true
        }
        /// 避免重复递归，比如 1->2->3，2->3
        if visited[index] == 1 {
            return false
        }
        /// 标记为正在访问该 index 顶点
        visited[index] = -1
        /// 遍历 index 的所有邻接顶点
        for adjacent in graph[index] {
            if dfs(&graph, &visited, adjacent) {
                return true
            }
        }
        /// 标记该顶点已经访问过
        visited[index] = 1
        return false
    }
}
