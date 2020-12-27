//
//  Post.swift
//  FootballFan-iOS
//
//  Created by Fabian Magrini on 27/12/20.
//

import Foundation

struct Post: Codable {
    var id: String
    var link: String
    var v: Int
    var createdAt: String
    var feed: String
    var rank: Int
    var title : String
    var updatedAt: String
    var votes: Int
    var status: String
    var age: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case link
        case v = "__v"
        case createdAt = "created_at"
        case feed, rank, title
        case updatedAt = "updated_at"
        case votes, status, age
    }
}
