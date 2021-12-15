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
    private var setToEdit: EmojiSetItem?
    
    @State private var name: String
    @State private var emojis: [String]
    @State private var newEmojis: String = ""
    @State private var pairCount: Int
    @State private var color: Color
    
    init(viewModel: EmojiSetViewModel, setToEdit: EmojiSetItem?) {
        self.viewModel = viewModel
        self.setToEdit = setToEdit
        
        self._name = State(initialValue: setToEdit?.name ?? "")
        self._emojis = State(initialValue: setToEdit?.emojis ?? [])
        self._pairCount = State(initialValue: setToEdit?.pairCount ?? 0)
        self._color = State(initialValue: setToEdit?.color ?? .red)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Set name")) {
                    TextField("Name", text: $name)
                }
                
                if setToEdit != nil {
                    Section(header: Text("Emojis - Tap to remove")) {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                            ForEach(emojis, id: \.self) { emoji in
                                Text(emoji)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            if let index = emojis.firstIndex(of: emoji) {
                                                emojis.remove(at: index)
                                            }
                                        }
                                    }
                            }
                        }
                        .padding([.top, .bottom], 10)
                    }
                }
                
                Section(header: Text("Add emoji")) {
                    EmojiTextField(text: $newEmojis, placeholder: "Emoji")
                }
                
                if setToEdit != nil {
                    Section(header: Text("Pairs count")) {
                        Stepper("\(pairCount) Pairs", value: $pairCount, in: 0...emojis.count)
                    }
                }
                
                Section(header: Text("Color")) {
                    ColorPicker("Set color", selection: $color, supportsOpacity: false)
                }
            }
            .navigationTitle("Emoji set")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Make keyboard dismissable with swipe down.
                UIScrollView.appearance().keyboardDismissMode = .interactive
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", action: done)
                }
            }
        }
    }
    
    private func done() {
        let emojisWiouthDuplicates = self.newEmojis.squeezed.map { String($0) }
        let emojisArray = emojisWiouthDuplicates.map { String($0) }
        let finalEmojis = emojisArray + self.emojis
        
        if setToEdit != nil {
            let newSet = EmojiSetItem(
                id: setToEdit!.id,
                name: self.name,
                color: self.color,
                pairCount: finalEmojis.count < self.pairCount ? finalEmojis.count : self.pairCount,
                emojis: finalEmojis)
            
            viewModel.edit(newSet)
        } else {
            let newSet = EmojiSetItem(
                name: self.name,
                color: self.color,
                pairCount: finalEmojis.count,
                emojis: finalEmojis)
            
            viewModel.add(newSet)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddEmojiSetView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: EmojiSetViewModel = EmojiSetViewModel()

        AddEmojiSetView(viewModel: viewModel, setToEdit: DataPreview.emojiSet)
            .preferredColorScheme(.dark)

        AddEmojiSetView(viewModel: viewModel, setToEdit: DataPreview.emojiSet)
            .preferredColorScheme(.light)
    }
}
