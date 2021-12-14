//
//  EmojiSetsView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct EmojiSetsView: View {
    private let emojiSets: [EmojiSet] = [
        EmojiSet(name: "Cars"),
        EmojiSet(name: "Faces"),
    ]
    
    var body: some View {
        List(emojiSets) { emojiSet in
            NavigationLink(emojiSet.name, destination: GameView(emojiSet))
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
    
    private func addEmojiSet() {
        
    }
}

struct EmojiSetsView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSetsView()
    }
}
