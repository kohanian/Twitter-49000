//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var profile_image_url: String
    var screen_name: String
    var followers_count: Int
    var favourites_count: Int
    var friends_count: Int
    var description: String?
    var statuses_count: Int
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        profile_image_url = dictionary["profile_image_url"] as! String
        screen_name = dictionary["screen_name"] as! String
        followers_count = dictionary["followers_count"] as! Int
        favourites_count = dictionary["favourites_count"] as! Int
        friends_count = dictionary["friends_count"] as! Int
        description = dictionary["description"] as? String
        statuses_count = dictionary["statuses_count"] as! Int
    }
}
