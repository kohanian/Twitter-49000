//
//  Entities.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class Entities {
    // MARK: Properties
    var media: [Media]
    // MARK: - Create initializer with dictionary
    init(dictionary: [String: Any]) {
        media = dictionary["media"] as! [Media]
    }
}
