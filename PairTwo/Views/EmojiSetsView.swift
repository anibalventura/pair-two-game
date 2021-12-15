//
//  EmojiSetsView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct EmojiSetsView: View {
    @ObservedObject private var emojiSetViewModel: EmojiSetViewModel = EmojiSetViewModel()
    @State private var showAddEditSheet: Bool = false
    @State private var itemToEdit: EmojiSetItem?
    
    var body: some View {
        NavigationView {
            List(emojiSetViewModel.sets.sorted()) { emojiSet in
                NavigationLink(destination: GameView(GameViewModel(emojiSet))) {
                    VStack(alignment: .leading) {
                        Text(emojiSet.name)
                            .font(.title3)
                            .bold()
                            .foregroundColor(emojiSet.color)
                        
                        Spacer(minLength: ViewContants.spacerLength)
                        
                        HStack {
                            Text(emojiSet.emojis.joined(separator: " "))
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.bottom, 4)
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        showAddEditSheet.toggle()
                        itemToEdit = emojiSet
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.orange)
                    
                    Button(role: .destructive) {
                        withAnimation(Animation.linear) {
                            emojiSetViewModel.delete(emojiSet)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            }
            .navigationTitle("Pair Two")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddEditSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddEditSheet, onDismiss: { itemToEdit = nil }) {
            AddEmojiSetView(viewModel: emojiSetViewModel, itemToEdit: itemToEdit)
        }
    }
    
    private struct ViewContants {
        static let spacerLength: CGFloat = 5
    }
}

struct EmojiSetsView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSetsView()
            .preferredColorScheme(.dark)
        
        EmojiSetsView()
            .preferredColorScheme(.light)
    }
}
