//
//  Tweet.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class Tweet {
    
    // MARK: Properties
    var id: Int64 // For favoriting, retweeting & replying
    var text: String // Text content of tweet
    var favoriteCount: Int? // Update favorite count label
    var favorited: Bool? // Configure favorite button
    var retweetCount: Int // Update favorite count label
    var retweeted: Bool // Configure retweet button
    var replyCount: Int?
    var user: User // Contains name, screenname, etc. of tweet author
    var createdAtString: String // Display date
    var createAtDate: Date
//    var entities: Entities
    // MARK: - Create initializer with dictionary
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! Int64
        text = dictionary["text"] as! String
        favoriteCount = dictionary["favorite_count"] as? Int
        favorited = dictionary["favorited"] as? Bool
        retweetCount = dictionary["retweet_count"] as! Int
        retweeted = dictionary["retweeted"] as! Bool
        replyCount = dictionary["reply_count"] as? Int
//        entities = dictionary["entities"] as! Entities
        
        let user = dictionary["user"] as! [String: Any]
        self.user = User(dictionary: user)
        
        createdAtString = dictionary["created_at"] as! String
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM d HH:mm:ss Z y"
        createAtDate = formatter.date(from: createdAtString)!
        
    }
}

