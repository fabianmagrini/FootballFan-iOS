//
//  PostsViewModel.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 27/12/20.
//

import Foundation
import SwiftUI

final class PostsViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchPosts() {
        let footballFanAPI = FootballFanAPI()
        
        footballFanAPI.fetchPosts() { (posts, error) in
            guard error == nil else {
                return
            }
            
            guard let posts = posts else {
                return
            }
            
            self.posts += posts
        }
    }
    
    init() {
        fetchPosts()
    }
}
