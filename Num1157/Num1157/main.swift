//
//  main.swift
//  Num1157
//
//  Created by 김도형 on 2023/01/02.
//

import Foundation

struct CharAndCount {
    var character: Character
    var count: Int = 0
}

guard let input = readLine() else {
    fatalError()
}

let string = input.uppercased()
var characters = [CharAndCount]()

for i in 65...90 {
    if let char = UnicodeScalar(i) {
        characters.append(CharAndCount(character: Character(char)))
    }
}

string.forEach { char in
    for i in 0..<characters.count {
        if characters[i].character == char {
            characters[i].count += 1
        }
    }
}

let max = characters.max { lhs, rhs in
    return lhs.count < rhs.count
}
if let max = max {
    var maxCount: Int = 0
    
    characters.forEach { character in
        if character.count == max.count {
            maxCount += 1
        }
    }
    
    print(maxCount > 1 ? "?" : max.character)
}
