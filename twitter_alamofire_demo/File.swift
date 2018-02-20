//
//  File.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/19/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation
import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
