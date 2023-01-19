//
//  main.swift
//  Num10828
//
//  Created by 김도형 on 2023/01/05.
//

import Foundation

class Stack {
    var element = [Int]()
    var t: Int = -1
    
    func push(_ input: Int) {
        element.append(input)
        t += 1
    }
    
    func pop() -> Int {
        if t == -1 {
            return t
        } else {
            let value = element[t]
            element.remove(at: t)
            t -= 1
            
            return value
        }
    }
    
    func size() -> Int {
        return t + 1
    }
    
    func empty() -> Int {
        return t == -1 ? 1 : 0
    }
    
    func top() -> Int {
        return t == -1 ? -1 : element[t]
    }
}

let input = readLine() ?? "0"

let n: Int = Int(input) ?? 0

var stack: Stack = Stack()

for _ in 0..<n {
    let input = readLine() ?? ""
    
    if input.contains(" ") {
        let command = input.split(separator: " ")
        
        guard let value = Int(command[1]) else {
            fatalError()
        }
        
        stack.push(value)
    } else {
        switch input {
            case "pop":
                print(stack.pop())
                break
            case "size":
                print(stack.size())
                break
            case "empty":
                print(stack.empty())
                break
            case "top":
                print(stack.top())
            default:
                break
        }
    }
}

