//
//  main.swift
//  Num2805
//
//  Created by 김도형 on 2023/01/12.
//

import Foundation

let input = readLine()?.split(separator: " ").compactMap({ value in
    Int(value)
})

let m = input?.last ?? 0

let treeHeight = readLine()?.split(separator: " ").compactMap({ height in
    Int(height)
}) ?? []

var maxHeight = treeHeight.max() ?? 0
var minHeight: Int = 0

var currentHeight: Int = maxHeight
var resultHeight: Int = 0
var diffHeight: Int

while maxHeight - minHeight > 1 {
    var sum: Int = 0
    
    treeHeight.forEach { height in
        sum += (height - currentHeight > 0) ? height - currentHeight : 0
    }
    
    diffHeight = m - sum
    
    if diffHeight > 0 {
        maxHeight = currentHeight
        currentHeight -= (currentHeight - minHeight) / 2
    } else if diffHeight < 0 {
        minHeight = currentHeight
        resultHeight = currentHeight
        currentHeight += (maxHeight - currentHeight) / 2
    } else {
        resultHeight = currentHeight
        break
    }
}

print(resultHeight)
