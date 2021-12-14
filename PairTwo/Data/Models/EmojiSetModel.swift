//
//  EmojiSetModel.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation
import SwiftUI

struct EmojiSet: Identifiable {
    let id: UUID = UUID()
    var name: String
    var color: Color
    var emojis: [String]
}
