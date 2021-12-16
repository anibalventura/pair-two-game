//
//  Localizations.swift
//  PairTwo
//
//  Created by Anibal Ventura on 16/12/21.
//

import SwiftUI

enum Localization {
    /* Emoji Sets View. */
    
    static let appName: LocalizedStringKey = LocalizedStringKey("app-name")
    static let delete: LocalizedStringKey = LocalizedStringKey("delete")
    static let edit: LocalizedStringKey = LocalizedStringKey("edit")
    
    /* Add Emoji Set View */
    
    static let set: LocalizedStringKey = LocalizedStringKey("set")
    static let insertName: LocalizedStringKey = LocalizedStringKey("insert-name")
    static let color: LocalizedStringKey = LocalizedStringKey("color")
    static let emojisList: LocalizedStringKey = LocalizedStringKey("emojis-list")
    static let addEmoji: LocalizedStringKey = LocalizedStringKey("add-emoji")
    static let addSet: LocalizedStringKey = LocalizedStringKey("add-set")
    static let editSet: LocalizedStringKey = LocalizedStringKey("edit-set")
    static let cancel: LocalizedStringKey = LocalizedStringKey("cancel")
    static let save: LocalizedStringKey = LocalizedStringKey("save")
    
    static func pairsCount(_ value: Int) -> LocalizedStringKey { LocalizedStringKey("pairs-count \(value)") }
    
    /* Game View */
    
    static let restart: LocalizedStringKey = LocalizedStringKey("restart")
    static let ok: LocalizedStringKey = LocalizedStringKey("ok")
    static let newGame: LocalizedStringKey = LocalizedStringKey("new-game")
    
    static func score(_ value: Int) -> LocalizedStringKey { LocalizedStringKey("score \(value)") }
    static func congratulations(_ value: Int) -> LocalizedStringKey { LocalizedStringKey("congratulations \(value)") }
}
