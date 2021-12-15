//
//  EmojiSetViewModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation

class EmojiSetViewModel: ObservableObject {
    @Published private var model: EmojiSets = EmojiSets()
    
    var sets: [EmojiSetItem] {
        return model.sets
    }
    
    // MARK: - Intent(s)
    
    func add(_ emojiSet: EmojiSetItem) {
        model.add(emojiSet)
    }
    
    func edit(_ emojiSet: EmojiSetItem) {
        model.edit(emojiSet)
    }
    
    func delete(_ emojiSet: EmojiSetItem) {
        model.delete(emojiSet)
    }
}
