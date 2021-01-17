//
//  PostsView.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 24/12/20.
//

import SwiftUI

struct PostsView: View {
    @StateObject var viewModel = PostsViewModel()
 
    var body: some View {
        List(viewModel.posts, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text("\(item.postedAt()) (\(item.feed))")
            }
        }
        .navigationTitle("Posts")
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
