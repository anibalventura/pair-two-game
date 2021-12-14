//
//  ContentView.swift
//  PairTwo
//
//  Created by Anibal Ventura on 13/12/21.
//

import SwiftUI

struct PairTwoView: View {
    @State private var tabSelection: String = Tabs.emojis.rawValue
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                EmojiSetsView()
                    .tag(Tabs.emojis)
                    .tabItem {
                        Image(systemName: "face.smiling.fill")
                        Text(Tabs.emojis.rawValue)
                    }
                
                ScoresView()
                    .tag(Tabs.scores)
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text(Tabs.scores.rawValue)
                    }
            }
        }
    }
    
    enum Tabs: String {
        case emojis = "Emojis"
        case scores = "Scores"
    }
}

struct ParTwoView_Previews: PreviewProvider {
    static var previews: some View {
        PairTwoView()
            .preferredColorScheme(.dark)
        
        PairTwoView()
            .preferredColorScheme(.light)
    }
}
