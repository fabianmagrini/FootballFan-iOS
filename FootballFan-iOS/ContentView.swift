//
//  ContentView.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 24/12/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = PostStore()
    
    var body: some View {
        List(store.posts, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.feed)
            }
        }.onAppear(perform: self.store.fetchPosts)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
