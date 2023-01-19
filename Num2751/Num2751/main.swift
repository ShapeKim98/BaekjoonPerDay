//
//  main.swift
//  Num2751
//
//  Created by 김도형 on 2023/01/12.
//

import Foundation

let n = Int(readLine() ?? "") ?? 0
var list = [Int]()

for _ in 0..<n {
    list.append(Int(readLine() ?? "") ?? 0)
}

list.sort()

list.forEach { elem in
    print(elem)
}
