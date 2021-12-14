//
//  EmojiSetsView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct EmojiSetsView: View {
    private let emojiSets: [EmojiSet] = [
        EmojiSet(
            name: "Cars",
            color: .blue,
            emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑"]
        ),
        EmojiSet(
            name: "Objects",
            color: .brown,
            emojis: ["📁", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"]
        )
    ]
    
    var body: some View {
        NavigationView {
            List(emojiSets) { emojiSet in
                NavigationLink(destination: GameView(GameViewModel(emojiSet))) {
                    VStack(alignment: .leading) {
                        Text(emojiSet.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(emojiSet.color)
                        
                        Spacer(minLength: ViewContants.spacerLength)
                        
                        HStack {
                            ForEach(emojiSet.emojis, id: \.self) { emoji in
                                Text(emoji)
                            }
                        }
                    }
                }
                .padding(.bottom, 3)
            }
            .navigationTitle("Pair Two")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addEmojiSet) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private struct ViewContants {
        static let spacerLength: CGFloat = 4
    }
    
    private func addEmojiSet() {
        
    }
}

struct EmojiSetsView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSetsView()
    }
}
