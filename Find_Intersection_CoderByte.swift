//
//  main.swift
//  FindIntersection-CoderByte
//
//  Created by Daniel Young on 11/18/20.
//

/*
 Have the function FindIntersection(strArr) read the array of strings stored in strArr which will contain 2 elements: the first element will represent a list of comma-separated numbers sorted in ascending order, the second element will represent a second list of comma-separated numbers (also sorted). Your goal is to return a comma-separated string containing the numbers that occur in elements of strArr in sorted order. If there is no intersection, return the string false.
 Examples

 Input: ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]
 Output: 1,4,13
 Input: ["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]
 Output: 1,9,10
 */

import Foundation

// keep this function call here

let nums = findNumbers(str: readLine(strippingNewline: true)!)
print(findIntersection(nums))

func findNumbers(str: String) -> [[Int]] {
    let strOfArrs = str.components(separatedBy: "\", ")
    var intsArr = [[Int]]()
    
    strOfArrs.forEach { strOfArr in
        let nums = strOfArr.replacingOccurrences(of: "\"", with: "")
            .replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: "[", with: "")
            .replacingOccurrences(of: "]", with: "")
            .components(separatedBy: " ")
            .compactMap({ Int($0) })
        intsArr.append(nums)
    }
    
    return intsArr
}

func findIntersection(_ a: [[Int]]) -> [Int] {
    let s = a.map { Set<Int>($0) }
    let u = s[0].intersection(s[1])
    return Array(u)
}
