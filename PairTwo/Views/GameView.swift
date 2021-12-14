//
//  GameView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct GameView: View {
    private let emojiSet: EmojiSet
    
    init(_ emojiSet: EmojiSet) {
        self.emojiSet = emojiSet
    }
    
    var body: some View {
        Text("Game View")
            .navigationTitle(emojiSet.name)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(EmojiSet(name: "Cars"))
    }
}
