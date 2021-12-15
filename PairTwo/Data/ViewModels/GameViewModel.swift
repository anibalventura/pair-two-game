//
//  GameViewModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published private(set) var cardsSet: Cards
    private(set) var emojiSet: EmojiSetItem
    
    init(_ emojiSet: EmojiSetItem) {
        cardsSet = Cards(numberOfPairsOfCards: emojiSet.pairCount) { pairIndex in
            emojiSet.emojis[pairIndex]
        }
        
        self.emojiSet = emojiSet
    }
    
    // MARK: - Intent(s)
    
    func restart() {
        cardsSet = Cards(numberOfPairsOfCards: emojiSet.emojis.count) { pairIndex in
            emojiSet.emojis[pairIndex]
        }
    }
    
    func choose(_ card: CardItem) {
        cardsSet.choose(card)
    }
    
    func getScore() -> Int {
        cardsSet.score
    }
}
