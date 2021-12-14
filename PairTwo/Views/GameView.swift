//
//  GameView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    init(_ gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    
    var body: some View {
        VStack {
            AspectVGridView(items: gameViewModel.cardsSet.cards, aspectRatio: ViewConstants.gridAspectRatio) { card in
                if card.isMatched && !card.isFaceUp {
                    Color.clear
                } else {
                    CardView(card: card)
                        .foregroundColor(gameViewModel.emojiSet.color)
                        .padding(ViewConstants.cardPadding)
                        .transition(.scale)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: ViewConstants.chooseAnimDuration)) {
                                gameViewModel.choose(card)
                            }
                        }
                }
            }
            
            Spacer()
            
            Text("Score: \(gameViewModel.getScore())")
                .font(.title2)
                .padding()
        }
        .navigationTitle("\(gameViewModel.emojiSet.name)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Restart") {
                    withAnimation(Animation.spring()) {
                        gameViewModel.restart()
                    }
                }
            }
        }
    }
    
    private struct ViewConstants {
        static let gridAspectRatio: CGFloat = 1
        static let cardPadding: CGFloat = 5
        static let chooseAnimDuration: Double = 1
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameViewModel = GameViewModel(DataPreview.emojiSet)
        
        GameView(gameViewModel)
            .preferredColorScheme(.dark)
        
        GameView(gameViewModel)
            .preferredColorScheme(.light)
    }
}
