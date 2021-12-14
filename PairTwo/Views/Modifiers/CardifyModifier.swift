//
//  CardifyView.swift
//  Memorize
//
//  Created by Anibal Ventura on 13/12/21.
//

import SwiftUI

struct CardifyModifier: ViewModifier, Animatable {
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // In degrees.
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: ViewConstants.cardCornerRadius)
            
            if rotation < 90 {
                shape
                    .fill()
                    .foregroundColor(.white)
                
                shape
                    .strokeBorder(lineWidth: ViewConstants.cardLineWidth)
            } else {
                shape.fill()
            }
            
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private struct ViewConstants {
        static let cardCornerRadius: CGFloat = 10
        static let cardLineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(CardifyModifier(isFaceUp: isFaceUp))
    }
}
