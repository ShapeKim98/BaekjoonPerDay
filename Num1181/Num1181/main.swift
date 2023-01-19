//
//  main.swift
//  Num1181
//
//  Created by 김도형 on 2023/01/11.
//

import Foundation

var words = Set<String>()
let n = Int(readLine() ?? "") ?? 0

for _ in 0..<n {
    words.insert(readLine() ?? "")
}

let sortedWords = words.sorted { lhs, rhs in
    if lhs.count < rhs.count {
        return true
    } else {
        if lhs.count == rhs.count {
            return lhs < rhs ? true : false
        } else {
            return false
        }
    }
}

sortedWords.forEach { word in
    print(word)
}

