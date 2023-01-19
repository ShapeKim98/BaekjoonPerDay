//
//  main.swift
//  Num2436
//
//  Created by 김도형 on 2023/01/08.
//

import Foundation

let input = readLine()?.split(separator: " ").compactMap({ value in
    Int(value)
}) ?? []

let gcd = input.first ?? 0
let lcm = input.last ?? 0
var lhs: Int = gcd
var rhs: Int = lcm
var temp: Int = lcm - gcd

func gcd(_ lhs: Int, _ rhs: Int) -> Int {
    var lhs = lhs
    var rhs = rhs
    var remainder = rhs % lhs
    
    while (remainder != 0) {
        rhs = lhs
        lhs = remainder
        remainder = rhs % lhs
    }
    
    return lhs
}

func lcm(_ lhs: Int, _ rhs: Int) -> Int {
    return lhs * rhs / gcd(lhs, rhs)
}

while(true) {
    if temp > 0 {
        lhs += gcd
        rhs = lcm * gcd / lhs
        if gcd(lhs, rhs) == gcd, lcm(lhs, rhs) == lcm {
            temp = rhs - lhs
        }
    } else {
        break
    }
}

print("\(rhs) \(lhs)")
