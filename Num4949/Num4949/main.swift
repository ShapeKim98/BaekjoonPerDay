//
//  main.swift
//  Num4949
//
//  Created by 김도형 on 2023/01/13.
//

import Foundation

while let str = readLine(), str != "." {
    var temp = [String]()
    var isCorrect: Bool = true
    
    strLoop: for (_, char) in str.enumerated() {
        let strChar = String(char)
        switch strChar {
            case "(":
                temp.append("(")
                isCorrect = false
                break
            case ")":
                guard let elem = temp.popLast(), elem == "(" else {
                    isCorrect = false
                    break strLoop
                }
                isCorrect = true
                break
            case "[":
                temp.append("[")
                isCorrect = false
                break
            case "]":
                guard let elem = temp.popLast(), elem == "[" else {
                    isCorrect = false
                    break strLoop
                }
                isCorrect = true
                break
            default:
                break
        }
    }
    
    if isCorrect {
        if temp.count == 0 {
            print("yes")
        } else {
            print("no")
        }
    } else {
        print("no")
    }
}
