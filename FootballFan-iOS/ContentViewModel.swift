//
//  ContentViewModel.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 27/12/20.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchPosts() {
        let footballFanService = FootballFanService()
        
        footballFanService.fetchPosts() { (posts, error) in
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
