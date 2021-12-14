//
//  CardView.swift
//  Memorize
//
//  Created by Anibal Ventura on 11/26/21.
//

import SwiftUI

struct CardView: View {
    let card: CardItem

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text(card.content)
                    .font(Font.system(size: ViewConstants.cardFontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: ViewConstants.cardMatchAnimDuration).repeatForever(autoreverses: false), value: card.isMatched)
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (ViewConstants.cardFontSize / ViewConstants.cardFontScale)
    }
    
    private struct ViewConstants {
        static let cardFontScale: CGFloat = 0.7
        static let cardFontSize: CGFloat = 32
        static let cardMatchAnimDuration: Double = 1.5
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let cardDark = CardItem(isFaceUp: false, content: "💩")
        
        CardView(card: cardDark)
            .preferredColorScheme(.dark)
            .frame(
                width: PreviewConstants.width,
                height: PreviewConstants.height)
            .previewLayout(.sizeThatFits)
            .padding()
        
        let cardLight = CardItem(isFaceUp: true, content: "💩")

        CardView(card: cardLight)
            .preferredColorScheme(.light)
            .frame(
                width: PreviewConstants.width,
                height: PreviewConstants.height)
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
    private struct PreviewConstants {
        static let width: CGFloat = 150.0
        static let height: CGFloat = 150.0
    }
}
