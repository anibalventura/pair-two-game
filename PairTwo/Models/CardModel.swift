//
//  CardModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation

struct CardItem: Identifiable {
    let id: UUID = UUID()
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    let content: String
}

struct Cards {
    private(set) var cards: [CardItem]
    private(set) var score: Int
    
    private var indexOfFisrtCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> String) {
        cards = []
        score = 0
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: String = createCardContent(pairIndex)
            cards.append(CardItem(content: content))
            cards.append(CardItem(content: content))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(_ card: CardItem) {
        if let chosenIndex =
            cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFisrtCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 3
                }
                
                cards[chosenIndex].isFaceUp.toggle()
                
                if score > 0 {
                    score -= 1
                }
            } else {
                indexOfFisrtCard = chosenIndex
            }
        }
    }
    
    mutating func allCardsFaceUp() -> Bool {
        var allFaceUp = [Bool]()
        
        cards.forEach { card in
            allFaceUp.append(card.isMatched)
        }
        
        return allFaceUp.allSatisfy { $0 == true }
    }
}
