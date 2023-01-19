//
//  main.swift
//  Num1654
//
//  Created by 김도형 on 2023/01/01.
//

import Foundation

var input = readLine()?.components(separatedBy: " ")

guard let lineNumAndCutNum = input else {
    fatalError()
}

let k = Int(lineNumAndCutNum[0]) ?? 0
let n = Int(lineNumAndCutNum[1]) ?? 0

var lines = [Int]()

for _ in 0..<k {
    let line = readLine()
    
    if let length = line {
        lines.append(Int(length) ?? 0)
    }
}

guard var maxLength = lines.max() else {
    fatalError()
}

var cutedNum: Int = 0
var tempLength: Int = maxLength
var result: Int = 0

while(true) {
    lines.forEach {
        let num = $0 / tempLength
        cutedNum += num
    }
    
    if cutedNum >= n {
        if result < tempLength {
            result = tempLength
            tempLength += (maxLength - tempLength) / 2
        } else {
            break
        }
    } else {
        if tempLength - result == 1 {
            break
        }
        
        maxLength = tempLength
        tempLength -= (tempLength - result) / 2
    }
    
    cutedNum = 0
}

print(result)

