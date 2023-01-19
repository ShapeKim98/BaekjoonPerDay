//
//  main.swift
//  Num10866
//
//  Created by 김도형 on 2023/01/10.
//

import Foundation

class Deque {
    var elements = [Int]()
    
    func pushFront(_ x: Int) {
        elements.insert(x, at: 0)
    }
    
    func pushBack(_ x: Int) {
        elements.append(x)
    }
    
    func popFront() -> Int {
        if let x = elements.first {
            elements.remove(at: 0)
            return x
        } else {
            return -1
        }
    }
    
    func popBack() -> Int {
        if let x = elements.popLast() {
            return x
        } else {
            return -1
        }
    }
    
    func empty() -> Int {
        return elements.isEmpty ? 1 : 0
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
var deque = Deque()

for _ in 0..<n {
    let input = readLine() ?? ""
    
    if input.contains(" ") {
        let command = input.split(separator: " ")
        
        let value = Int(command.last ?? "") ?? 0
        
        switch command.first {
            case "push_front":
                deque.pushFront(value)
                break
            case "push_back":
                deque.pushBack(value)
                break
            default:
                break
        }
    } else {
        switch input {
            case "pop_front":
                print(deque.popFront())
                break
            case "pop_back":
                print(deque.popBack())
                break
            case "size":
                print(deque.elements.count)
                break
            case "empty":
                print(deque.empty())
                break
            case "front":
                print(deque.front())
                break
            case "back":
                print(deque.back())
                break
            default:
                break
        }
    }
}
