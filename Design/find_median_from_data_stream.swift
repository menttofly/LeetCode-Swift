//
//  find_median_from_data_stream.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2021/8/11.
//  Copyright © 2021 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/find-median-from-data-stream/
 * Primary idea: 通过中位数将元素划分到两个堆（大小之差不超过1，large 堆元素都大于 small 堆），通过 max-heap 与 min-heap 的堆顶元素求平均值
 *
 * Time Complexity: addNum is O(logn), findMedian is O(1)
 */
class MedianFinder {

    var small = Heap<Int>(order: >)  /// max-heap
    var large = Heap<Int>(order: <)  /// min-heap
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    /// 保持两个堆元素之差不超过 1，同时保持 small 堆中的元素均比 large 堆小
    /// - Parameter num: 待插入的元素
    func addNum(_ num: Int) {
        if small.size >= large.size {
            /// 要往 large 堆插入时先插入 small 堆，获取其堆顶元素（small 的最大值），再插入 large 堆中，保证 large 堆元素都大等于 small 堆
            small.insert(num)
            large.insert(small.remove()!)
        } else {
            large.insert(num)
            small.insert(large.remove()!)
        }
    }
    
    /// 如果元素个数为奇数取两个堆中元素个数多的，为偶数则取两个的堆顶元素的平均值
    /// - Returns: 中位数
    func findMedian() -> Double {
        if small.size > large.size {
            return Double(small.peek()!)
        } else if large.size > small.size {
            return Double(large.peek()!)
        } else {
            return Double(small.peek()! + large.peek()!) / 2.0
        }
    }
}
