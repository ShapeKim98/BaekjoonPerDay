//
//  main.swift
//  Num1108
//
//  Created by 김도형 on 2023/01/15.
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

class Link: Hashable {
    var id: String
    let baseScore: Int = 1
    var connectedLink = Set<Link>()
    
    init(id: String) {
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id.hashValue)
    }
    
    static func == (lhs: Link, rhs: Link) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func linkScore() -> Int {
        var score: Int = 0
        
        for link in connectedLink {
            if !link.findLink(self) {
                score += link.linkScore()
            }
        }
        score += self.baseScore
        
        return score
    }
    
    func findLink(_ link: Link) -> Bool {
        if connectedLink.contains(link) {
            return true
        } else {
            if connectedLink.isEmpty {
                return false
            } else {
                for memberLink in connectedLink {
                    if memberLink.findLink(link) {
                        return true
                    }
                }
            }
            
            return false
        }
    }
}

let fileIO = FileIO()
let n = fileIO.readInt()
var links = Set<Link>()

for _ in 0..<n {
    let id = fileIO.readString()
    let link = Link(id: id)
    
    for _ in 0..<fileIO.readInt() {
        let newLink = Link(id: fileIO.readString())
        
        if links.contains(newLink) {
            links.forEach { memberLink in
                if memberLink.id == newLink.id {
                    link.connectedLink.insert(memberLink)
                }
            }
        } else {
            links.insert(newLink)
            link.connectedLink.insert(newLink)
        }
    }
    
    if links.contains(link) {
        links.forEach { memberLink in
            if memberLink.connectedLink.contains(link) {
                memberLink.connectedLink.update(with: link)
            }
        }
        links.update(with: link)
    } else {
        links.insert(link)
    }
}

let id = fileIO.readString()

for link in links {
    if link.id == id {
        print(link.linkScore())
        break
    }
}
