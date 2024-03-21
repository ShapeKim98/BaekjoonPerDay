//
//  main.swift
//  Num10807
//
//  Created by 김도형 on 2023/01/27.
//

import Foundation

let _ = readLine()
let nums = readLine()!.split(separator: " ")
let value = readLine()!
print(nums.filter{$0 == value}.count)
