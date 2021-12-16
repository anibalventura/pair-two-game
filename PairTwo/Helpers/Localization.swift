//
//  Localizations.swift
//  PairTwo
//
//  Created by Anibal Ventura on 16/12/21.
//

enum Localization {
    /* Emoji Sets View. */
    
    static var appName: String {
        String(localized: "app-name", comment: "The name of the app.")
    }
    
    static var delete: String {
        String(localized: "delete", comment: "Delete button on swipe.")
    }
    
    static var edit: String {
        String(localized: "edit", comment: "Edit button on swipe.")
    }
    
    /* Add Emoji Set View */
    
    static var set: String {
        String(localized: "set", comment: "Header of first form group.")
    }
    
    static var insertName: String {
        String(localized: "insert-name", comment: "Placeholder for insert emoji set name.")
    }
    
    static func pairsCount(_ value: Int) -> String {
        String(localized: "pairs-count \(value)", comment: "The pluralized pairs count.")
    }
    
    static var color: String {
        String(localized: "color", comment: "Color of emoji set.")
    }
    
    static var emojisList: String {
        String(localized: "emojis-list", comment: "Header for the emojis in set.")
    }
    
    static var addEmoji: String {
        String(localized: "add-emoji", comment: "Header of add emoji section.")
    }
    
    static var insertEmojis: String {
        String(localized: "insert-emojis", comment: "Placeholder for insert emojis.")
    }
    
    static var addSet: String {
        String(localized: "add-set", comment: "Add emoji view title.")
    }
    
    static var editSet: String {
        String(localized: "edit-set", comment: "Edit emoji view title.")
    }
    
    static var cancel: String {
        String(localized: "cancel", comment: "Cancel edit/add toolbar button.")
    }
    
    static var save: String {
        String(localized: "save", comment: "Save edit/add toolbar button.")
    }
    
    /* Game View */
    
    static func score(_ value: Int) -> String {
        String.localizedStringWithFormat(String(localized: "score %lld", comment: "Score of the game."), value)
    }
    
    static var restart: String {
        String(localized: "restart", comment: "Restart game toolbar button.")
    }
    
    static func congratulations(_ value: Int) -> String {
        String.localizedStringWithFormat(String(localized: "congratulations %lld", comment: "Congratulations title alert with final score."), value)
    }
    
    static var ok: String {
        String(localized: "ok", comment: "Alert dialog Ok button.")
    }
    
    static var newGame: String {
        String(localized: "new-game", comment: "Alert dialog new game button.")
    }
}
