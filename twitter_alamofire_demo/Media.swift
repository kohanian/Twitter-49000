//
//  Media.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class Media {
    // MARK: Properties
    var media_url_https: String
    var media_url: String
    var display_url: String
    
    // MARK: - Create initializer with dictionary
    init(dictionary: [String: Any]) {
        media_url_https = dictionary["media_url_https"] as! String
        media_url = dictionary["media_url"] as! String
        display_url = dictionary["display_url"] as! String
    }
}
