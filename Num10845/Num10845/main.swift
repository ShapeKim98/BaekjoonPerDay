//
//  main.swift
//  Num10845
//
//  Created by 김도형 on 2023/01/09.
//

import Foundation

class Queue {
    var elements = [Int]()
    
    func push(_ x: Int) {
        elements.append(x)
    }
    
    func pop() -> Int {
        if let x = elements.first {
            elements.remove(at: 0)
            return x
        } else {
            return -1
        }
    }
    
    func empty() -> Int {
        return elements.count == 0 ? 1 : 0
    }
    
    func front() -> Int {
        if let x = elements.first {
            return x
        } else {
            return -1
        }
    }
    
    func back() -> Int {
        if let x = elements.last {
            return x
        } else {
            return -1
        }
    }
}

var input = Int(readLine() ?? "") ?? 0
let n = input
var queue: Queue = Queue()

for _ in 0..<n {
    let input = readLine() ?? ""
    
    if input.contains(" ") {
        let command = input.split(separator: " ")
        
        guard let value = Int(command.last ?? "") else {
            fatalError()
        }
        
        queue.push(value)
    } else {
        switch input {
            case "pop":
                print(queue.pop())
                break
            case "size":
                print(queue.elements.count)
                break
            case "empty":
                print(queue.empty())
                break
            case "front":
                print(queue.front())
                break
            case "back":
                print(queue.back())
                break
            default:
                break
        }
    }
}
