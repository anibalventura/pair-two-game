//
//  EmojiSetModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation
import SwiftUI

struct EmojiSetItem: Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
    var color: Color
    var pairCount: Int
    var emojis: [String]
}

struct EmojiSets {
    private(set) var sets: [EmojiSetItem] = [
        EmojiSetItem(
            name: "Random",
            color: .red,
            pairCount: 12,
            emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨",
                     "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓",
                     "📁", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"]
        ),
        EmojiSetItem(
            name: "Animals",
            color: .yellow,
            pairCount: 3,
            emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨"]
        ),
        EmojiSetItem(
            name: "Fruits",
            color: .green,
            pairCount: 5,
            emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓"]
        ),
        EmojiSetItem(
            name: "Vehicles",
            color: .blue,
            pairCount: 7,
            emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚲"]
        ),
        EmojiSetItem(
            name: "Sports",
            color: .orange,
            pairCount: 6,
            emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓"]
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
