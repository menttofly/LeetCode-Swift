//
//  MedianOfTwoSortedArrays.swift
//  LeetCode-Swift
//
//  Created by menttofly on 2018/10/30.
//  Copyright © 2018年 menttofly. All rights reserved.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/median-of-two-sorted-arrays/
 * Primary idea: Converting the problem into a small k-th element in the merged array by divide and conquer
 *
 * Time Complexity: O(log(m+n)), Space Complexity: O(1)
 */
class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        let mid = count >> 1
        if count % 2 != 0 {
            return Double(findKth(nums1, nums2, mid + 1))
        } else {
            return Double(findKth(nums1, nums2, mid) + findKth(nums1, nums2, mid + 1)) / 2.0
        }
    }
    
    func findKth(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        if nums1.count == 0 {
            return nums2[k - 1]
        }
        if nums2.count == 0 {
            return nums1[k - 1]
        }
        if k == 1 {
            return min(nums1[0], nums2[0])
        }
        let mid1 = min(k / 2, nums1.count), mid2 = min(k / 2, nums2.count)
        if nums1[mid1 - 1] < nums2[mid2 - 1] {
            return findKth(Array(nums1[mid1...]), nums2, k - mid1)
        } else {
            return findKth(nums1, Array(nums2[mid2...]), k - mid2)
        }
    }
}

/**
 * Primary idea: Merge these two sorted arrays into a new array, then find it's median value
 * Note: This solution can't pass the test case because of 'Time Limit Exceeded'
 *
 * Time Complexity: O(m+n), Space Complexity: O(m+n)
 */
fileprivate class Solution {
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
