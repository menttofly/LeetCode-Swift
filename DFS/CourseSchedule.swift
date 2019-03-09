//
//  CourseSchedule.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/9.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/course-schedule/
 * Primary idea: If there is a ring in the directed graph by DFS, then can's finish all courses.
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */
class CourseSchedule {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        /// Building graph by adjacency table.
        var graph = Array(repeating: [Int](), count: numCourses)
        for pre in prerequisites {
            /// pre[1] is start in vertex, pre[0] is end.
            var array = graph[pre[1]]
            array.append(pre[0])
            graph[pre[1]] = array
        }
        
        /// 0: unvisited, 1: visited, -1: visiting
        var visited = Array(repeating: 0, count: numCourses)
        /// Traversing the adjacency table
        for i in 0..<numCourses {
            /// Find a cycle, then we can't finish all course.
            if dfs(&graph, &visited, i) {
                return false
            }
        }
        return true
    }
    
    
    /// Determine if there is a ring in the directed graph that start with node at index.
    ///
    /// - Parameters:
    ///   - graph: graph represented by adjacency table
    ///   - visited: mark visit state when doing dfs.
    ///   - index: adjacency table's index.
    /// - Returns: whether there is a ring in graph.
    func dfs(_ graph: inout [[Int]], _ visited: inout [Int], _ index: Int) -> Bool {
        /// If an node is visiting when dfs to this element, that means there is cycle in directed graph
        if visited[index] == -1 {
            return true
        }
        /// This node already visted.
        if visited[index] == 1 {
            return false
        }
        visited[index] = -1
        /// All adjacent node for node at index.
        for adjacent in graph[index] {
            if dfs(&graph, &visited, adjacent) {
                return true
            }
        }
        /// Mark node as visited.
        visited[index] = 1
        return false
    }
}
