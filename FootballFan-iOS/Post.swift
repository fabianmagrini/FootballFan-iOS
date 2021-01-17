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
    
    func postedAt() -> String {
        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: self.updatedAt)
        
        if (date == nil) {
            return ""
        }
        
        return date!.getElapsedInterval()
        
    }
}

extension Date {
    func getElapsedInterval() -> String {

        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())

        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" :
                "\(hour)" + " " + "hours ago"
        } else {
            return "a moment ago"

        }
    }
}
