//
//  main.swift
//  Num8958
//
//  Created by 김도형 on 2023/01/03.
//

import Foundation

let questionNum = Int(readLine() ?? "") ?? 0

var answers = [String]()

for _ in 1...Int(questionNum) {
    answers.append(readLine() ?? "")
}

answers.forEach { answer in
    var score: Int = 0
    var continousPoint: Int = 0
    
    answer.forEach { result in
        if result == "O" {
            continousPoint += 1
            score += continousPoint
        } else {
            continousPoint = 0
        }
    }
    
    print(score)
}
