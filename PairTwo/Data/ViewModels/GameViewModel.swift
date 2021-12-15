//
//  GameViewModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var cardsSet: Cards
    private(set) var emojiSet: EmojiSetItem
    
    init(_ emojiSet: EmojiSetItem) {
        cardsSet = Cards(numberOfPairsOfCards: emojiSet.pairCount) { pairIndex in
            emojiSet.emojis[pairIndex]
        }
        
        self.emojiSet = emojiSet
    }
    
    var cards: [CardItem] {
        return cardsSet.cards
    }
    
    // MARK: - Intent(s)
    
    func restart() {
        cardsSet = Cards(numberOfPairsOfCards: emojiSet.pairCount) { pairIndex in
            emojiSet.emojis[pairIndex]
        }
    }
    
    func choose(_ card: CardItem) {
        cardsSet.choose(card)
    }
    
    func getScore() -> Int {
        cardsSet.score
    }
    
    func allCardsFaceUp() -> Bool {
        cardsSet.allCardsFaceUp()
    }
}
