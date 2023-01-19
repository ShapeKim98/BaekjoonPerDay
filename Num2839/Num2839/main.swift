//
//  main.swift
//  Num2839
//
//  Created by 김도형 on 2023/01/12.
//

import Foundation

let n = Int(readLine() ?? "") ?? 0

var sum: Int = n / 3 + 1

for x in 0...(n / 5) {
    for y in 0...(n / 3) {
        if 5 * x + 3 * y == n {
            sum = sum < x + y ? sum : x + y
        }
    }
}

print(sum == n / 3 + 1 ? -1 : sum)
