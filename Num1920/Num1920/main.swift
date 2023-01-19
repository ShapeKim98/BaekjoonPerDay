//
//  main.swift
//  Num1920
//
//  Created by 김도형 on 2023/01/12.
//

import Foundation

let _ = Int(readLine() ?? "") ?? 0
let list = readLine()?.split(separator: " ").compactMap({ elem in
    Int(elem)
}) ?? []

var listSet = Set<Int>()
list.forEach { elem in
    listSet.insert(elem)
}

let _ = Int(readLine() ?? "") ?? 0
let elemToFindList = readLine()?.split(separator: " ").compactMap({ elem in
    Int(elem)
}) ?? []

elemToFindList.forEach { elem in
    print(listSet.contains(elem) ? 1 : 0)
}
