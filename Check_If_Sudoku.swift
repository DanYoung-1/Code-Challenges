//
//  main.swift
//  checkifSudoku
//
//  Created by Daniel Young on 11/11/20.
//

import Foundation

let ex1 = [[2,9,5,7,4,3,8,6,1],
           [4,3,1,8,6,5,9,2,7],
           [8,7,6,1,9,2,5,4,3],
           [3,8,7,4,5,9,2,1,6],
           [6,1,2,3,8,7,4,9,5],
           [5,4,9,2,1,6,7,3,8],
           [7,6,3,5,3,4,1,8,9],
           [9,2,8,6,7,1,3,5,4],
           [1,5,4,9,4,8,6,7,2]]

let ex2 = [[9,6,8,1,3,5,2,4,7],
           [1,3,7,8,4,2,9,5,6],
           [4,2,5,9,6,7,3,8,1],
           [7,8,2,6,1,3,4,9,5],
           [3,1,4,5,9,8,7,6,2],
           [5,9,6,2,7,4,8,1,3],
           [8,7,9,3,5,1,6,2,4],
           [6,4,1,7,2,9,5,3,8],
           [2,5,3,4,8,6,1,7,9]]

let ex3 = [[9,6,8,1,3,5,2,4,7],
           [1,3,7,3,4,2,9,5,6],
           [4,2,5,9,6,7,3,8,1],
           [7,8,2,6,1,7,4,9,5],
           [3,1,4,5,9,8,7,6,2],
           [5,9,6,2,7,4,8,1,3],
           [8,7,9,3,5,1,6,2,4],
           [6,4,1,7,2,9,5,3,8],
           [8,5,3,4,8,6,1,7,9]]


func checkIfValidSudoku(ex: [[Int]]) -> Bool {
    if !checkRows(ex: ex) {
        return false
    }
    let exInv = invertBoard(ex: ex)
    if !checkRows(ex: exInv) {
        return false
    }
    if !checkNonets(ex: ex) {
        return false
    }
    return true
}

func checkRows(ex: [[Int]]) -> Bool {
    for row in ex {
        if !checkRowContains1To9(row: row) {
            return false
        }
        if 45 != row.reduce(0,+) {
            return false
        }
    }
    return true
}

func checkRowContains1To9(row: [Int]) -> Bool {
    var arr = Array(1...9)
    row.forEach { item in
        arr = arr.filter { $0 != item }
    }
    return arr.isEmpty
}

func invertBoard(ex: [[Int]]) -> [[Int]] {
    var exInv = ex
    for (i, col) in ex.enumerated() {
        for (j, rowNum) in col.enumerated() {
            exInv[j][i] = rowNum
        }
    }
    return exInv
}

func checkNonets(ex: [[Int]]) -> Bool {
    let r = [0,3,6]
    for i in r {
        for j in r {
            if !check3x3AddsUpAndContains1To9(ex: ex, range1: i...i+2, range2: j...j+2) {
                return false
            }
        }
    }
    return true
}

func check3x3AddsUpAndContains1To9(ex: [[Int]], range1: ClosedRange<Int>, range2: ClosedRange<Int>) -> Bool {
    var total = 0
    var arr = Array(1...9)
    for col in ex[range1] {
        total += col[range2].reduce(0,+)
        col[range2].forEach { item in
            arr = arr.filter { $0 != item }
            print(arr)
        }
    }
    return total == 45 && arr.isEmpty ? true : false
}

/*
 x[0...2][0...2]  x[0...2][3...5]  x[0...2][6...8]
 x[3...5][0...2]  x[3...5][3...5]  x[3...5][6...8]
 x[6...8][0...2]  x[6...8][3...5]  x[6...8][6...8]
*/

print(checkIfValidSudoku(ex: ex2))
    









