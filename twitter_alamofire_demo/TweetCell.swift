//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage
import DateToolsSwift

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetLikeBtn: UIButton!
    @IBOutlet weak var tweetRetweetBtn: UIButton!
    @IBOutlet weak var tweetUserName: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetUserImageView: UIImageView!
    
    @IBOutlet weak var tweetRetweetCount: UILabel!
    @IBOutlet weak var tweetReplyCount: UILabel!
    @IBOutlet weak var tweetScreenName: UILabel!
    @IBOutlet weak var tweetDateCreate: UILabel!
    @IBOutlet weak var tweetLikeCount: UILabel!
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            print(tweet.user.profile_image_url)
            let url = URL(string: tweet.user.profile_image_url)
            tweetUserImageView.af_setImage(withURL: url!)
            tweetUserName.text = tweet.user.name
            tweetDateCreate.text = tweet.createAtDate.shortTimeAgoSinceNow
            tweetScreenName.text = "@" + tweet.user.screen_name
            let repCount = tweet.replyCount ?? 0
            tweetReplyCount.text = "\(repCount)"
            
            let retweetCtn = tweet.retweetCount
            tweetRetweetCount.text = "\(retweetCtn)"
            
            let likeCtn = tweet.favoriteCount ?? 0
            tweetLikeCount.text = "\(likeCtn)"
            
            if(!tweet.retweeted) {
                tweetRetweetBtn.setImage(#imageLiteral(resourceName: "retweet-icon"), for: UIControlState.normal)
            }
            else {
                tweetRetweetBtn.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
            }
            
            if(!tweet.favorited!) {
                tweetLikeBtn.setImage(#imageLiteral(resourceName: "favor-icon"), for: UIControlState.normal)
            }
            else {
                tweetLikeBtn.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
            }
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        if(tweet.retweeted) {
            tweet.retweeted = false
            tweet.retweetCount = tweet.retweetCount - 1
            tweetRetweetCount.text = "\(tweet.retweetCount)"
            tweetRetweetBtn.setImage(#imageLiteral(resourceName: "retweet-icon"), for: UIControlState.normal)
            APIManager.shared.unRetweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else {
            tweet.retweeted = true
            tweet.retweetCount = tweet.retweetCount + 1
            tweetRetweetCount.text = "\(tweet.retweetCount)"
            tweetRetweetBtn.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    
    @IBAction func onFavorite(_ sender: Any) {
        if(tweet.favorited)! {
            tweet.favorited = false
            tweet.favoriteCount = tweet.favoriteCount! - 1
            tweetLikeCount.text = "\(tweet.favoriteCount ?? 0)"
            tweetLikeBtn.setImage(#imageLiteral(resourceName: "favor-icon"), for: UIControlState.normal)
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else {
            tweet.favorited = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
            tweetLikeCount.text = "\(tweet.favoriteCount ?? 0)"
            tweetLikeBtn.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    
    
    
}
