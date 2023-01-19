//
//  main.swift
//  Num2108
//
//  Created by 김도형 on 2023/01/14.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() }
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() }
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

var dict = [Int: Int]()
var list = [Int]()
let fileIO = FileIO()
let n = fileIO.readInt()
for _ in 0..<n {
    let key = fileIO.readInt()
    list.append(key)
    if let index = dict.index(forKey: key) {
        let value = dict[index].value + 1
        dict.updateValue(value, forKey: key)
    } else {
        dict.updateValue(1, forKey: key)
    }
}
list.sort()

var sum: Int = 0
var median: Int = 0
var numsAndCounts = dict.sorted { lhs, rhs in
    return lhs.key < rhs.key
}.sorted { lhs, rhs in
    return lhs.value > rhs.value
}.filter { elem in
    return elem.value == dict.max { lhs, rhs in
        return lhs.value < rhs.value
    }?.value
}

var range: Int = (list.max() ?? 0) - (list.min() ?? 0)

for (index, num) in list.enumerated() {
    if index == n / 2 {
        median = num
    }

    sum += num
}

var average: Int = Int(round(Double(sum) / Double(n)))

print(average)
print(median)
print(numsAndCounts.count == 1 ? numsAndCounts[0].key : numsAndCounts[1].key)
print(range)
