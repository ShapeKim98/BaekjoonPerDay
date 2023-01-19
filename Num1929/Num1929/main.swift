//
//  main.swift
//  Num1929
//
//  Created by 김도형 on 2023/01/12.
//

import Foundation

let input = readLine()?.split(separator: " ").compactMap({ value in
    Int(value)
})

let m = input?.first ?? 0
let n = input?.last ?? 0

var primeNumbers = [Int]()

for number in m...n {
    if number != 1 {
        primeNumbers.append(number)
    }
}

var bound: Int = Int(sqrt(Double(n)))

for num in 1...bound {
    if num != 1 {
        primeNumbers = primeNumbers.filter { number in
            return (number != num && number % num == 0) ? false : true
        }
    }
}

primeNumbers.forEach { number in
    print(number)
}
