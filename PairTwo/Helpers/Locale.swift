//
//  Localizations.swift
//  PairTwo
//
//  Created by Anibal Ventura on 16/12/21.
//

import SwiftUI

struct Locale {
    static let appName: LocalizedStringKey = LocalizedStringKey("app-name")
    
    struct SetsView {
        static let delete: LocalizedStringKey = LocalizedStringKey("delete")
        static let edit: LocalizedStringKey = LocalizedStringKey("edit")
    }
    
    struct AddSetView {
        static let set: LocalizedStringKey = LocalizedStringKey("set")
        static let insertName: LocalizedStringKey = LocalizedStringKey("insert-name")
        static let color: LocalizedStringKey = LocalizedStringKey("color")
        static let emojisList: LocalizedStringKey = LocalizedStringKey("emojis-list")
        static let addEmoji: LocalizedStringKey = LocalizedStringKey("add-emoji")
        static let addSet: LocalizedStringKey = LocalizedStringKey("add-set")
        static let editSet: LocalizedStringKey = LocalizedStringKey("edit-set")
        static let cancel: LocalizedStringKey = LocalizedStringKey("cancel")
        static let save: LocalizedStringKey = LocalizedStringKey("save")
        
        static func pairsCount(_ value: Int) -> LocalizedStringKey {
            LocalizedStringKey("pairs-count \(value)")
        }
    }
    
    struct GameView {
        static let restart: LocalizedStringKey = LocalizedStringKey("restart")
        // swiftlint:disable:next identifier_name
        static let ok: LocalizedStringKey = LocalizedStringKey("ok")
        static let newGame: LocalizedStringKey = LocalizedStringKey("new-game")
        
        static func score(_ value: Int) -> LocalizedStringKey {
            LocalizedStringKey("score \(value)")
        }
        
        static func congratulations(_ value: Int) -> LocalizedStringKey {
            LocalizedStringKey("congratulations \(value)")
        }
    }
}
