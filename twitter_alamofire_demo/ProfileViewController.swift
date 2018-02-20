//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/19/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var followersCount: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var tweetCount: UILabel!
    
    @IBOutlet weak var descText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        APIManager.shared.getCurrentAccount() { (user: User?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let user = user {
                self.nameLabel.text = user.name
                self.screenNameLabel.text = "@\(user.screen_name)"
                self.followersCount.text = "\(user.followers_count)"
                self.followingCount.text = "\(user.friends_count)"
                self.profileImageView.af_setImage(withURL: URL(string: user.profile_image_url)!)
                self.tweetCount.text = "\(user.statuses_count)"
                self.descText.text = user.description
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
