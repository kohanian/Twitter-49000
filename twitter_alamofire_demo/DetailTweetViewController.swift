//
//  DetailTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/19/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailTweetViewController: UIViewController {
    
    
    @IBOutlet weak var userScreenNameTextView: UILabel!
    @IBOutlet weak var userNameTextView: UILabel!
    var tweet: Tweet?
    @IBOutlet weak var userTweetImageView: CircleImageView!
    
    @IBOutlet weak var tweetText: UILabel!
    
    @IBOutlet weak var tweetTimeText: UILabel!
    
    @IBOutlet weak var retweetCountText: UILabel!
    
    @IBOutlet weak var tweetPicView: UIImageView!
    @IBOutlet weak var likesCountText: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: TweetDetailDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTweetImageView.af_setImage(withURL: URL(string: (tweet?.user.profile_image_url)!)!)
//        tweetPicView.af_setImage(withURL: URL(string: (tweet?.entities.media[0].media_url)!)!)
        userNameTextView.text = tweet?.user.name
        userScreenNameTextView.text = "@\(tweet?.user.screen_name ?? "N/A")"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yy, hh:mm a"
        tweetText.text = "\(tweet?.text ?? "N/A")"
        let date = tweet?.createAtDate
        tweetTimeText.text = "\(dateFormatterPrint.string(from: date!))"
        retweetCountText.text = "\(tweet?.retweetCount ?? 0)"
        likesCountText.text = "\(tweet?.favoriteCount ?? 0)"
        
        if(tweet?.retweeted)! {
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
        }
        if(tweet?.favorited)! {
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        if(tweet?.retweeted)! {
            tweet?.retweeted = false
            tweet?.retweetCount = (tweet?.retweetCount)! - 1
            retweetCountText.text = "\(tweet?.retweetCount ?? 0)"
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: UIControlState.normal)
            APIManager.shared.unRetweet((tweet)!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else {
            tweet?.retweeted = true
            tweet?.retweetCount = (tweet?.retweetCount)! + 1
            retweetCountText.text = "\(tweet?.retweetCount ?? 0)"
            retweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: UIControlState.normal)
            APIManager.shared.retweet((tweet)!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        delegate?.tweetDetail()
    }
    
    @IBAction func onFavorite(_ sender: Any) {
        if(tweet?.favorited)! {
            tweet?.favorited = false
            tweet?.favoriteCount = (tweet?.favoriteCount)! - 1
            likesCountText.text = "\(tweet?.favoriteCount ?? 0)"
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon"), for: UIControlState.normal)
            APIManager.shared.unfavorite((tweet)!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else {
            tweet?.favorited = true
            tweet?.favoriteCount = (tweet?.favoriteCount)! + 1
            likesCountText.text = "\(tweet?.favoriteCount ?? 0)"
            favoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: UIControlState.normal)
            APIManager.shared.favorite((tweet)!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        delegate?.tweetDetail()
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
