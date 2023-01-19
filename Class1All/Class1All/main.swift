//
//  main.swift
//  Class1All
//
//  Created by 김도형 on 2023/01/05.
//

import Foundation

//1000
//guard let operands = readLine()?.split(separator: " ") else {
//    fatalError()
//}
//
//if let lhs = Int(operands[0]), let rhs = Int(operands[1]) {
//    print(lhs + rhs)
//}

//1001
//guard let operands = readLine()?.split(separator: " ") else {
//    fatalError()
//}
//
//if let lhs = Int(operands[0]), let rhs = Int(operands[1]) {
//    print(lhs - rhs)
//}

//1008
//guard let operands = readLine()?.split(separator: " ") else {
//    fatalError()
//}
//
//if let lhs = Double(operands[0]), let rhs = Double(operands[1]) {
//    print(lhs / rhs)
//}

//1330
//guard let operands = readLine()?.split(separator: " ") else {
//    fatalError()
//}
//
//if let lhs = Int(operands[0]), let rhs = Int(operands[1]) {
//    if lhs == rhs {
//        print("==")
//    } else {
//        print(lhs > rhs ? ">" : "<")
//    }
//}

//1546
//var input = readLine() ?? ""
//let scoreCount = Int(input) ?? 0
//
//input = readLine() ?? ""
//
//let scores = input.split(separator: " ").compactMap { score in
//    Double(score)
//}
//
//let maxScore = scores.max() ?? 0
//
//let result = scores.map { score in
//    score / maxScore * 100
//}
//
//var sum: Double = 0
//
//result.forEach { score in
//    sum += score
//}
//
//print(sum / Double(result.count))

//2438
//let input = readLine() ?? ""
//
//guard let count = Int(input) else {
//    fatalError()
//}
//
//for i in 1...count {
//    var stars: String =  ""
//    for _ in 0..<i {
//        stars += "*"
//    }
//    print(stars)
//}

//2439
//let count = Int(readLine() ?? "") ?? 0
//
//for i in 1...count {
//    var stars: String = ""
//    for _ in 0..<count - i {
//        stars += " "
//    }
//    for _ in 0..<i {
//        stars += "*"
//    }
//
//    print(stars)
//}

//2475
//let input = readLine() ?? ""
//
//let numbers = input.split(separator: " ").compactMap { number in
//    Int(number)
//}
//
//let powNumbers = numbers.map { number in
//    number * number
//}
//
//var sum: Int = 0
//
//powNumbers.forEach { number in
//    sum += number
//}
//
//print(sum % 10)

//2557
//print("Hello World!")

//2562
//var values = [Int]()
//
//for _ in 0..<9 {
//    values.append(Int(readLine() ?? "") ?? 0)
//}
//
//let max: Int = values.max() ?? 0
//
//print(max)
//print((values.firstIndex(of: max) ?? 0) + 1)

//2577
//let a: Int = Int(readLine() ?? "") ?? 0
//let b: Int = Int(readLine() ?? "") ?? 0
//let c: Int = Int(readLine() ?? "") ?? 0
//
//let result = String(a * b * c)
//var number: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//
//result.forEach { num in
//    switch String(num) {
//        case "0":
//            number[0] += 1
//            break
//        case "1":
//            number[1] += 1
//            break
//        case "2":
//            number[2] += 1
//            break
//        case "3":
//            number[3] += 1
//            break
//        case "4":
//            number[4] += 1
//            break
//        case "5":
//            number[5] += 1
//            break
//        case "6":
//            number[6] += 1
//            break
//        case "7":
//            number[7] += 1
//            break
//        case "8":
//            number[8] += 1
//            break
//        case "9":
//            number[9] += 1
//            break
//        default:
//            break
//    }
//}
//
//number.forEach { num in
//    print(num)
//}

//2675
//let count = Int(readLine() ?? "") ?? 0
//
//for _ in 0..<count {
//    let input = readLine()?.split(separator: " ") ?? []
//    var string: String = ""
//
//    input[1].forEach { char in
//        for _ in 0..<(Int(input[0]) ?? 0) {
//            string += String(char)
//        }
//    }
//
//    print(string)
//}

//2739
//let num = Int(readLine() ?? "") ?? 0
//
//for i in 1...9 {
//    print("\(num) * \(i) = \(num * i)")
//}

//2741
//let num = Int(readLine() ?? "") ?? 0
//
//for i in 1...num {
//    print(i)
//}

//2742
//let num = Int(readLine() ?? "") ?? 0
//
//for i in (1...num).reversed() {
//    print(i)
//}

//2753
//let year = Int(readLine() ?? "") ?? 0
//
//if year % 4 == 0, year % 100 != 0 {
//    print(1)
//} else if year % 400 == 0 {
//    print(1)
//} else {
//    print(0)
//}

