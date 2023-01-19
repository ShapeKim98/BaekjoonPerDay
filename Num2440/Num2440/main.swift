//
//  main.swift
//  Num2440
//
//  Created by 김도형 on 2023/01/11.
//

import Foundation

let n = Int(readLine() ?? "") ?? 0

for i in (1...n).reversed() {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print("")
}
