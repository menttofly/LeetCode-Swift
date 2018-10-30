//
//  MedianOfTwoSortedArrays.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/30.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums = [Int]()
        var i = 0, j = 0, k = 0
        while i < nums1.count || j < nums2.count {
            if i < nums1.count && j < nums2.count {
                if nums1[i] < nums2[j] {
                    nums.insert(nums1[i], at: k)
                    i += 1
                } else {
                    nums.insert(nums2[j], at: k)
                    j += 1
                }
            } else if i < nums1.count {
                nums.insert(nums1[i], at: k)
            } else {
                nums.insert(nums2[j], at: k)
            }
            k += 1
        }
        if k % 2 != 0 {
            return Double(nums[k / 2])
        } else {
            return (Double(nums[k / 2 - 1]) + Double(nums[k / 2])) / 2.0
        }
    }
}
