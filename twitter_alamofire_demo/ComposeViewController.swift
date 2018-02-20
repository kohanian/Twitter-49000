//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Kyle Ohanian on 2/19/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: UITextView!
    var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var placeholder: UILabel!
    @IBOutlet weak var strSizeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.delegate = self
        placeholder.isHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if(textView.text.count == 0) {
            placeholder.isHidden = false
        }
        else {
            placeholder.isHidden = true
        }
        if(textView.text.count > 140) {
            strSizeLabel.textColor = UIColor.red
        }
        else {
            strSizeLabel.textColor = UIColor.black
        }
        strSizeLabel.text = "\(textView.text.count)"
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
