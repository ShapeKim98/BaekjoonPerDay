//
//  main.swift
//  TheMostGift
//
//  Created by 김도형 on 3/21/24.
//

import Foundation

struct Friend: Hashable {
    let name: String
    var sended: [String: Int] = [:]
    var received: [String: Int] = [:]
    var giftScore: Int = 0
    var receiveCount: Int = 0
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var friendsList = Set<Friend>()
    friends.forEach { (name) in
        friendsList.insert(.init(name: name))
    }
    var giftDict: [String: Int] = [:]
    gifts.forEach { (gift) in
        if let count = giftDict[gift] {
            giftDict.updateValue(count + 1, forKey: gift)
        } else {
            giftDict.updateValue(1, forKey: gift)
        }
        
        if let sender = gift.split(separator: " ").first,
           let receiver = gift.split(separator: " ").last {
            if let friend = friendsList.first(where: { friend in
                friend.name == sender
            }) {
                var newFriend = friend
                if let count = friend.sended[String(receiver)] {
                    newFriend.sended.updateValue(count + 1, forKey: String(receiver))
                } else {
                    newFriend.sended.updateValue(1, forKey: String(receiver))
                }
                
                friendsList.remove(friend)
                friendsList.insert(newFriend)
            }
            
            if let friend = friendsList.first(where: { friend in
                friend.name == receiver
            }) {
                var newFriend = friend
                if let count = friend.received[String(sender)] {
                    newFriend.received.updateValue(count + 1, forKey: String(sender))
                } else {
                    newFriend.received.updateValue(1, forKey: String(sender))
                }
                
                friendsList.remove(friend)
                friendsList.insert(newFriend)
            }
        }
    }
    
    friendsList.forEach { friend in
        var newFriend = friend
        
        friend.received.values.forEach { count in
            newFriend.giftScore -= count
        }
        friend.sended.values.forEach { count in
            newFriend.giftScore += count
        }
        
        friendsList.remove(friend)
        friendsList.insert(newFriend)
    }
    
    friendsList.forEach { friend in
        var newFriend = friend
        
        friend.sended.forEach { key, value in
            let count = friend.received[key] ?? 0
            if value > count {
                newFriend.receiveCount += 1
            } else if value == count {
                if let receiver = friendsList.first(where: { friend in
                    return friend.name == key
                }) {
                    if friend.giftScore > receiver.giftScore {
                        newFriend.receiveCount += 1
                    }
                }
            }
        }
        
        friends.forEach { name in
            if !friend.sended.contains(where: { key, value in
                key == name
            }), !friend.received.contains(where: { key, value in
                key == name
            }) {
                if let receiver = friendsList.first(where: { friend in
                    return friend.name == name
                }) {
                    if friend.giftScore > receiver.giftScore {
                        newFriend.receiveCount += 1
                    }
                }
            }
        }
        
        friendsList.remove(friend)
        friendsList.insert(newFriend)
    }
    
    guard let result = friendsList.max(by: { lhs, rhs in
        return lhs.receiveCount < rhs.receiveCount
    })?.receiveCount else {
        return 0
    }
    
    print(result)
    
    return 0
}
