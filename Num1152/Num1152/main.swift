//
//  main.swift
//  Num1152
//
//  Created by 김도형 on 2023/01/01.
//

import Foundation

guard let input = readLine() else {
    fatalError()
}

var words = input.components(separatedBy: " ")

var count: Int = 0

words.forEach { word in
    count += word != "" ? 1 : 0
}

print(count)
