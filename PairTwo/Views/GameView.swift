//
//  GameView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var gameViewModel: GameViewModel
    
    init(_ gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    
    @State private var gameCompleteAlert: Bool = false
    
    var body: some View {
        VStack {
            AspectVGridView(items: gameViewModel.cards, aspectRatio: ViewConstants.gridAspectRatio) { card in
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
                                gameCompleteAlert = gameViewModel.allCardsFaceUp()
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
        .alert("Congratulations! Scrore: \(gameViewModel.getScore())", isPresented: $gameCompleteAlert) {
            Button("Ok", role: .cancel) {
                gameViewModel.restart()
                presentationMode.wrappedValue.dismiss()
            }
            Button("New game") {
                withAnimation {
                    gameViewModel.restart()
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
        let previreGameViewModel = GameViewModel(EmojiSetItem(
            name: "Random",
            color: .red,
            pairCount: 12,
            emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨",
                     "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓",
                     "📁", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"]
        ))
        
        GameView(previreGameViewModel)
            .preferredColorScheme(.dark)
        
        GameView(previreGameViewModel)
            .preferredColorScheme(.light)
    }
}
