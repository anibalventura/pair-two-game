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
            
            Text(Localization.score(gameViewModel.getScore()))
                .font(.title2)
                .padding()
        }
        .navigationTitle("\(gameViewModel.emojiSet.name)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(Localization.restart) {
                    withAnimation(Animation.spring()) {
                        gameViewModel.restart()
                    }
                }
            }
        }
        .alert(Localization.congratulations(gameViewModel.getScore()), isPresented: $gameCompleteAlert) {
            Button(Localization.ok, role: .cancel) {
                gameViewModel.restart()
                presentationMode.wrappedValue.dismiss()
            }
            Button(Localization.newGame) {
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
            .environment(\.locale, .init(identifier: "en"))
            .preferredColorScheme(.dark)
        
        GameView(previreGameViewModel)
            .environment(\.locale, .init(identifier: "es"))
            .preferredColorScheme(.light)
    }
}
