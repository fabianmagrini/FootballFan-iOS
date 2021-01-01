//
//  FootballFanAPI.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 27/12/20.
//

import Foundation

class FootballFanAPI {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
            self.session = session
    }
    
    func fetchPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        guard let url = URL(string: "https://afternoon-gorge-60512.herokuapp.com/api/posts") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, nil)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(posts, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
}
