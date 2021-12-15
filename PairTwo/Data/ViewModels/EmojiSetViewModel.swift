//
//  EmojiSetViewModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation

class EmojiSetViewModel: ObservableObject {
    @Published private(set) var emojiSets: EmojiSets = EmojiSets()
    
    // MARK: - Intent(s)
    
    func add(_ emojiSet: EmojiSetItem) {
        emojiSets.add(emojiSet)
    }
    
    func edit(_ emojiSet: EmojiSetItem) {
        emojiSets.edit(emojiSet)
    }
    
    func delete(_ emojiSet: EmojiSetItem) {
        emojiSets.delete(emojiSet)
    }
}
