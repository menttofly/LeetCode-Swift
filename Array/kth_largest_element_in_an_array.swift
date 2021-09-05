//
//  kth_largest_element_in_an_array.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2019/3/10.
//  Copyright © 2019 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/kth-largest-element-in-an-array/
 * Primary idea: 使用快速排序的 partition 算法, 让 divide 的位置不断逼近第 k 大元素
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class KthLargestElementInAnArray {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, right = nums.count - 1, kth = -1, nums = nums
        while true {
            let divide = partition(&nums, left, right)
            /// 不断划分，让 divide 逼近第 k 个元素（k-1）
            if divide == k - 1 {
                kth = nums[divide]
                break
            }
            if divide > k - 1 {
                /// The kth number is in left part.
                right = divide - 1
            } else {
                /// The kth number is in right part.
                left = divide + 1
            }
        }
        return kth
    }
    
    /// 快速排序 partition 算法，划分为 [left..l), l, (l..right] 三部分
    /// 返回索引 l
    private func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        var l = left, r = right
        /// 选择第一个元素作为枢纽元
        let pivot = nums[left]
        
        while l < r {
            /// 跳过小等于 pivot 的元素，寻找第一个大于 pivot 的元素
            while l < r && nums[r] <= pivot {
                r -= 1
            }
            /// 跳过大等于 pivot 的元素，寻找第一个小于 pivot 的元素
            while l < r && nums[l] >= pivot {
                l += 1
            }
            /// 交换 l 和 r 的元素到各自子集中
            nums.swapAt(l, r)
        }
        /// 恢复枢纽元的位置，划分后 [left..l) 都大于 pivot，(l..right] 都小于 pivot
        nums.swapAt(left, l)
        return l
    }
}

/**
 * Primary idea: Building a min-heap which size is k, then remove current min if meet a number biger than current min.
 * Note: Heap is usually used at assive data processing problem.
 *
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */
class KthLargestElementInAnArrayHeapSort {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        buildHeap(&nums, k)
        for i in (k + 1)..<nums.count {
            /// If number larger than current min, then min is not the kth so put it out the min-heap.
            if nums[i] > nums[0] {
                nums.swapAt(i, 0)
                downFilter(&nums, k, 0)
            }
        }
        return nums[0]
    }
    
    /// Since we don't have min-heap data structure as C++ STL, so write one by ourselves.
    ///
    /// - Parameters:
    ///   - nums: origin array
    ///   - size: min heap's size
    private func buildHeap(_ nums: inout [Int], _ size: Int) -> Void {
        var i = size / 2
        while i >= 0 {
            downFilter(&nums, size, i)
            i -= 1
        }
    }
    
    /// Heap's nature destroyed at index, so do down filter the empty hole.
    ///
    /// - Parameters:
    ///   - index: the position heap's nature is destroyed.
    private func downFilter(_ nums: inout [Int], _ size: Int, _ index: Int) -> Void {
        var child = 2 * index + 1, index = index
        let temp = nums[index]
        while 2 * index < size {
            /// Left child of position i.
            child = 2 * index + 1
            if child < size - 1 && nums[child + 1] < nums[child] {
                child += 1
            }
            if nums[child] < temp {
                nums[index] = nums[child]
            } else {
                break
            }
            index = child
        }
        /// Put the number to right position to restore heap's nature.
        nums[index] = temp
    }
}
