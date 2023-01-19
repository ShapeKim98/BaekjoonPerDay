//
//  main.swift
//  Num1874
//
//  Created by 김도형 on 2023/01/11.
//

import Foundation

var stack = [Int]()
var sequence = [Int]()
var result = [Int]()
var operations = [String]()
var value: Int = 1

let n = Int(readLine() ?? "") ?? 0

for _ in 0..<n {
    sequence.append(Int(readLine() ?? "") ?? 0)
}

func appendStack(_ value: inout Int) {
    stack.append(value)
    value += 1
    operations.append("+")
}

func appendResult(_ x: Int) {
    result.append(x)
    operations.append("-")
}

while value <= n {
    sequence.forEach { elem in
        if elem >= value {
            while elem >= value {
                appendStack(&value)
            }
            
            if let x = stack.popLast() {
                appendResult(x)
            }
        } else if elem < value {
            while true {
                guard let x = stack.popLast() else {
                    break
                }
                appendResult(x)
                
                if x == elem {
                    break
                }
            }
        }
    }
}

while(true) {
    guard let x = stack.popLast() else {
        break
    }
    appendResult(x)
}

if result != sequence {
    print("NO")
} else {
    operations.forEach { operation in
        print(operation)
    }
}
