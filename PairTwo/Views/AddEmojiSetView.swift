//
//  AddEmojiSetView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI
import Foundation

struct AddEmojiSetView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel: EmojiSetViewModel
    private var itemToEdit: EmojiSetItem?
    
    @State private var name: String
    @State private var emojisInSet: [String]
    @State private var newEmojis: String = ""
    @State private var pairCount: Int
    @State private var color: Color
    
    init(viewModel: EmojiSetViewModel, itemToEdit: EmojiSetItem?) {
        self.viewModel = viewModel
        self.itemToEdit = itemToEdit
        
        self._name = State(initialValue: itemToEdit?.name ?? "")
        self._emojisInSet = State(initialValue: itemToEdit?.emojis ?? [])
        self._pairCount = State(initialValue: itemToEdit?.pairCount ?? 0)
        self._color = State(initialValue: itemToEdit?.color ?? .red)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(Locale.AddSetView.set)) {
                    TextField(Locale.AddSetView.insertName, text: $name)
                    
                    if itemToEdit != nil {
                        Stepper(Locale.AddSetView.pairsCount(pairCount), value: $pairCount, in: 0...emojisInSet.count)
                    }
                    
                    ColorPicker(Locale.AddSetView.color, selection: $color, supportsOpacity: false)
                }
                
                if itemToEdit != nil {
                    Section(header: Text(Locale.AddSetView.emojisList)) {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                            ForEach(emojisInSet, id: \.self) { emoji in
                                Text(emoji)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            if let index = emojisInSet.firstIndex(of: emoji) {
                                                emojisInSet.remove(at: index)
                                            }
                                        }
                                    }
                            }
                        }
                        .padding([.top, .bottom], 10)
                    }
                }
                
                Section(header: Text(Locale.AddSetView.addEmoji)) {
                    EmojiTextField(text: $newEmojis)
                }
            }
            .navigationTitle(itemToEdit != nil ? Locale.AddSetView.editSet : Locale.AddSetView.addSet)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Make keyboard dismissable with swipe down.
                UIScrollView.appearance().keyboardDismissMode = .interactive
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(Locale.AddSetView.cancel) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(Locale.AddSetView.save) {
                        saveItem()
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    private func saveItem() {
        let removeDuplicatedEmojis = self.newEmojis.squeezed.map { String($0) }
        let stringToArray = removeDuplicatedEmojis.map { String($0) }
        let emojisArray = stringToArray + self.emojisInSet
        let editedPairCount = emojisArray.count < self.pairCount ? emojisArray.count : self.pairCount
        
        // Edit item.
        if itemToEdit != nil {
            let newSet = EmojiSetItem(
                id: itemToEdit!.id,
                name: self.name,
                color: self.color,
                pairCount: editedPairCount,
                emojis: emojisArray)
            
            viewModel.edit(newSet)
        }
        // Save item.
        else {
            let newSet = EmojiSetItem(
                name: self.name,
                color: self.color,
                pairCount: emojisArray.count,
                emojis: emojisArray)
            
            viewModel.add(newSet)
        }
    }
}

struct AddEmojiSetView_Previews: PreviewProvider {
    static var previews: some View {
        let previewEmojiSetViewModel: EmojiSetViewModel = EmojiSetViewModel()
        let previewEmojiSet: EmojiSetItem = EmojiSetItem(
            name: "Random",
            color: .red,
            pairCount: 12,
            emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨",
                     "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓",
                     "📁", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"])

        AddEmojiSetView(viewModel: previewEmojiSetViewModel, itemToEdit: previewEmojiSet)
            .environment(\.locale, .init(identifier: "en"))
            .preferredColorScheme(.dark)

        AddEmojiSetView(viewModel: previewEmojiSetViewModel, itemToEdit: previewEmojiSet)
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "es"))
    }
}
