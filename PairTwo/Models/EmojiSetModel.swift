//
//  EmojiSetModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation
import SwiftUI

struct EmojiSetItem: Identifiable, Comparable {
    var id: UUID = UUID()
    var name: String
    var color: Color
    var pairCount: Int
    var emojis: [String]
    
    static func < (lhs: EmojiSetItem, rhs: EmojiSetItem) -> Bool {
        lhs.name < rhs.name
    }
}

struct EmojiSets {
    private(set) var sets: [EmojiSetItem] = [
        EmojiSetItem(
            name: "Random",
            color: .red,
            pairCount: 12,
            emojis: ["πΆ", "π±", "π­", "π", "π±", "π²", "π»", "π", "π",
                     "π", "π", "πΉ", "π", "π", "π", "π»", "πΌ", "π¨",
                     "π", "π", "π", "π", "π", "β", "β¨οΈ", "π¨", "π±"]
        ),
        EmojiSetItem(
            name: "Animals",
            color: .yellow,
            pairCount: 3,
            emojis: ["πΆ", "π±", "π­", "πΉ", "π°", "π¦", "π»", "πΌ", "π¨"]
        ),
        EmojiSetItem(
            name: "Fruits",
            color: .green,
            pairCount: 5,
            emojis: ["π", "π", "π", "π", "π", "π", "π", "π", "π"]
        ),
        EmojiSetItem(
            name: "Vehicles",
            color: .blue,
            pairCount: 7,
            emojis: ["π", "π", "π", "π", "π", "π", "π", "π", "π²"]
        ),
        EmojiSetItem(
            name: "Sports",
            color: .orange,
            pairCount: 6,
            emojis: ["β½οΈ", "π", "π", "βΎοΈ", "πΎ", "π", "π", "π±", "π"]
        )
    ]
    
    mutating func add(_ emojiSet: EmojiSetItem) {
        sets.append(emojiSet)
    }
    
    mutating func edit(_ emojiSet: EmojiSetItem) {
        sets = sets.map { $0.id == emojiSet.id ? emojiSet : $0 }
    }
    
    mutating func delete(_ emojiSet: EmojiSetItem) {
        if let index = sets.firstIndex(of: emojiSet) {
            sets.remove(at: index)
        }
    }
}
