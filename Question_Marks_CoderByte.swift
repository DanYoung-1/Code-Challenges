//
//  main.swift
//  QuestionMarks-CoderByte
//
//  Created by Daniel Young on 11/20/20.
//

/*
Questions Marks

Have the function QuestionsMarks(str) take the str string parameter, which will contain single digit numbers, letters, and question marks, and check if there are exactly 3 question marks between every pair of two numbers that add up to 10. If so, then your program should return the string true, otherwise it should return the string false. If there aren't any two numbers that add up to 10 in the string, then your program should return false as well.

For example: if str is "arrb6???4xxbl5???eee5" then your program should return true because there are exactly 3 question marks between 6 and 4, and 3 question marks between 5 and 5 at the end of the string.
Examples

Input: "aa6?9"
Output: false
Input: "acc?7??sss?3rr1??????5"
Output: true
Tags


*/

import Foundation

let sLine = readLine(strippingNewline: true)!

let nums = sLine.filter { $0.isNumber }
	.compactMap({ Int(String($0)) })

var numsArr = [[Int]]()
numsArr.append([Int]())
for (_, num) in nums.enumerated() {
	if numsArr[numsArr.count-1].count >= 2 {
		numsArr.append([Int]())
	}
	numsArr[numsArr.count-1].append(num)
}

if numsArr.count % 2 != 0 {
	numsArr.removeLast()
}

for (i, pair) in numsArr.enumerated() {
	if pair.first! + pair.last! != 10 {
		numsArr.remove(at: i)
	}
}

if numsArr.isEmpty {
	print(false)
	exit(1)
}

for (_, pair) in numsArr.enumerated() {
	let i = sLine.firstIndex(of: Character(String(pair.first!)))!
	let j = sLine.firstIndex(of: Character(String(pair.last!)))!
	let sub = sLine[i..<j]

	let res = sub.reduce(0, { (r, c) -> Int in
		c == "?" ? r + 1 : r
	})
	if res != 3 {
		print(false)
		exit(1)
	}
}

print(true)

extension String {
		subscript(_ range: CountableRange<Int>) -> String {
				let start = index(startIndex, offsetBy: max(0, range.lowerBound))
				let end = index(start, offsetBy: min(self.count - range.lowerBound,
																						 range.upperBound - range.lowerBound))
				return String(self[start..<end])
		}

		subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
				let start = index(startIndex, offsetBy: max(0, range.lowerBound))
				 return String(self[start...])
		}
}
