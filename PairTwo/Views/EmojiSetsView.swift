//
//  EmojiSetsView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import SwiftUI

struct EmojiSetsView: View {
    @ObservedObject private var emojiSetViewModel: EmojiSetViewModel = EmojiSetViewModel()
    @State private var showAddSet: Bool = false
    @State private var setToEdit: EmojiSetItem?
    
    var body: some View {
        NavigationView {
            List(emojiSetViewModel.emojiSets.sets) { emojiSet in
                NavigationLink(destination: GameView(GameViewModel(emojiSet))) {
                    VStack(alignment: .leading) {
                        Text(emojiSet.name)
                            .font(.title3)
                            .bold()
                            .foregroundColor(emojiSet.color)
                        
                        Spacer(minLength: ViewContants.spacerLength)
                        
                        HStack {
                            ForEach(emojiSet.emojis, id: \.self) { emoji in
                                Text(emoji)
                            }
                        }
                    }
                }
                .padding(.bottom, 3)
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        setToEdit = emojiSet
                        showAddSet.toggle()
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
                        showAddSet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSet) {
                AddEmojiSetView(viewModel: emojiSetViewModel, setToEdit: setToEdit)
            }
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