//2884
//let input = readLine()?.split(separator: " ") ?? []
//
//var hour = Int(input[0]) ?? 0
//if hour == 0 {
//    hour = 24
//}
//
//var minute = Int(input[1]) ?? 0
//
//let overallMinute: Int = (hour * 60 + minute) - 45
//
//hour = overallMinute / 60 % 24
//minute = overallMinute % 60
//
//print("\(hour) \(minute)")

//2908
//let input = readLine()?.split(separator: " ") ?? []
//
//var reversedInput = [String]()
//
//input.forEach { input in
//    var reverse: String = ""
//
//    input.forEach { num in
//        reverse = String(num) + reverse
//    }
//
//    reversedInput.append(reverse)
//}
//
//let reversedValue = reversedInput.compactMap { value in
//    Int(value)
//}
//
//print(reversedValue.max() ?? 0)

//2920
//let input = readLine()?.split(separator: " ").compactMap({ number in
//    Int(number)
//})
//
//guard let numbers = input else {
//    fatalError()
//}
//
//var temp: Int = numbers.first ?? 0
//var result: String = ""
//
//for number in numbers {
//    if temp < number {
//        if result == "descending" {
//            result = "mixed"
//            break
//        } else {
//            result = "ascending"
//        }
//    } else if temp > number {
//        if result == "ascending" {
//            result = "mixed"
//            break
//        } else {
//            result = "descending"
//        }
//    } else {
//        continue
//    }
//
//    temp = number
//}
//
//print(result)

//3052
//var inputs = [String]()
//for _ in 0..<10 {
//    let input = readLine() ?? ""
//    inputs.append(input)
//}
//
//let intInputs = inputs.compactMap {
//    Int($0)
//}
//
//var remainders = Set<Int>()
//
//intInputs.forEach { value in
//    remainders.insert(value % 42)
//}
//
//print(remainders.count)

//9498
//var score = Int(readLine() ?? "") ?? 0
//
//switch score {
//    case 90...100:
//        print("A")
//        break
//    case 80...89:
//        print("B")
//        break
//    case 70...79:
//        print("C")
//        break
//    case 60...69:
//        print("D")
//        break
//    default:
//        print("F")
//        break
//}

//10171
//print("\\    /\\")
//print(" )  ( ')")
//print("(  /  )")
//print(" \\(__)|")

//10172
//print(#"|\_/|"#)
//print(#"|q p|   /}"#)
//print(#"( 0 )"""\"#)
//print(#"|"^"`    |"#)
//print(#"||_/=\\__|"#)

//10809
//let input = readLine() ?? ""
//
//var string = [String]()
//
//input.forEach { char in
//    string.append(String(char))
//}
//
//for asciiCode in 97...122 {
//    let alphabet: String = String(UnicodeScalar(UInt8(asciiCode)))
//    print((string.firstIndex(of: alphabet) ?? -1), terminator: " ")
//}

//10818
//let _ = readLine()
//let values = readLine()?.split(separator: " ").compactMap({ value in
//    Int(value)
//})
//print("\(values?.min() ?? 0) \(values?.max() ?? 0)")

//10869
//let input = readLine()?.split(separator: " ").compactMap({ operands in
//    Int(operands)
//}) ?? []
//
//print("\(input[0] + input[1])\n\(input[0] - input[1])\n\(input[0] * input[1])\n\(input[0] / input[1])\n\(input[0] % input[1])")

//10871
//let input = readLine()?.split(separator: " ").compactMap({ value in
//    Int(value)
//}) ?? []
//
//let result = readLine()?.split(separator: " ").compactMap({ value in
//    Int(value)
//}).filter({ value in
//    return value < input[1] ? true : false
//})
//
//result?.forEach({ value in
//    print(value, terminator: " ")
//})

//10950
//for _ in 0..<(Int(readLine() ?? "") ?? 0) {
//    let operands = readLine()?.split(separator: " ").compactMap({ operand in
//        Int(operand)
//    }) ?? []
//    print(operands[0] + operands[1])
//}

//10951
//while (true) {
//    guard let operands = readLine()?.split(separator: " ").compactMap({ operand in
//        Int(operand)
//    }) else {
//        break
//    }
//
//    print(operands[0] + operands[1])
//}

//10952
//while (true) {
//    if let operands = readLine()?.split(separator: " ").compactMap({ operand in
//        Int(operand)
//    }), operands[0] != 0 && operands[1] != 0 {
//        print(operands[0] + operands[1])
//    } else {
//        break
//    }
//}

//10998
//let operands = readLine()?.split(separator: " ").compactMap({ operand in
//    Int(operand)
//}) ?? []
//
//print(operands[0] * operands[1])

//11654
//print(Character(readLine() ?? "").asciiValue ?? 0)

//11720
let _ = readLine()
var sum: Int = 0
readLine()?.forEach({ num in
    sum += Int(String(num)) ?? 0
})
print(sum)
