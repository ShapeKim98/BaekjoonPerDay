//
//  main.swift
//  Num1043
//
//  Created by 김도형 on 2023/01/14.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
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
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()

let n = fileIO.readInt()
let m = fileIO.readInt()

let knowTruthCount = fileIO.readInt()
var knowTruth = Set<Int>()
for _ in 0..<knowTruthCount {
    knowTruth.insert(fileIO.readInt())
}

var parties = [Set<Int>]()
for _ in 0..<m {
    let partyNumber = fileIO.readInt()
    var partyMember = Set<Int>()
    for _ in 0..<partyNumber {
        partyMember.insert(fileIO.readInt())
    }
    
    parties.append(partyMember)
}

while true {
    let temp = knowTruth
    knowTruth.forEach { member in
        parties.forEach { party in
            if party.contains(member) {
                party.forEach { mem in
                    knowTruth.insert(mem)
                }
            }
        }
    }
    
    if temp == knowTruth {
        break
    }
}

var count = 0
parties.forEach { party in
knowTruthLoop: for member in knowTruth {
        if party.contains(member) {
            count += 1
            break knowTruthLoop
        }
    }
}
print(m - count)

